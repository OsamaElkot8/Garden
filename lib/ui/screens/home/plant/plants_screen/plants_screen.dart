import 'package:flutter/material.dart';
import 'package:garden/main.dart';
import 'package:garden/ui/screens/home/plant/plants_screen/appBar_bottom_search_field.dart';
import 'package:garden/ui/screens/home/plant/plants_screen/plants_list_view/plants_list_view.dart';

class PlantsScreen extends StatelessWidget {
  static const String id = 'plantsScreen';
  const PlantsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appLocalizations(context).garden),
        bottom: const AppBarBottomSearchField(),
      ),
      body: SafeArea(
        child: PlantsListView(),
      ),
      floatingActionButton: _addPlantFloatingActionButton(context),
    );
  }

  Widget _addPlantFloatingActionButton(BuildContext context) =>
      FloatingActionButton.extended(
        onPressed: _addPlantButtonOnPressed,
        label: Text(appLocalizations(context).addPlant),
        icon: const Icon(Icons.add),
      );

  void _addPlantButtonOnPressed() {}
}
