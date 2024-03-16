import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:tree_animation/common/styles.dart';
import 'package:tree_animation/common/themes.dart';

class PhoneAndNameDialog extends StatelessWidget {
   PhoneAndNameDialog({super.key});

  final TextEditingController numberController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

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
                                    "Enter phone no.",
                                    textAlign: TextAlign.center,
                                    style: TextStyles.title2.copyWith(
                                      fontSize: 20,
                                      fontFamily: 'Gilroy',
                                      color: AppTheme.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                PinInputTextField(
                                  pinLength: 10,
                                  decoration: UnderlineDecoration(
                                    textStyle: const TextStyle(
                                        fontSize: 20, color: Colors.grey),
                                    colorBuilder:
                                        const FixedColorBuilder(AppTheme.grey),
                                  ),
                                  autocorrect: false,
                                  autofillHints: const <String>[
                                    AutofillHints.oneTimeCode
                                  ],
                                  textCapitalization: TextCapitalization.none,
                                  toolbarOptions: ToolbarOptions(paste: true),
                                  keyboardType: TextInputType.number,
                                  autoFocus: true,
                                  cursor: Cursor(
                                    width: 2,
                                    height: Insets.lg,
                                    color: AppTheme.black,
                                    enabled: true,
                                  ),
                                  controller: numberController,
                                  onSubmit: (value) {},
                                ),
                                SizedBox(
                                  height: Insets.xxl,
                                ),
                                Material(
                                  child: Text(
                                    "Enter your name",
                                    textAlign: TextAlign.center,
                                    style: TextStyles.title2.copyWith(
                                      fontSize: 20,
                                      fontFamily: 'Gilroy',
                                      color: AppTheme.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                PinInputTextField(
                                  pinLength: 10,
                                  decoration: UnderlineDecoration(
                                    textStyle: const TextStyle(
                                        fontSize: 20, color: Colors.grey),
                                    colorBuilder:
                                        const FixedColorBuilder(AppTheme.grey),
                                  ),
                                  autocorrect: false,
                                  autofillHints: const <String>[
                                    AutofillHints.oneTimeCode
                                  ],
                                  textCapitalization: TextCapitalization.none,
                                  toolbarOptions: ToolbarOptions(paste: true),
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
