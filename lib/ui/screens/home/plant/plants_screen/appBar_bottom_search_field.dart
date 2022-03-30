import 'package:flutter/material.dart';
import 'package:garden/main.dart';
import 'package:garden/ui/components/text_fields/default_text_field.dart';

class AppBarBottomSearchField extends StatelessWidget
    implements PreferredSizeWidget {
  final double _searchFieldHeight = 56.0;
  const AppBarBottomSearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextField(
      prefixIcon: const Icon(Icons.search),
      hintText: appLocalizations(context).searchPlants,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(_searchFieldHeight);
}
