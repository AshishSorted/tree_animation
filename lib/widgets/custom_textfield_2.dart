

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tree_animation/common/styles.dart';
import 'package:tree_animation/common/themes.dart';


class CustomTextField2 extends StatefulWidget {
  const CustomTextField2(
      {super.key,
      this.controller,
      this.hintText,
      this.prefixIcon,
      this.borderColor,
      this.suffixIcon,
      this.borderWidth,
      this.onChanged,
      this.minLines = 1,
      this.maxLines = 1,
      this.hintTextColor,
        this.fontSize = 13,
      this.inputType = TextInputType.text,
      this.align = TextAlign.start,
      this.inputFormatter = const []});

  final String? hintText;
  final TextEditingController? controller;
  final Icon? prefixIcon;
  final IconButton? suffixIcon;
  final Color? hintTextColor;
  final Color? borderColor;
  final double? borderWidth;
  final ValueChanged? onChanged;
  final int? minLines;
  final int? maxLines;
  final TextInputType inputType;
  final TextAlign align;
  final List<TextInputFormatter> inputFormatter;
  final double fontSize;

  @override
  State<CustomTextField2> createState() => _CustomTextField2State();
}

class _CustomTextField2State extends State<CustomTextField2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 1, right: Insets.med),
      margin: EdgeInsets.only(top: Insets.xs, bottom: Insets.xs),
      decoration: BoxDecoration(
        // border: Border.all(
        //     color: widget.borderColor ?? AppTheme.grey.withOpacity(0.2),
        //     width: widget.borderWidth ?? 1.6),
        border: Border(
          bottom: BorderSide(
              color: AppTheme.greyC5C2C2, width: widget.borderWidth ?? .5),
        ),
        // borderRadius: Corners.smBorder * 4,
      ),
      child: TextField(
        textAlign: widget.align,
        inputFormatters: widget.inputFormatter,
        keyboardType: widget.inputType,
        onChanged: widget.onChanged,
        style: TextStyles.primary.copyWith(
          fontFamily: "Gilroy",
          fontSize: widget.fontSize,
          fontWeight: FontWeight.w400,
        ),
        controller: widget.controller,
        minLines: widget.minLines,
        maxLines: widget.maxLines,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(bottom: 0),
          // label: Text(
          //   widget.hintText ?? '',
          //   style: TextStyles.primary.copyWith(
          //     fontSize: 13,
          //     fontFamily: "Gilroy",
          //     color: widget.hintTextColor ?? AppTheme.black.withOpacity(0.4),
          //     fontWeight: FontWeight.w500,
          //   ),
          // ),
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
          border: InputBorder.none,
          hintStyle: TextStyles.primary.copyWith(
              fontSize: widget.fontSize,
              fontFamily: "Gilroy",
              color: widget.hintTextColor ?? AppTheme.black.withOpacity(0.4),
              fontWeight: FontWeight.w500),
          hintText: widget.hintText,
        ),
      ),
    );
  }
}
