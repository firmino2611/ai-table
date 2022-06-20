import 'package:ai_table_list/src/utils/styles/ai_input_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AITextField extends StatefulWidget {
  const AITextField({
    Key? key,
    this.controller,
    this.value,
    this.placeholder,
    this.label,
    this.validator,
    this.onChange,
    this.isPassword = false,
    this.isRequered = false,
    this.disabled = false,
    this.masks,
    this.inputType,
    this.maxLines,
    this.sufixIcon,
    this.onTap,
    this.isRequiredText,
  }) : super(key: key);

  final TextEditingController? controller;

  final bool isPassword;
  final bool isRequered;
  final bool disabled;

  final int? maxLines;

  final String? label;
  final String? value;
  final String? placeholder;
  final String? isRequiredText;

  final String? Function(String?)? validator;
  final void Function(String)? onChange;
  final void Function()? onTap;

  final List<TextInputFormatter>? masks;
  final TextInputType? inputType;

  final Widget? sufixIcon;

  @override
  _AITextFieldState createState() => _AITextFieldState();
}

class _AITextFieldState extends State<AITextField> {
  final node = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: widget.onTap,
          child: TextFormField(
            focusNode: node,
            controller: widget.controller,
            enabled: !widget.disabled,
            cursorColor: Colors.black,
            onChanged: widget.onChange,
            maxLines: widget.maxLines ?? 1,
            style: TextStyle(
              fontSize: 14,
              color: !widget.disabled
                  ? Colors.grey.shade600
                  : Colors.grey.shade400,
            ),
            obscureText: widget.isPassword,
            keyboardType: widget.inputType,
            decoration: AIInputStyles.inputTheme(
              sufixIcon: widget.sufixIcon,
              hintText: widget.placeholder,
            ),
            inputFormatters: widget.masks,
            validator: (String? value) {
              if (widget.isRequered && value != null && value.isEmpty) {
                return widget.isRequiredText ?? 'Campo obrigatório';
              }

              if (widget.validator != null) return widget.validator!(value);
              return null;
            },
          ),
        ),
      ],
    );
  }
}
