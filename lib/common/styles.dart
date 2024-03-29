
import 'package:flutter/material.dart';
import 'package:tree_animation/common/themes.dart';

class Times {
  static const Duration fastest = Duration(milliseconds: 150);
  static const fast = Duration(milliseconds: 250);
  static const medium = Duration(milliseconds: 350);
  static const slow = Duration(milliseconds: 700);
  static const slower = Duration(milliseconds: 1000);
}

class Corners {
  static const double sm = 3;
  static const BorderRadius smBorder = BorderRadius.all(smRadius);
  static const Radius smRadius = Radius.circular(sm);

  static const double med = 5;
  static const BorderRadius medBorder = BorderRadius.all(medRadius);
  static const Radius medRadius = Radius.circular(med);

  static const double lg = 8;
  static const BorderRadius lgBorder = BorderRadius.all(lgRadius);
  static const Radius lgRadius = Radius.circular(lg);

  static const double xl = 16;
  static const BorderRadius xlBorder = BorderRadius.all(xlRadius);
  static const Radius xlRadius = Radius.circular(xl);

  static const double outerAvatarRadius = 22;
  static const double outerAvatarRadiusLg = 35;
  static const double outerAvatarRadiusXL = 50;
  static const BorderRadius avatarShadowBorder =
      BorderRadius.all(avatarshadowBorderRadius);
  static const Radius avatarshadowBorderRadius =
      Radius.circular(outerAvatarRadius);

  static const BorderRadius lgBorderOnlyTop =
      BorderRadius.only(topLeft: xlRadius, topRight: xlRadius);
  static const BorderRadius xlBorderOnlyLeft =
      BorderRadius.only(topLeft: xlRadius, bottomLeft: xlRadius);
  static const BorderRadius xlBorderOnlyBottom =
      BorderRadius.only(bottomLeft: xlRadius, bottomRight: xlRadius);
  static const BorderRadius xlBorderOnlyRight =
      BorderRadius.only(topRight: xlRadius, bottomRight: xlRadius);
}

class Insets {
  static double scale = 1;
  static double offsetScale = 2;

  static double get xs => 4 * scale;

  static double get sm => 8 * scale;

  static double get med => 12 * scale;

  static double get lg => 16 * scale;

  static double get xl => 32 * scale;

  static double get xxl => 40 * scale;

  static double get offset => 48 * offsetScale;

  static double get offsetMed => 50 * offsetScale;

  static double offsetPoint5 = 0.5;
  static double offset0 = 0;
  static double offset1 = 1;
  static double offset2 = 2;
  static double offset3 = 3;
  static double offset4 = 4;
  static double offset5 = 5;
  static double offset10 = 10;
  static double offset13 = 13;
  static double offset12 = 12;
  static double offset14 = 14;
  static double offset15 = 15;
  static double offset16 = 16;
  static double offset20 = 20;
  static double offset24 = 24;
  static double offset25 = 25;
  static double offset29 = 29;
  static double offset32 = 32;
  static double offset34 = 34;
  static double offset36 = 36;
  static double offset40 = 40;
  static double offset43 = 43;
  static double offset44 = 44;
  static double offset56 = 56;
  static double offset50 = 50;
  static double offset64 = 64;
  static double offset74 = 74;
  static double offset104 = 104;
  static double offset132 = 132;
  static double offset136 = 136;
  static const double offset176 = 176;
  static double offset199 = 199;
  static double offset200 = 200;
  static double offset342 = 342;
}

class Shadows {
  static List<BoxShadow> get universal => [
        const BoxShadow(
            color: Color(0x28000000), blurRadius: 16, offset: Offset(2, 2)),
      ];
}

class FontSizes {
  /// Provides the ability to nudge the app-wide font scale in either direction
  static double get scale => 1;

  static double get s10 => 10 * scale;

  static double get s11 => 11 * scale;

  static double get s12 => 12 * scale;

  static double get s14 => 14 * scale;

  static double get s15 => 15 * scale;

  static double get s16 => 16 * scale;

  static double get s18 => 18 * scale;

  static double get s20 => 20 * scale;

  static double get s22 => 22 * scale;

  static double get s24 => 24 * scale;

  static double get s28 => 28 * scale;
  static double get s36 => 36 * scale;

  static double get s40 => 40 * scale;

  static double get s56 => 56 * scale;
}

class TextStyles {
  /// Declare a base style for each Family
  static TextStyle primary = const TextStyle(
    color: Colors.black,
    fontFamily: "Gilroy",
    fontWeight: FontWeight.w400,
    height: 1,
  );

//letter spacing, height?
  static TextStyle get h0 => primary.copyWith(
        fontWeight: FontWeight.w700,
        fontSize: FontSizes.s56,
        height: 2.34,
        fontFamily: "Gilroy",
      );

  static TextStyle get h1 => primary.copyWith(
      fontWeight: FontWeight.w700, fontSize: FontSizes.s28, height: 1.17);

  static TextStyle get h2 => h1.copyWith(
        fontSize: FontSizes.s20,
        fontFamily: "Gilroy",
      );

  static TextStyle get h3 => h1.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: FontSizes.s22,
        color: AppTheme.primaryColor2,
        fontFamily: "Gilroy",
      );

  static TextStyle get title1 => primary.copyWith(
      fontWeight: FontWeight.w800,
      fontSize: FontSizes.s24,
      height: 1.3,
      fontFamily: "Gilroy");

  static TextStyle get title2 => title1.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: FontSizes.s18,
        color: AppTheme.primaryColor2,
        fontFamily: "Gilroy",
      );

  static TextStyle get body1 => primary.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: FontSizes.s14,
      color: AppTheme.primaryColor2,
      fontFamily: "Gilroy",
      height: 1.2);

  static TextStyle get body2 => body1.copyWith(
      fontWeight: FontWeight.w400, fontSize: FontSizes.s12, height: 1.2);

  static TextStyle get body3 => body1.copyWith(
      fontWeight: FontWeight.w500, fontSize: FontSizes.s10, height: 1.2);

  static TextStyle get callout1 => primary.copyWith(
      fontWeight: FontWeight.w600,
      fontSize: FontSizes.s12,
      height: 1.17,
      letterSpacing: .5);

  static TextStyle get callout2 =>
      callout1.copyWith(fontSize: FontSizes.s14, height: 1, letterSpacing: .25);

  static TextStyle get caption => primary.copyWith(
      fontWeight: FontWeight.w500, fontSize: FontSizes.s11, height: 1.36);
}
