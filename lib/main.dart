import 'package:flutter/material.dart';
import 'package:ios_calculator/Widgets/home_view.dart';

void main() {
  runApp(const IosCaclulator());
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
