import 'package:formz/formz.dart';
import 'package:get/get.dart';

import '../../model/api_result.dart';
import '../../repo/inventory_repo.dart';
import '../../utils/logger.dart';
import 'model/inventory.dart';
import 'model/inventory_list_response_model.dart';

class InventoryController extends GetxController {
  RxList<InventoryResponseModel> tmpInventories =
      <InventoryResponseModel>[].obs;
  RxList<InventoryResponseModel> inventories = <InventoryResponseModel>[].obs;
  Rx<FormzStatus> formzStatus = FormzStatus.pure.obs;
  Rx<String> cdnUrl = "".obs;

  void allowEdit(int index) {
    bool editing = tmpInventories[index].editing;
    tmpInventories[index] = tmpInventories[index].copyWith(editing: !editing);
  }

  void changeQuantity(int index, num quantity) {
    tmpInventories[index] = tmpInventories[index].copyWith(quantity: quantity);
  }

  void changeSalePrice(int index, num salePrice) {
    tmpInventories[index] =
        tmpInventories[index].copyWith(salePrice: salePrice);
  }

  Rxn<InventoryListResponseModel> inventoryListModel =
      Rxn<InventoryListResponseModel>();

  Future<void> getInventory(String storeId) async {
    try {
      formzStatus.value = FormzStatus.submissionInProgress;
      List<InventoryResponseModel>? inventoriesResponse =
          await InventoryRepo.getInventory(storeId);
      if (inventoriesResponse != null) {
        logger.d('Get inventory response is not null');
        tmpInventories.value = inventoriesResponse
            // .where((element) => element.product?.isActive ?? false)
            .toList();
        inventories.value = tmpInventories;
        formzStatus.value = FormzStatus.submissionSuccess;
      } else {
        logger.d('Get inventory response is null');
        formzStatus.value = FormzStatus.submissionFailure;
      }
    } catch (e) {
      logger.e("Inventory : : ${e.toString()}");
      formzStatus.value = FormzStatus.submissionFailure;
    }
  }

  Future<InventoryListResponseModel?> getInventoryList({
   required int storeId
  }) async {
    try {
      tmpInventories.clear();
      // inventories.value = [];
      formzStatus.value = FormzStatus.submissionInProgress;

      ApiResult addressResponse =
          await InventoryRepo.getInventoryList(storeId:storeId );

      if (addressResponse is Success) {
        logger.d('Get inventory List response is not null');

        inventoryListModel.value = addressResponse.data;

        // if (inventoryListModel.value?.store?.isOpen ?? false) {
          tmpInventories.value = inventoryListModel.value?.inventory ?? [];
        // }
        inventories.value = inventoryListModel.value?.inventory ?? [];

        formzStatus.value = FormzStatus.submissionSuccess;
        return inventoryListModel.value;
      } else if (addressResponse is Failure) {
        logger.d('Get inventory List response is null');
        formzStatus.value = FormzStatus.submissionFailure;
      } else {
        return null;
      }
    } catch (e) {
      logger.e("Inventory List: : ${e.toString()}");
      formzStatus.value = FormzStatus.submissionFailure;
    }
    return inventoryListModel.value;
  }

  void searchInventory(String srchTxt) {
    List<InventoryResponseModel> productsResponse = [];
    productsResponse = inventories
        .where((p0) =>
            p0.skuCode!.toLowerCase().contains(srchTxt.toLowerCase()) ||
            p0.storeId!.toLowerCase().contains(srchTxt.toLowerCase()) ||
            p0.product!.displayName!
                .toLowerCase()
                .contains(srchTxt.toLowerCase()))
        .toList();
    tmpInventories.value = productsResponse;
  }

  Future<void> updateSelectedItems() async {
    try {
      formzStatus.value = FormzStatus.submissionInProgress;
      List<Map<String, dynamic>> newData = tmpInventories
          .where(
            (e) => e.product != null && e.editing,
          )
          .map(
            (e) => ({
              "id": e.id,
              "quantity": e.quantity,
              "sale_price": e.salePrice
            }),
          )
          .toList();
      // Send data in api
      ApiResult updateResponse =
          await InventoryRepo.updateMultipleItems(newData);
      if (updateResponse is Success) {
        logger.d('Bulk Update successful');
        _disableEditing();
        formzStatus.value = FormzStatus.submissionSuccess;
      } else if (updateResponse is Failure) {
        logger.d('Bulk Update Failed');
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(updateResponse.error),),);
        _disableEditing();
        formzStatus.value = FormzStatus.submissionFailure;
      } else {}
    } catch (e) {
      logger.e("Inventory List: : ${e.toString()}");
      formzStatus.value = FormzStatus.submissionFailure;
    }
  }

  _disableEditing() {
    tmpInventories.asMap().entries.forEach((e) {
      int idx = e.key;
      InventoryResponseModel element = e.value;
      if (element.product != null && element.editing) {
        allowEdit(idx);
      }
    });
  }
}
