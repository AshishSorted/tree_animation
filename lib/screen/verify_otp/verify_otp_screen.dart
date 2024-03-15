import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:get/get.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:tree_animation/common/strings.dart';
import 'package:tree_animation/common/styles.dart';
import 'package:tree_animation/common/themes.dart';
import 'package:tree_animation/routes/app_pages.dart';
import 'package:tree_animation/screen/splash/init_controller.dart';
import 'package:tree_animation/screen/verify_otp/verify_otp_controller.dart';
import 'package:tree_animation/widgets/custom_elevated_button.dart';


class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key, this.phoneNumber});

  final String? phoneNumber;

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final TextEditingController controller = TextEditingController();
  late InitController initController;
  final VerifyOtpController otpController = Get.put(VerifyOtpController());
  String errorText = '';
  // final SidebarController sidebarController = Get.find();

  bool controllersLoaded = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initializeControllers();
    });
  }

  void initializeControllers() {
    try {
      if (widget.phoneNumber != null && Get.isRegistered<InitController>()) {
        initController = Get.find<InitController>();
        controllersLoaded = true;
        setState(() {});
      } else {
        Get.toNamed(Routes.login);
      }
    } catch (e) {
      Get.toNamed(Routes.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return !controllersLoaded
        ? const SizedBox()
        : Scaffold(
            resizeToAvoidBottomInset: true,
            body: Center(
              child: SizedBox(
                width: Insets.xxl * 8,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(Insets.lg),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: Insets.offset10,
                        ),
                        Column(
                          children: [
                            Image.asset(
                              "images/sorted.png",
                              width: Insets.offset,
                              height: Insets.offset,
                            ),
                            SizedBox(height: Insets.sm),
                            TextButton(
                              onPressed: () {},
                              child:
                                  Text(Strings.verifyOtp, style: TextStyles.h2),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20,),
                        Column(
                          children: [
                            SizedBox(
                              height: 50,
                              width: double.maxFinite,
                              child: PinInputTextField(
                                enableInteractiveSelection: true,
                                pinLength: 6,
                                autoFocus: true,
                                cursor: Cursor(color: AppTheme.white, width: 1,),
                                decoration: BoxLooseDecoration(
                                  radius: Corners.medRadius,
                                  textStyle:
                                      const TextStyle(color: AppTheme.black),
                                  bgColorBuilder: PinListenColorBuilder(
                                      AppTheme.white, AppTheme.white),
                                  strokeColorBuilder: PinListenColorBuilder(
                                    AppTheme.darkGreen,
                                    AppTheme.grey,
                                  ),
                                ),
                                controller: controller,
                                textInputAction: TextInputAction.go,
                                enabled: true,
                                keyboardType: TextInputType.number,
                                textCapitalization:
                                    TextCapitalization.characters,
                                onSubmit: (pin) {},
                                onChanged: (pin) {},
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  Insets.offset24,
                                  Insets.offset12,
                                  Insets.offset24,
                                  Insets.offset0),
                              child: Text(
                                errorText,
                                style: TextStyle(
                                    fontSize: FontSizes.s16,
                                    color: AppTheme.red,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: Strings.publicSans),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(Insets.offset0,
                              Insets.offset74, Insets.offset0, Insets.offset12),
                          child: CustomElevatedButton(
                            Strings.verifyOtp,
                            () => verifyOtp(context),
                            buttonPadding: EdgeInsets.all(Insets.lg),
                            buttonColor: AppTheme.primaryColor1,
                            loading: otpController.formzStatus.value ==
                                FormzStatus.submissionInProgress,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  }

  verifyOtp(context) async {
    String? err = await otpController.verifyOtp(
        controller.text.trim(), widget.phoneNumber ?? "");
    if (err == null) {
      initController.getInitConfig(context);
      // sidebarController.currentRoute.value = Routes.home;
      AppPages.offNamed(Routes.home);
    } else {
      errorText = err;
    }
    setState(() {});
  }
}
