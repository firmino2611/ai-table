import 'package:ai_table_list/src/utils/styles/ai_colors.dart';
import 'package:flutter/material.dart';

abstract class AIInputStyles {
  static InputDecoration inputTheme({
    bool isPassword = false,
    EdgeInsets? padding,
    Widget? sufixIcon,
    Widget? prefixIcon,
    String? hintText,
  }) =>
      InputDecoration(
        isDense: true,
        hintText: hintText,
        suffixIcon: sufixIcon,
        suffixIconColor: AIColors.black,
        prefixIcon: prefixIcon,
        contentPadding: padding ??
            const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10,
            ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AIColors.black,
            width: 1.5,
          ),
        ),
        errorStyle: TextStyle(
          fontSize: HeadingSize.h3.text,
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AIColors.red,
            width: 2,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AIColors.black,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(color: AIColors.grey400),
        ),
        disabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AIColors.grey400,
          ),
        ),
      );
}

enum HeadingSize {
  h0(32, 29),
  h1(24, 26),
  h2(16, 23),
  h3(14, 20),
  h4(12, 17),
  h5(10, 14);

  final double text;
  final double icon;

  const HeadingSize(this.text, this.icon);
}
