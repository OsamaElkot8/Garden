import 'package:flutter/material.dart';
import 'package:garden/ui/screens/home/plant/plants_screen/plants_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String id = 'homeScreen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: PlantsScreen(),
      ),
    );
  }
}
