import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:get/get.dart';

import 'package:tree_animation/common/themes.dart';
import 'package:tree_animation/screen/main_screen/logic.dart';
import 'package:tree_animation/network/shared_prefs.dart';
import 'package:tree_animation/screen/main_screen/address_controller.dart';
import 'package:tree_animation/screen/main_screen/create_order_controller.dart';
import 'package:tree_animation/screen/main_screen/inventory_controller.dart';

import 'package:tree_animation/screen/main_screen/widget/address_dialog.dart';

import 'package:tree_animation/screen/main_screen/widget/phone_and_name_dialog.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  AddAddressController addAddressController = Get.put(AddAddressController());
  CreateOrderController createOrderController =
      Get.put(CreateOrderController());

  InventoryController inventoryController = Get.put(InventoryController());

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    await inventoryController.getInventory("10001");
    await createOrderController.getSlotsList();
    await addAddressController.getSocietyData();
    if (addAddressController.societyList.isNotEmpty) {
      createOrderController.selectedSociety.value = addAddressController.societyList.first;
      createOrderController.storeId.value = int.parse(addAddressController.societyList.first.storeId!);
      addAddressController.selectedTowers.value = addAddressController.societyList.first.tower ?? [];
    }
    inventoryController.cdnUrl.value = await SharedPref.getCDNBaseUrl() ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Floating Fruits',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Obx(() {
        return Stack(
          children: [
            Positioned(
              bottom: 200,
              right: 10,
              left: 10,
              child: Image.asset(
                'assets/images/tree.png',
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
                left: 100,
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const AddressDialog();
                      },
                    );
                  },
                  child: Container(
                    width: 60,
                    height: 40,
                    color: AppTheme.primaryColor1,
                  ),
                )),
            Positioned(
                left: 300,
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return PhoneAndNameDialog();
                      },
                    );
                  },
                  child: Container(
                    width: 60,
                    height: 40,
                    color: AppTheme.red,
                  ),
                )),
            if (inventoryController.formzStatus.value.isSubmissionSuccess) ...[
              const FruitListWidget(pos: 400),
              const FruitListWidget(pos: 430),
              const FruitListWidget(pos: 450),
              const FruitListWidget(pos: 410),
              const FruitListWidget(pos: 460),
            ],
          ],
        );
      }),
    );
  }
}

class FruitListWidget extends StatelessWidget {
  final double pos;

  const FruitListWidget({Key? key, required this.pos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FruitList(pos: pos);
  }
}
