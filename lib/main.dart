import 'package:flutter/material.dart';
import 'package:ios_calculator/Widgets/home_view.dart';
import 'package:ios_calculator/constants.dart';

void main() {
  runApp(const IosCaclulator());

  print(calculate('2/2'));
}

class IosCaclulator extends StatelessWidget {
  const IosCaclulator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
