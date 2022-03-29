import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String id = 'homeScreen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}
