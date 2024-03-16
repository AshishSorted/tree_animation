import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tree_animation/logic.dart';
import 'package:tree_animation/screen/main_screen/address_controller.dart';
import 'package:tree_animation/screen/main_screen/create_order_controller.dart';
import 'package:tree_animation/screen/main_screen/inventory_controller.dart';


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
    inventoryController.getInventory("10001");
    super.initState();
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
      body: Stack(
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
        
          const FruitListWidget(pos: 400),
          const FruitListWidget(pos: 430),
          const FruitListWidget(pos: 450),
          const FruitListWidget(pos: 410),
          const FruitListWidget(pos: 460),
        ],
      ),
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
