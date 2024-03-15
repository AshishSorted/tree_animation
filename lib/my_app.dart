import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:tree_animation/common/themes.dart';
import 'package:tree_animation/network/api_client.dart';
import 'package:tree_animation/routes/app_pages.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    init();
    return Material(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: AppTheme.white),
        builder: (context, child) {
          return ResponsiveBuilder(builder: (context, sizingInfo) {
            if (sizingInfo.isMobile) {
              return child!;
            } else {
             return child!;
            }
          });
        },
        scrollBehavior: const MaterialScrollBehavior().copyWith(
          dragDevices: {
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
            PointerDeviceKind.stylus,
            PointerDeviceKind.unknown
          },
        ),
        initialRoute: AppPages.initial,
        getPages: AppPages.routes,
      ),
    );
  }

  void init() async {
    await ApiClient.init();
  }
}
