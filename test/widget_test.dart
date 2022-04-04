// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:garden/models/entities/plant/plant.dart';
import 'package:garden/models/utilities/extensions/datetime_extension.dart';
import 'package:garden/ui/components/buttons/default_text_button.dart';
import 'package:garden/ui/components/custom_single_child_scroll_view.dart';
import 'package:garden/ui/components/drop_downs/default_drop_down.dart';
import 'package:garden/ui/components/refetch_view.dart';
import 'package:garden/ui/components/text_fields/default_text_field.dart';
import 'package:garden/ui/screens/home/plant/plant_manager/planting_date_view.dart';
import 'package:garden/ui/screens/home/plant/plants_screen/plants_list_view/plant_view.dart';
import 'package:garden/ui/screens/home/plant/plants_screen/plants_list_view/plants_list_view.dart';

void main() {
  testWidgets('PlantView test', (WidgetTester tester) async {
    final Plant _plant = Plant(
        id: 1,
        name: 'Test Plant',
        type: 'alpines',
        date: DateTime.now().defaultFormat());

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: PlantView(plant: _plant),
      ),
    ));

    expect(find.text(_plant.name), findsOneWidget);
  });

  testWidgets('PlantsListView test', (WidgetTester tester) async {
    final Plant _plantA = Plant(
        id: 1,
        name: 'Test Plant A',
        type: 'alpines',
        date: DateTime.now().defaultFormat());
    final Plant _plantB = Plant(
        id: 2,
        name: 'Test Plant B',
        type: 'bulbs',
        date: DateTime.now().defaultFormat());
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: PlantsListView(plants: [_plantA, _plantB]),
      ),
    ));

    expect(find.text(_plantA.type), findsOneWidget);
    expect(find.text(_plantB.type), findsOneWidget);
  });

  testWidgets('PlantingDateView test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: PlantingDateView(value: DateTime.now(), onEdit: () {}),
      ),
    ));

    expect(find.byIcon(Icons.edit), findsOneWidget);
  });

  testWidgets('DefaultTextButton test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: DefaultTextButton(text: 'Save'),
      ),
    ));

    expect(find.text('Save'), findsOneWidget);
  });

  testWidgets('DefaultDropDown test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: DefaultDropDown<String>(
          value: 'Test value',
          hint: 'Test Hint',
        ),
      ),
    ));

    expect(find.text('Test Hint'), findsOneWidget);
  });

  testWidgets('DefaultTextField test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: DefaultTextField(
          prefixIcon: Icon(Icons.search),
        ),
      ),
    ));

    expect(find.byIcon(Icons.search), findsOneWidget);
  });

  testWidgets('CustomSingleChildScrollView test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: CustomSingleChildScrollView(child: Text('Test Value')),
      ),
    ));

    expect(find.text('Test Value'), findsOneWidget);
  });

  testWidgets('ReFetchView test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: ReFetchView(error: 'error'),
      ),
    ));

    expect(find.text('error'), findsOneWidget);
  });
}
