import 'package:ai_table_list/src/utils/styles/ai_colors.dart';
import 'package:ai_table_list/src/utils/styles/ai_input_style.dart';
import 'package:flutter/material.dart';

enum IconButtonShape { circle, rounded }

class AIIconButton extends StatelessWidget {
  const AIIconButton({
    Key? key,
    this.backgroundColor = AIColors.blue,
    this.iconColor = AIColors.grey700,
    required this.icon,
    this.onPressed,
    this.size,
    this.outlined = false,
    this.shape = IconButtonShape.rounded,
    this.iconSize,
  }) : super(key: key);

  final Function()? onPressed;

  final Color backgroundColor;
  final Color iconColor;

  final double? iconSize;

  final IconData icon;

  final bool outlined;

  final IconButtonShape shape;

  final HeadingSize? size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            shape == IconButtonShape.rounded ? 8 : 50,
          ),
          color: outlined ? null : backgroundColor,
          border: outlined
              ? Border.all(
                  color: backgroundColor,
                )
              : null,
        ),
        width: iconSize != null ? 60 : null,
        height: iconSize != null ? 60 : null,
        padding: EdgeInsets.all(
          shape == IconButtonShape.rounded ? 7.5 : 10,
        ),
        child: Icon(
          icon,
          color: iconColor,
          size: size?.icon ?? HeadingSize.h2.icon,
        ),
      ),
    );
  }
}
