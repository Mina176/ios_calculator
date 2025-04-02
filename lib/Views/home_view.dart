import 'package:flutter/material.dart';
import 'package:ios_calculator/Widgets/calculator.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String equation = '0';
  String history = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Calculator(
        history: history,
        equation: equation,
      ),
    );
  }
}
