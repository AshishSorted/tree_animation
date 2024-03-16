import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:tree_animation/common/strings.dart';
import 'package:tree_animation/common/styles.dart';
import 'package:tree_animation/common/themes.dart';
import 'package:tree_animation/logic.dart';
import 'package:tree_animation/screen/main_screen/address_controller.dart';
import 'package:tree_animation/screen/main_screen/create_order_controller.dart';
import 'package:tree_animation/screen/main_screen/inventory_controller.dart';
import 'package:tree_animation/screen/main_screen/model/society.dart';
import 'package:tree_animation/screen/main_screen/widget/congratulations%20dialog.dart';
import 'package:tree_animation/widgets/custom_textfield_2.dart';
import 'package:tree_animation/widgets/show_alert_dialog.dart';
import 'package:tree_animation/widgets/society_drop_down.dart';

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
  TextEditingController numberController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  final flatController = TextEditingController();
  final towerController = TextEditingController();
  final floorController = TextEditingController();

  // final floorController = TextEditingController();
  // final pinCodeController = TextEditingController();
  Tower? selectedTower;
  int? selectedFloor;

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
          Positioned(
              left: 100,
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Center(
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                            width: Get.width * 0.8,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: Insets.xxl, horizontal: 23),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.white,
                                        boxShadow: const [
                                          BoxShadow(
                                            offset: Offset(1, 4),
                                            blurRadius: 21,
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.16),
                                          )
                                        ],
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(Insets.xl),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Material(
                                                    child: Text(
                                                      "Share your details so that we can deliver the gift at your doorstep",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyles.title2
                                                          .copyWith(
                                                        fontFamily: "JD",
                                                        fontSize: 24,
                                                        color:
                                                            AppTheme.darkYellow,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: Insets.xxl,
                                                  ),
                                                  Material(
                                                    child: Text(
                                                      "Enter your address",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyles.title2
                                                          .copyWith(
                                                        fontSize: 20,
                                                        fontFamily: 'Gilroy',
                                                        color: AppTheme.black,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: Insets.xl,
                                                  ),
                                                  CustomTextField2(
                                                    borderWidth: .5,
                                                    borderColor:
                                                        AppTheme.greyB5B5B5,
                                                    hintTextColor:
                                                        AppTheme.greyB2B2B2,
                                                    controller: flatController,
                                                    hintText: Strings.flatVilla,
                                                  ),
                                                  SizedBox(
                                                    height: Insets.xs,
                                                  ),
                                                  CustomTextField2(
                                                    borderWidth: .5,
                                                    borderColor:
                                                        AppTheme.greyB5B5B5,
                                                    hintTextColor:
                                                        AppTheme.greyB2B2B2,
                                                    controller: floorController,
                                                    hintText: Strings.floor,
                                                    inputType:
                                                        TextInputType.number,
                                                  ),
                                                  SizedBox(
                                                    height: Insets.xs,
                                                  ),
                                                  TowerDropDown(
                                                    borderWidth: 1.2,
                                                    borderColor: AppTheme.alto,
                                                    hintTextColor:
                                                        AppTheme.dustyGrey,
                                                    // towerList:Tower
                                                    //     selectSocietyController.selectedSociety?.tower,
                                                    selectedTower:
                                                        selectedTower,
                                                    // addressListController.selectedSocietyModel.value,
                                                    hintText:
                                                        Strings.towerBlock,
                                                    onChanged: (tower) {
                                                      if (mounted) {
                                                        setState(() {
                                                          selectedTower = tower;
                                                        });
                                                      }
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: Insets.xl),
                                            InkWell(
                                              onTap: () async {
                                                Get.back();
                                                showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return BackdropFilter(
                                                      filter: ImageFilter.blur(
                                                          sigmaX: 10,
                                                          sigmaY: 10),
                                                      child: Center(
                                                        child:
                                                            AnimatedContainer(
                                                          duration:
                                                              const Duration(
                                                                  milliseconds:
                                                                      500),
                                                          curve:
                                                              Curves.easeInOut,
                                                          width:
                                                              Get.width * 0.8,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors
                                                                .transparent,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                          ),
                                                          child:
                                                              SingleChildScrollView(
                                                            child: Padding(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          Insets
                                                                              .xxl,
                                                                      horizontal:
                                                                          23),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: [
                                                                  Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15),
                                                                      color: Colors
                                                                          .white,
                                                                      boxShadow: const [
                                                                        BoxShadow(
                                                                          offset: Offset(
                                                                              1,
                                                                              4),
                                                                          blurRadius:
                                                                              21,
                                                                          color: Color.fromRGBO(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              0.16),
                                                                        )
                                                                      ],
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsets.all(
                                                                          Insets
                                                                              .xl),
                                                                      child:
                                                                          Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children: [
                                                                          SizedBox(
                                                                            child:
                                                                                Column(
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Material(
                                                                                  child: Text(
                                                                                    "Conngratulations, your order will arrive soon at your doorstep.",
                                                                                    textAlign: TextAlign.center,
                                                                                    style: TextStyles.title2.copyWith(
                                                                                      fontFamily: "JD",
                                                                                      fontSize: 24,
                                                                                      color: AppTheme.darkYellow,
                                                                                      fontWeight: FontWeight.w600,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                              height: Insets.xl),
                                                                          InkWell(
                                                                            onTap:
                                                                                () async {
                                                                                  Get.back();
                                                                                },
                                                                            child:
                                                                                Material(
                                                                              child: Text(
                                                                                "Ok!",
                                                                                textAlign: TextAlign.center,
                                                                                style: TextStyles.title2.copyWith(
                                                                                  fontSize: 20,
                                                                                  color: AppTheme.green518216,
                                                                                  fontWeight: FontWeight.w400,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                      height:
                                                                          23),
                                                                  InkWell(
                                                                    onTap: () {
                                                                      Get.back();
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          50,
                                                                      width: 50,
                                                                      decoration:
                                                                          const BoxDecoration(
                                                                        shape: BoxShape
                                                                            .circle,
                                                                        color: AppTheme
                                                                            .grey595959,
                                                                      ),
                                                                      child:
                                                                          const Icon(
                                                                        Icons
                                                                            .close,
                                                                        color: Colors
                                                                            .white,
                                                                        size:
                                                                            35,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                              child: Material(
                                                child: Text(
                                                  "Submit!",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyles.title2
                                                      .copyWith(
                                                    fontSize: 20,
                                                    color: AppTheme.green518216,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 23),
                                    InkWell(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: Container(
                                        height: 50,
                                        width: 50,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppTheme.grey595959,
                                        ),
                                        child: const Icon(
                                          Icons.close,
                                          color: Colors.white,
                                          size: 35,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
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
                      return BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Center(
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                            width: Get.width * 0.8,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: Insets.xxl, horizontal: 23),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.white,
                                        boxShadow: const [
                                          BoxShadow(
                                            offset: Offset(1, 4),
                                            blurRadius: 21,
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.16),
                                          )
                                        ],
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(Insets.xl),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Material(
                                                    child: Text(
                                                      "Share your details so that we can deliver the gift at your doorstep",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyles.title2
                                                          .copyWith(
                                                        fontFamily: "JD",
                                                        fontSize: 24,
                                                        color:
                                                            AppTheme.darkYellow,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: Insets.xxl,
                                                  ),
                                                  Material(
                                                    child: Text(
                                                      "Enter phone no.",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyles.title2
                                                          .copyWith(
                                                        fontSize: 20,
                                                        fontFamily: 'Gilroy',
                                                        color: AppTheme.black,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ),
                                                  PinInputTextField(
                                                    pinLength: 10,
                                                    decoration:
                                                        UnderlineDecoration(
                                                      textStyle:
                                                          const TextStyle(
                                                              fontSize: 20,
                                                              color:
                                                                  Colors.grey),
                                                      colorBuilder:
                                                          const FixedColorBuilder(
                                                              AppTheme.grey),
                                                    ),
                                                    autocorrect: false,
                                                    autofillHints: const <String>[
                                                      AutofillHints.oneTimeCode
                                                    ],
                                                    textCapitalization:
                                                        TextCapitalization.none,
                                                    toolbarOptions:
                                                        ToolbarOptions(
                                                            paste: true),
                                                    keyboardType:
                                                        TextInputType.number,
                                                    autoFocus: true,
                                                    cursor: Cursor(
                                                      width: 2,
                                                      height: Insets.lg,
                                                      color: AppTheme.black,
                                                      enabled: true,
                                                    ),
                                                    controller:
                                                        numberController,
                                                    onSubmit: (value) {},
                                                  ),
                                                  SizedBox(
                                                    height: Insets.xxl,
                                                  ),
                                                  Material(
                                                    child: Text(
                                                      "Enter your name",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyles.title2
                                                          .copyWith(
                                                        fontSize: 20,
                                                        fontFamily: 'Gilroy',
                                                        color: AppTheme.black,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ),
                                                  PinInputTextField(
                                                    pinLength: 10,
                                                    decoration:
                                                        UnderlineDecoration(
                                                      textStyle:
                                                          const TextStyle(
                                                              fontSize: 20,
                                                              color:
                                                                  Colors.grey),
                                                      colorBuilder:
                                                          const FixedColorBuilder(
                                                              AppTheme.grey),
                                                    ),
                                                    autocorrect: false,
                                                    autofillHints: const <String>[
                                                      AutofillHints.oneTimeCode
                                                    ],
                                                    textCapitalization:
                                                        TextCapitalization.none,
                                                    toolbarOptions:
                                                        ToolbarOptions(
                                                            paste: true),
                                                    autoFocus: true,
                                                    cursor: Cursor(
                                                      width: 2,
                                                      height: Insets.lg,
                                                      color: AppTheme.black,
                                                      enabled: true,
                                                    ),
                                                    controller: nameController,
                                                    onSubmit: (value) {},
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: Insets.xl),
                                            InkWell(
                                              onTap: () async {},
                                              child: Material(
                                                child: Text(
                                                  "Verify!",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyles.title2
                                                      .copyWith(
                                                    fontSize: 20,
                                                    color: AppTheme.green518216,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 23),
                                    InkWell(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: Container(
                                        height: 50,
                                        width: 50,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppTheme.grey595959,
                                        ),
                                        child: const Icon(
                                          Icons.close,
                                          color: Colors.white,
                                          size: 35,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  width: 60,
                  height: 40,
                  color: AppTheme.red,
                ),
              )),
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
