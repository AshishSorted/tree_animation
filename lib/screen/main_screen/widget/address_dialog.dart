import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tree_animation/common/strings.dart';
import 'package:tree_animation/common/styles.dart';
import 'package:tree_animation/common/themes.dart';
import 'package:tree_animation/screen/main_screen/model/society.dart';
import 'package:tree_animation/screen/main_screen/widget/final_dialog.dart';
import 'package:tree_animation/widgets/custom_textfield_2.dart';
import 'package:tree_animation/widgets/society_drop_down.dart';

class AddressDialog extends StatefulWidget {
  const AddressDialog({super.key});

  @override
  State<AddressDialog> createState() => _AddressDialogState();
}

class _AddressDialogState extends State<AddressDialog> {
  final flatController = TextEditingController();
  final towerController = TextEditingController();
  final floorController = TextEditingController();

  // final floorController = TextEditingController();
  // final pinCodeController = TextEditingController();
  Tower? selectedTower;
  int? selectedFloor;
  @override
  Widget build(BuildContext context) {
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
              padding:
                  EdgeInsets.symmetric(vertical: Insets.xxl, horizontal: 23),
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
                          color: Color.fromRGBO(0, 0, 0, 0.16),
                        )
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(Insets.xl),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Material(
                                  child: Text(
                                    "Share your details so that we can deliver the gift at your doorstep",
                                    textAlign: TextAlign.center,
                                    style: TextStyles.title2.copyWith(
                                      fontFamily: "JD",
                                      fontSize: 24,
                                      color: AppTheme.darkYellow,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: Insets.xxl,
                                ),
                                Material(
                                  child: Text(
                                    "Enter your address",
                                    textAlign: TextAlign.center,
                                    style: TextStyles.title2.copyWith(
                                      fontSize: 20,
                                      fontFamily: 'Gilroy',
                                      color: AppTheme.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: Insets.xl,
                                ),
                                CustomTextField2(
                                  borderWidth: .5,
                                  borderColor: AppTheme.greyB5B5B5,
                                  hintTextColor: AppTheme.greyB2B2B2,
                                  controller: flatController,
                                  hintText: Strings.flatVilla,
                                ),
                                SizedBox(
                                  height: Insets.xs,
                                ),
                                CustomTextField2(
                                  borderWidth: .5,
                                  borderColor: AppTheme.greyB5B5B5,
                                  hintTextColor: AppTheme.greyB2B2B2,
                                  controller: floorController,
                                  hintText: Strings.floor,
                                  inputType: TextInputType.number,
                                ),
                                SizedBox(
                                  height: Insets.xs,
                                ),
                                TowerDropDown(
                                  borderWidth: 1.2,
                                  borderColor: AppTheme.alto,
                                  hintTextColor: AppTheme.dustyGrey,
                                  // towerList:Tower
                                  //     selectSocietyController.selectedSociety?.tower,
                                  selectedTower: selectedTower,
                                  // addressListController.selectedSocietyModel.value,
                                  hintText: Strings.towerBlock,
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
                                builder: (BuildContext context) {
                                  return const FinalDialog();
                                },
                              );
                            },
                            child: Material(
                              child: Text(
                                "Submit!",
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
  }
}
