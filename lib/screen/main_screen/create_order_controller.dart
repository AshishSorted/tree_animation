import 'dart:convert';

import 'package:flutter/material.dart' as M;
import 'package:formz/formz.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../common/strings.dart';
import '../../model/api_result.dart';
import '../../model/user.dart';
import '../../network/service_exception.dart';
import '../../repo/order_repo.dart';
import '../../utils/logger.dart';
import 'address_controller.dart';
import 'inventory_controller.dart';
import 'model/address.dart';
import 'model/cart_request_model.dart';
import 'model/cart_response_model.dart';
import 'model/create_order_request_model.dart';
import 'model/create_order_response_model.dart';
import 'model/inventory.dart';
import 'model/slot.dart';
import 'model/society.dart';
import 'model/update_cart_request.dart';
import 'model/user_wallet_info.dart';

class CreateOrderController extends GetxController {
  Rx<FormzStatus> formzStatus = FormzStatus.pure.obs;
  Rxn<User> user = Rxn<User>();
  Rx<String> userdetails = ''.obs;
  Rx<int> storeId = 0.obs;
  RxList<String> skuCodeList = <String>[].obs;
  M.TextEditingController dateText = M.TextEditingController();
  Rxn<Address> address = Rxn<Address>();
  Rxn<CreateOrderRequestModel> createOrderRequest =
  Rxn<CreateOrderRequestModel>();
  Rx<num> totalValue = 0.0.obs;
  RxList<SlotAvailability> listSlots = <SlotAvailability>[].obs;
  RxList<InventoryResponseModel> addedInventories =
      <InventoryResponseModel>[].obs;
  RxString shippingMethod = ''.obs;
  RxString paymentMethod = 'CASH'.obs;
  RxString channel = ''.obs;
  Rxn<SlotAvailability> selectedSlot = Rxn<SlotAvailability>();
  Rxn<DateTime> deliveryTime = Rxn<DateTime>();
  RxString notes = ''.obs;
  Rxn<CreateOrderResponseModel> createOrderResponse =
  Rxn<CreateOrderResponseModel>();
  Rx<CartRequest> cartRequest = CartRequest().obs;
  Rx<CartResponse> cartResponse = CartResponse().obs;
  Rxn<WalletResponse> currentUserWallet = Rxn<WalletResponse>();
  Rxn<SocietyModel> selectedSociety = Rxn<SocietyModel>();

  Future<void> addInventory(
      InventoryResponseModel inventory,
      ) async {
    // if (addedInventories.any((e) => inventory.skuCode == e.skuCode)) {
    //   await removeInventory(inventory);
    // }
    // if (inventory.selectedQuantity.value > 0) {
      await addToCart(
        CartRequest(
          skuCode: inventory.skuCode,
          channel: "Backoffice",
          // pieceQty: inventory.product?.enablePiecesRequest == true
          //     ? (inventory.grades ?? []).isEmpty
          //     ? inventory.selectedQuantity.value.toInt()
          //     : inventory.grades!
          //     .map((e) => e.pieces ?? 0)
          //     .reduce((value, element) => value + element)
          //     .toInt()
          //     : null,
          quantity: 1,
          slotId: selectedSlot.value?.id?.toInt(),
          addressId: address.value?.id?.toString(),
          notes: inventory.notesValue.value.isNotEmpty
              ? inventory.notesValue.value
              : null,
          societyId:
          selectedSociety.value?.id ?? address.value?.societyId?.toInt(),
          grades: inventory.grades != null
              ? inventory.grades!.isEmpty
              ? null
              : inventory.grades!
              .where(
                (element) =>
            ![0, null].contains(element.pieces) ||
                ![0, null].contains(element.quantity),
          )
              .toList()
              : null,
          deliveryDate: deliveryTime.value == null
              ? null
              : DateFormat("yyyy-MM-dd").format(deliveryTime.value!),
          customerId: user.value?.id ?? "",
        ),
      );
      // if (err == null) {
      //   int indexOfInventory = addedInventories.indexWhere(
      //     (element) => element.skuCode == inventory.skuCode,
      //   );
      //
      //   if (indexOfInventory == -1) {
      //     addedInventories.add(inventory.copyWith(
      //       // quantity: quantity,
      //       // salePrice: salePrice,
      //       grades: inventory.grades,
      //     ));
      //   } else {
      //     addedInventories[indexOfInventory] =
      //         addedInventories[indexOfInventory].copyWith(
      //       // quantity: quantity,
      //       // salePrice: salePrice,
      //       grades: inventory.grades,
      //     );
      //   }
      //
      //   countTotalValue();
      // } else {
      //   logger.e("Adding item error: $err");
      // }
    // }
    // else {
    //   removeInventory(inventory);
    // }
  }

  double getThreeDecimal(double value) {
    String formattedValue = value.toStringAsFixed(2);

    if (formattedValue.endsWith(".00")) {
      formattedValue = formattedValue.split(".")[0];
    }

    return double.tryParse(formattedValue) ?? 0;
  }

  Future<void> removeInventory(
      InventoryResponseModel inventory,
      ) async {
    try {
      addToCart(
        CartRequest(
          channel: "Backoffice",
          quantity: 0,
          skuCode: inventory.skuCode,
          slotId: selectedSlot.value?.id?.toInt(),
          addressId: address.value?.id?.toString(),
          societyId:
          selectedSociety.value?.id ?? address.value?.societyId?.toInt(),
          grades: inventory.grades != null
              ? inventory.grades!.isEmpty
              ? null
              : inventory.grades!
              .where(
                (element) =>
            ![0, null].contains(element.pieces) ||
                ![0, null].contains(element.quantity),
          )
              .toList()
              : null,
          customerId: user.value?.id ?? "",
          notes: inventory.notes ?? "",
          deliveryDate: deliveryTime.value == null
              ? null
              : DateFormat("yyyy-MM-dd").format(deliveryTime.value!),
        ),
      );
    } catch (e) {
      logger.e(e);
    }
  }

  void countTotalValue() {
    // double sum = 0;
    // for (var inventory in addedInventories) {
    //   sum = sum + (inventory.selectedQuantity.value * inventory.salePrice!);
    // }
    totalValue.value = cartResponse.value.data?.finalBillAmount ?? 0;
  }

  void clearValues() {
    user.value = null;
    userdetails.value = '';
    skuCodeList.value = [];
    address.value = null;
    createOrderRequest.value = null;
    selectedSociety.value = null;
    selectedSlot.value = null;
    deliveryTime.value = null;
    totalValue.value = 0;
    addedInventories.value = [];
    shippingMethod.value = '';
    // paymentMethod.value = '';
    channel.value = '';
    notes.value = '';
    cartResponse.value = CartResponse();
    currentUserWallet.value = null;
    dateText.clear();
  }

  bool validOrderDetails() {
    bool validity = address.value != null &&
        addedInventories.isNotEmpty &&
        user.value != null &&
        shippingMethod.value.isNotEmpty &&
        channel.value.isNotEmpty &&
        paymentMethod.value.isNotEmpty;

    return validity;
  }

  Future<String?> getuser(String num) async {
    try {
      formzStatus.value = FormzStatus.submissionInProgress;
      ApiResult? userResponse = await OrderRepo.getUserInfo(num);
      if (userResponse is Success) {
        logger.d('Post Address  response is not null');
        formzStatus.value = FormzStatus.submissionSuccess;
        user.value = userResponse.data;
        return null;
      }
      else {
        logger.d('Post Address  response is null');
        formzStatus.value = FormzStatus.submissionFailure;
        return userResponse is Failure ? userResponse.error : null;
      }
    } catch (e) {
      logger.e("Ordere  : : ${e.toString()}");
      formzStatus.value = FormzStatus.submissionFailure;
      return e.toString();
    }
  }

  Future<CreateOrderResponseModel?> createOrder() async {
    createOrderRequest.value = CreateOrderRequestModel(
        notes: notes.value,
        channel: channel.value,
        slotId: selectedSlot.value!.id ?? 1,
        customerId: user.value?.id,
        deliveryAddress: int.parse(address.value?.id.toString() ?? '7'),
        metaData: MetaData(
          contactDetail: ContactDetail(
            name: user.value?.name,
            phone: user.value?.phoneNumber,
          ),
          location:
          Location(lat: address.value?.lat, long: address.value?.long),
        ),
        paymentMethod: paymentMethod.value,
        shippingMethod: shippingMethod.value,
        orderItems: List.from(addedInventories.map((element) => OrderItemReq(
            orderedQty: num.parse(element.selectedQuantity.value.toString()),
            skuCode: element.skuCode))));
    return await createOrderApi(createOrderRequest.value!, storeId);
  }

  Future<void> getSlotsList() async {
    try {
      List<SlotAvailability>? slotsList = await OrderRepo.getSlotsList();

      if (slotsList != null) {
        listSlots.value = slotsList;
        selectedSlot.value ??= slotsList
            .firstWhereOrNull((element) => element.isAvailable == true);
        logger.d("Slots List :${listSlots.length}");
      } else {
        logger.d("Slots List :${Strings.someThingWentWrong}");
      }
    } on RepoServiceException catch (e) {
      logger.e(e.message);
      // errorMessage.value = e.message!;
    }
  }

  void updateSelectedSlot(SlotAvailability? id) {
    selectedSlot.value = id;
  }

  Future<CreateOrderResponseModel?> createOrderApi(
      CreateOrderRequestModel model, storeId) async {
    try {
      formzStatus.value = FormzStatus.submissionInProgress;

      ApiResult? apiResult = await OrderRepo.createOrder(model, storeId);

      if (apiResult is Success) {
        logger.d('Post Address  response is not null');
        formzStatus.value = FormzStatus.submissionSuccess;
        createOrderResponse.value = null;
        return null;
      } else if (apiResult is Failure) {
        logger.d('Post Address  response is null');
        formzStatus.value = FormzStatus.submissionFailure;
        createOrderResponse.value = apiResult.data;
        handleErrorProductQuantity();
        return createOrderResponse.value;
      } else {
        createOrderResponse.value = null;
        return null;
      }
    } catch (e) {
      logger.e("Ordere  : : ${e.toString()}");
      formzStatus.value = FormzStatus.submissionFailure;
      return CreateOrderResponseModel.fromMap(
          const {"messsage": "Something went wrong, Please try again"});
    }
  }

  void handleErrorProductQuantity() {
    addedInventories.value = addedInventories
        .map((inventory) => inventory = inventory.copyWith(
      quantity: createOrderResponse.value != null &&
          createOrderResponse.value!.data.orderItems != null &&
          createOrderResponse.value!.data.orderItems!
              .any((o) => o?.skuCode == inventory.skuCode)
          ? createOrderResponse.value?.data.orderItems
          ?.firstWhere((o) => o?.skuCode == inventory.skuCode)!
          .finalQuantity
          : 0,
    ))
        .toList();
    addedInventories
        .removeWhere((element) => element.selectedQuantity.value == 0);
    countTotalValue();
  }

  Future<String?> addToCart(CartRequest cartRequest) async {
    try {
      ApiResult? response;
      response = await OrderRepo.addToCart(cartRequest, storeId.value);
      if (response is Success) {
        InventoryController inventoryController = Get.find();
        cartResponse.value = response.data;
        addedInventories.value = (cartResponse.value.data?.orderItems ?? [])
            .map(
              (e) => InventoryResponseModel.fromCartOrderItem(
            e,
            inventoryController.tmpInventories.firstWhereOrNull(
                  (element) => element.skuCode == e.skuCode,
            ),
          ),
        )
            .toList();
        if (cartResponse.value.message.isNotEmpty) {
          Get.showSnackbar(
            GetSnackBar(
              message: cartResponse.value.message,
              duration: const Duration(seconds: 3),
            ),
          );
        }
        countTotalValue();
        return null;
      } else {
        return (response as Failure).error;
      }
    } on RepoServiceException catch (e) {
      return e.message.toString();
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> updateCart({int? societyId}) async {
    try {
      ApiResult? response;
      response = await OrderRepo.updateToCart(UpdateCartRequest(
        societyId: societyId ?? (address.value?.societyId)?.toInt(),
        storeId: (int.parse(selectedSociety.value?.storeId ?? "")).toInt(),
        slotId: selectedSlot.value?.id,
        addressId: address.value?.id?.toInt(),
        customerId: user.value?.id,
        channel: "Backoffice",
        deliveryDate: deliveryTime.value == null
            ? null
            : DateFormat("yyyy-MM-dd").format(deliveryTime.value!),
      ));
      if (response is Success) {
        InventoryController inventoryController = Get.find();
        cartResponse.value = response.data ?? CartResponse();
        addedInventories.value = (cartResponse.value.data?.orderItems ?? [])
            .map(
              (e) => InventoryResponseModel.fromCartOrderItem(
            e,
            inventoryController.tmpInventories.firstWhereOrNull(
                  (element) => element.skuCode == e.skuCode,
            ),
          ),
        )
            .toList();
        if (cartResponse.value.message.isNotEmpty) {
          Get.showSnackbar(
            GetSnackBar(
              message: cartResponse.value.message,
              duration: const Duration(seconds: 3),
            ),
          );
        }
        return null;
      } else {
        return (response as Failure).error;
      }
    } on RepoServiceException catch (e) {
      return e.message.toString();
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> getCartSummary() async {
    try {
      InventoryController inventoryController = Get.find();
      AddAddressController addAddressController = Get.find();
      var response = await OrderRepo.getCartSummary(
        user.value!,
        storeId.value,
        deliveryTime.value == null
            ? null
            : DateFormat("yyyy-MM-dd").format(deliveryTime.value!),
      );

      if (response != null) {
        cartResponse.value = response;
        addedInventories.value = (response.data?.orderItems ?? [])
            .map(
              (e) => InventoryResponseModel.fromCartOrderItem(
            e,
            inventoryController.tmpInventories.firstWhereOrNull(
                  (element) => element.skuCode == e.skuCode,
            ),
          ),
        )
            .toList();
        address.value ??=
            addAddressController.userAddresses.value.firstWhereOrNull(
                  (element) => element.id == response.data?.deliveryAddress,
            );
        selectedSlot.value = listSlots.firstWhereOrNull(
                (element) => element.id == response.data?.slotId) ??
            selectedSlot.value;
        // deliveryTime.value = response.data?.deliveryDate;
        countTotalValue();
        return null;
      } else {
        return Strings.somethingWentWrong;
      }
    } on RepoServiceException catch (e) {
      return e.message;
    }
  }

  Future<String?> updateUser(Map data, userId) async {
    try {
      formzStatus.value = FormzStatus.submissionInProgress;
      ApiResult? userResponse = await OrderRepo.updateUser(
        data,
        userId,
      );
      if (userResponse is Success) {
        logger.d('Post Address  response is not null');
        user.value = User.fromJson(jsonEncode(userResponse.data));
        formzStatus.value = FormzStatus.submissionSuccess;
        return null;
      } else {
        logger.d('Post Address  response is null');
        formzStatus.value = FormzStatus.submissionFailure;
        return (userResponse as Failure).error;
      }
    } catch (e) {
      logger.e("Ordere  : : ${e.toString()}");
      formzStatus.value = FormzStatus.submissionFailure;
      return e.toString();
    }
  }

  Future<String?> getWalletInfo() async {
    try {
      // List<SlotAvailability>? slotsList =
      ApiResult response = await OrderRepo.getWalletSummary(user.value!.id!);
      if (response is Success) {
        currentUserWallet.value = WalletResponse.fromJson(response.data);
      } else {
        Get.showSnackbar(GetSnackBar(
          message: (response as Failure).error,
          duration: const Duration(seconds: 3),
        ));
      }
      // if (slotsList != null) {
      //   listSlots.value = slotsList;
      //   logger.d("Slots List :${listSlots.length}");
      // } else {
      //   logger.d("Slots List :${Strings.someThingWentWrong}");
      // }
    } on RepoServiceException catch (e) {
      logger.e(e.message);
      // errorMessage.value = e.message!;
    }
  }
}