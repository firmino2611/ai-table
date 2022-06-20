import 'package:ai_table_list/src/utils/styles/ai_colors.dart';
import 'package:flutter/material.dart';

abstract class Constants {
  static boxDecoration({Color? color}) => BoxDecoration(
        color: color ?? AIColors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            blurRadius: 2,
            color: AIColors.grey200,
            spreadRadius: 2,
            offset: const Offset(0, 2),
          )
        ],
      );
}
