import 'package:flutter/material.dart';
import 'package:garden/ui/ui_helper.dart';

class DefaultTextField extends StatefulWidget {
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
  State<DefaultTextField> createState() => _DefaultTextFieldState();
}

class _DefaultTextFieldState extends State<DefaultTextField> {
  late TextTheme _textTheme;

  void _initializeUIServices() {
    _textTheme = UIHelper.instance.getTextTheme(context);
  }

  @override
  void initState() {
    _initializeUIServices();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      style: _textTheme.bodyText1,
      decoration: InputDecoration(
          helperText: _helperText(),
          prefixIcon: widget.prefixIcon,
          hintText: widget.hintText),
      validator: widget.validator,
      onChanged: widget.onChanged,
      initialValue: widget.initialValue,
    );
  }

  String? _helperText() {
    if (widget.helperText == null || widget.helperText!.isEmpty) return null;
    return widget.helperText;
  }
}
