import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garden/main.dart';
import 'package:garden/models/bloc/plants/plants_cubit.dart';
import 'package:garden/models/entities/plant/plant.dart';
import 'package:garden/ui/components/text_fields/default_text_field.dart';

class AppBarBottomSearchField extends StatelessWidget
    implements PreferredSizeWidget {
  final double _searchFieldHeight = 56.0;
  const AppBarBottomSearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 5.0,
        ),
        DefaultTextField(
          prefixIcon: const Icon(Icons.search),
          hintText: appLocalizations(context).searchPlants,
          onChanged: (String value) => _onChanged(context, name: value),
        ),
        const SizedBox(
          height: 5.0,
        )
      ],
    );
  }

  void _onChanged(BuildContext context, {required String name}) {
    bool _isSearching = name.isNotEmpty;
    if (_isSearching) {
      // in case of typing plants name to search for
      _searchPlants(context, name: name);
    } else {
      /* in case search field cleared, send fetching state with empty list just
      to show the last paginated plants list on the screen.
       */
      _fetchedPlantsAddAll(context);
    }
  }

  void _searchPlants(BuildContext context, {required String name}) {
    PlantsCubit _plantsCubit = context.read<PlantsCubit>();

    _plantsCubit.searchPlants(name: name);
  }

  void _fetchedPlantsAddAll(BuildContext context) {
    PlantsCubit _plantsCubit = context.read<PlantsCubit>();
    _plantsCubit.fetchedPlantsAddAll(plants: <Plant>[]);
  }

  @override
  Size get preferredSize => Size.fromHeight(_searchFieldHeight);
}
