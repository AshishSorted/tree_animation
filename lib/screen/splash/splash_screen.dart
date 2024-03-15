import 'package:flutter/material.dart';
import 'package:tree_animation/common/styles.dart';
import 'package:tree_animation/common/themes.dart';
import 'package:tree_animation/network/shared_prefs.dart';
import 'package:tree_animation/routes/app_pages.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToNextScreen();
  }

  void navigateToNextScreen() async {
    String? accessToken = await SharedPref.getAccessToken();
    if (accessToken == null) {
      AppPages.offNamed(Routes.login);
    } else {
      AppPages.offNamed(Routes.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        color: AppTheme.white,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          TextButton(
            onPressed: null,
            child: Text(
              "Sorted",
              style: TextStyles.h0,
            ),
          ),
        ]),
      ),
    );
  }
}
