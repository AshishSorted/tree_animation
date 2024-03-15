import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tree_animation/common/styles.dart';
import 'package:tree_animation/common/themes.dart';

enum SocietyEnum { pdp, menu, other }

class SelectSocietyDialog extends StatefulWidget {
  const SelectSocietyDialog({super.key, this.callFrom = SocietyEnum.other});

  final SocietyEnum callFrom;

  @override
  State<SelectSocietyDialog> createState() => _SelectSocietyDialogState();
}

class _SelectSocietyDialogState extends State<SelectSocietyDialog> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return 
    SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: Insets.xxl, horizontal: 23),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: Get.height * .7,
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
                      children: [
                        Text(
                          "Good is ‘less’",
                          textAlign: TextAlign.center,
                          style: TextStyles.title2.copyWith(
                            fontFamily: "JD",
                            fontSize: 24,
                            color: AppTheme.darkYellow,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "So we just started with a few locations, for now.",
                          textAlign: TextAlign.center,
                          style: TextStyles.title2.copyWith(
                            fontFamily: "JD",
                            fontSize: 16,
                            color: AppTheme.greyB5B5B5,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: SvgPicture.asset(
                            "assets/images/ic_location.svg",
                            height: Insets.xl,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Please select yours...",
                          textAlign: TextAlign.center,
                          style: TextStyles.title2.copyWith(
                            fontFamily: "JD",
                            fontSize: 18,
                            color: AppTheme.darkYellow,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: Insets.lg * 1.5,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            "Can’t find mine",
                            textAlign: TextAlign.center,
                            style: TextStyles.title2.copyWith(
                              fontFamily: "JD",
                              fontSize: 16,
                              color: AppTheme.red,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    )),
                    // SizedBox(
                    //   height: Insets.xxl,
                    // ),
                    const Spacer(),
                    InkWell(
                      onTap: () async {},
                      child: Text(
                        "Sorted!",
                        textAlign: TextAlign.center,
                        style: TextStyles.title2.copyWith(
                          fontSize: 20,
                          color: AppTheme.green518216,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Insets.sm,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 23,
            ),
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
      
    );
  
  }
}
