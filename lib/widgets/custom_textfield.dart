import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tree_animation/common/strings.dart';
import 'package:tree_animation/common/styles.dart';
import 'package:tree_animation/common/themes.dart';



class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.hintText,
    this.maxLine,
    this.maxLength,
    this.obscureText = false,
    this.inputFormatters,
    this.keyboardType,
    this.preFixWidget,
    this.controller,
    this.onChange,
  }) : super(key: key);

  final String? hintText;
  final int? maxLine;
  final int? maxLength;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final Widget? preFixWidget;
  final TextEditingController? controller;
  final Function(String)? onChange;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (text) => onChange?.call(text),
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        counterText: '',
        prefixIcon: preFixWidget,
        focusedBorder: OutlineInputBorder(
          borderRadius: Corners.lgBorder,
          borderSide: BorderSide(
              width: Insets.offsetScale, color: AppTheme.borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: Corners.lgBorder,
          borderSide: BorderSide(
              width: Insets.offsetScale, color: AppTheme.borderColor),
        ),
      ),
      style: TextStyle(
          fontSize: FontSizes.s18,
          color: AppTheme.black,
          fontWeight: FontWeight.w400,
          fontFamily: Strings.publicSans),
      maxLength: maxLength,
      maxLines: maxLine,
      obscureText: obscureText,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
    );
  }
}
