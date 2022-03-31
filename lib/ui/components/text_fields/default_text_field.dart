import 'package:flutter/material.dart';
import 'package:garden/ui/ui_helper.dart';

class DefaultTextField extends StatelessWidget {
  final String? helperText, initialValue, hintText;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  const DefaultTextField(
      {Key? key,
      this.controller,
      this.prefixIcon,
      this.hintText,
      this.helperText,
      this.validator,
      this.onChanged,
      this.initialValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = UIHelper.instance.getTextTheme(context);

    return TextFormField(
      controller: controller,
      style: _textTheme.bodyText1,
      decoration: InputDecoration(
          helperText: _helperText(),
          prefixIcon: prefixIcon,
          hintText: hintText),
      validator: validator,
      onChanged: onChanged,
      initialValue: initialValue,
    );
  }

  String? _helperText() {
    if (helperText == null || helperText!.isEmpty) return null;
    return helperText;
  }
}
