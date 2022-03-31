import 'package:flutter/material.dart';
import 'package:garden/models/entities/plant/plant.dart';
import 'package:garden/ui/screens/home/plant/plants_screen/plants_list_view/plant_view.dart';

class PlantsListView extends StatelessWidget {
  final List<Plant> plants;
  final ScrollController? controller;
  const PlantsListView({Key? key, this.controller, required this.plants})
      : super(key: key);

  final EdgeInsets _listViewPadding = const EdgeInsets.all(20.0);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: _listViewPadding,
      controller: controller,
      itemBuilder: (context, index) {
        final Plant _singlePlant = plants[index];
        return PlantView(plant: _singlePlant);
      },
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemCount: plants.length,
    );
  }
}
