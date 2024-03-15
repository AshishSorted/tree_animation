import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const greenSelecetedCategoryColor = Color(0xFFEFF7E2);
  static const shadowColor = Color(0xFF0000001A);
  static const greyWithGreatOpacity = Color(0xFFCCCCCC);
  static const greytrackScreen = Color(0xFFF5F5F5);
  static const bool isDark = false;
    static const borderColor = Color(0xE0E0E0E0);
  static const double maxWidth = 800;
  static const brownOptionScreen = Color(0xFF92503C);
  static const greyBottomSheet = Color(0xFFEFEFEF);
  static const greytrack2 = Color(0xFF959595);
  static const black = Color(0xFF333333);
  static const skinColor = Color(0xFFFCF7EF);
  static const white = Color(0xFFFFFFFF);
  static const offWhite = Color(0xffFBFBFB);

  static const darkGreen = Color(0xFF869375);
  static const graphIronColor = Color(0xFF4A5568);
  static const primaryColor1 = Color(0xff91c11e);
  static const primaryColor2 = Color(0xFF333333);
  static const errorRed = Color(0xFFEB5757);
  static const greySliderColor = Color(0xFFDEDEDE);
  static const lightGreenSliderColor = Color(0xFFBFE094);
  static const subHeadingColor = Color(0xFFAA9D8A);
  static const searchTextFieldColor = Color(0xFFFFF7EB);
  static const darkYellow = Color(0xFFBB8C46);
  static const shadow = Color(0xB48D5136);
  static const brown = Color(0xFF624E2F);
  static const borderAvatar = Color(0xFFD8CBB8);
  static const iconColor = Color(0xFF707070);
  static const backgroundGradient = Color(0xFFF5EBDC);
  static const backgroundColor = Color(0xFFF0EDE7);
  static const buttonColor = Color(0xFF6E9144);
  static const buttonColorDisable = Color(0xFFA1AF97);
  static const titleColor = Color(0xFF3e3e3e);

  // static const borderColor = Color(0xE0E0E0E0);
  static const greyE0E0E0 = Color(0xFFE0E0E0);
  static const greyE5E5E5 = Color(0xFFE5E5E5);
  static const containerWhite = Color(0xFFFFFFFF);
  static const purple = Color(0xFF9D5A9B);
  static const blue = Color(0xFF4797D2);
  static const grey = Colors.grey;
  static const red = Color(0xFFDA5239);
  static const redD41313 = Color(0xFFD41313);
  static const textBlack = Color(0xFF000000);
  static const cyan = Color(0xFF40B2BF);
  static const mustardYellow = Color(0xFFffbe00);
  static const elSalva = Color(0xFF9C4C36);
  static const roundedButton = Color(0xFFD58253);
  static const blackForText = Color(0xFF4A5568);
  static const newGreen = Color(0xFf95A583);
  static const inactiveSlider = Color(0xFFFFF7EB);
  static const moneyGreen = Color(0xFF779B58);
  static const redPersonal = Color(0xFFDE503F);
  static const redCC4354 = Color(0xFFCC4354);
  static const everythingElseBrown = Color(0xFFBD8B51);

  static const orderText = Color(0xffE2EFE8);
  static const greenBackground = Color(0xffC2CCC6);
  static const green = Color(0xff6A7949);
  static const green6EA317 = Color(0xFF6EA317);
  static const green518216 = Color(0xFF518216);
  static const green5D9600 = Color(0xFF5D9600);
  static const asparagus = Color(0xff809A57);
  static const cabbagePont = Color(0xff405139);
  static const dustyGrey = Color(0xff959595);
  static const grey595959 = Color(0xff595959);
  static const grey959595 = Color(0xff959595);
  static const alto = Color(0xffD8D8D8);
  static const opium = Color(0xff8E7069);
  static const silverChalice = Color(0xffAFAFAF);
  static const athsSpecial = Color(0xffEDE2D3);
  static const lightBlue = Color(0xffE4ECF7);
  static const blueBorder = Color(0xffC8D2E0);
  static const greenText = Color(0xff799C4D);
  static const chartGrey = Color(0xff666864);
  static const blueHelp = Color(0xff2F8FC2);
  static const blackPrice = Color(0xff3E3E3E);
  static const offOffWhite = Color(0xffededed);
  static const offOffWhiteCart = Color.fromARGB(255, 255, 252, 252);
  static const whatsappGreen = Color(0xFF25D366);
  static const green5F991A = Color(0xFF5F991A);
  static const greenOutline = Color(0xFF6E9144);
  static const buttonBg = Color(0xFF646464);
  static const grey5A5957 = Color(0xFF5A5957);
  static const greyB2B2B2 = Color(0xFFB2B2B2);
  static const greyB5B5B5 = Color(0xFFB5B5B5);
  static const greyA1A1A1 = Color(0xFFA1A1A1);
  static const greyC5C2C2 = Color(0xFFC5C2C2);
  static const grey3E3E3E = Color(0xFF3E3E3E);
  static const grey707070 = Color(0xFF707070);
  static const greyE8E8E8 = Color(0xFFE8E8E8);
  static const greyF7F7F7 = Color(0xFFF7F7F7);
  static const greyF1F1F1 = Color(0xFFF1F1F1);
  static const grey1F1F1F = Color(0xFF1F1F1F);
  static const grey999999 = Color(0xFF999999);
  static const black192D00 = Color(0xFF192D00);

  Color shift(Color c, double amt) {
    amt *= (isDark ? -1 : 1);
    var hslc = HSLColor.fromColor(c); // Convert to HSL
    double lightness =
        (hslc.lightness + amt).clamp(0, 1.0) as double; // Add/Remove lightness
    return hslc.withLightness(lightness).toColor(); // Convert back to Color
  }
}
