import 'package:get/get.dart';
import 'package:tree_animation/screen/login/login_screen.dart';
import 'package:tree_animation/screen/main_screen.dart';
import 'package:tree_animation/screen/splash/splash_screen.dart';

import 'package:tree_animation/screen/verify_otp/verify_otp_screen.dart';


// import 'package:sorted_admin_portal/screens/tags/tags_view.dart';




class AppPages {
  AppPages._();

  static const initial = Routes.splash;

  static final routes = [
    GetPage(name: Routes.splash, page: () => const SplashScreen()),
    GetPage(name: Routes.login, page: () => const LoginScreen()),
    GetPage(name: Routes.home, page: () => const MainScreen()),
    // GetPage(name: Routes.getConfig, page: () => GetConfigScreen()),
  
    // GetPage(
    //     name: Routes.appAddConfig,
    //     page: () => AppAddConfigScreen(
    //           config: (Get.arguments ?? {})['configs'],
    //           onSuccess: (Get.arguments ?? {})['onSuccess'],
    //         )),
    // GetPage(name: Routes.home, page: () => const HomeScreen()),

  


    GetPage(
      name: Routes.verifyOtp,
      page: () => VerifyOtpScreen(
        phoneNumber: Get.arguments as String?,
      ),
    ),
 
  ];

  static void offNamed(String path, {String args = ''}) {
    Get.offNamed(path);
  }

  static toNextScreen(String path, {dynamic arguments, Function? onPop}) {
    switch (path) {
      default:
        Get.toNamed(path, arguments: arguments)?.then((value) => onPop?.call());
        break;
    }
  }

  static void offAndToNextScreen(String path, {dynamic arguments = -1}) {
    Get.offAndToNamed(path, arguments: arguments);
  }

  static void offAlltoNextScreen(String path, {String args = ''}) {
    switch (path) {
      case Routes.login:
        // Get.offAll(const LoginScreen());
        break;
      case Routes.home:
        Get.offAll(const MainScreen());
        break;
    }
  }

  static void offtoNextScreen(String path, {String args = ''}) {
    switch (path) {
      case Routes.login:
        Get.off(const LoginScreen());
        break;
      case Routes.home:
        Get.off(const MainScreen());
        break;
    }
  }
}

abstract class Routes {
  static const splash = '/splash';
  static const login = '/login';
  static const verifyOtp = '/verify-otp';
  static const home = '/home';
  
}
