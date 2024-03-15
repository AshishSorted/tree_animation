import 'package:flutter/material.dart';
import 'package:tree_animation/common/strings.dart';
import 'package:tree_animation/common/styles.dart';
import 'package:tree_animation/common/themes.dart';
import 'package:tree_animation/widgets/custom_circular_progress_indicator.dart';


class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(this.title, this.callback,
      {Key? key,
      required this.buttonPadding,
      required this.buttonColor,
      this.cornerRadius = Corners.medBorder,
      this.textFontSize,
      this.splashColor,
      this.titleColor = AppTheme.white,
      this.borderColor,
      this.loading = false})
      : super(key: key);

  final VoidCallback? callback;
  final String title;
  final EdgeInsets buttonPadding;
  final Color buttonColor;
  final BorderRadius cornerRadius;
  final bool loading;
  final double? textFontSize;
  final Color? splashColor;
  final Color titleColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(buttonPadding),
          foregroundColor: MaterialStateProperty.all<Color>(AppTheme.white),
          backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: cornerRadius,
                  side: borderColor != null
                      ? BorderSide(color: borderColor!)
                      : BorderSide.none)),
          overlayColor: splashColor != null
              ? MaterialStateProperty.all<Color>(splashColor!)
              : null),
      onPressed: loading ? () {} : callback,
      child: loading
          ? const CustomLoader(size: 20)
          : FittedBox(
              child: Text(
                title,
                textAlign: TextAlign.center,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: textFontSize ?? FontSizes.s18,
                  color: titleColor,
                  fontWeight: FontWeight.w400,
                  fontFamily: Strings.publicSans,
                ),
              ),
            ),
    );
  }
}
