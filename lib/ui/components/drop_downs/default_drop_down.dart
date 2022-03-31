import 'package:flutter/material.dart';
import 'package:garden/ui/ui_helper.dart';

class DefaultDropDown<T> extends StatelessWidget {
  final T? value;
  final String? hint;
  final List<DropdownMenuItem<T>>? items;
  final void Function(T?)? onChanged;
  const DefaultDropDown(
      {Key? key, required this.value, this.hint, this.items, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme _textTheme = UIHelper.instance.getTextTheme(context);

    return DropdownButtonFormField<T>(
      value: value,
      decoration:
          InputDecoration(labelStyle: _textTheme.bodyText1, hintText: hint),
      items: items,
      onChanged: (T? value) {
        onChanged?.call(value);
      },
    );
  }
}
