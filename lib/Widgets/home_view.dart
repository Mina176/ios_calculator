import 'package:flutter/material.dart';
import 'package:ios_calculator/constants.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Expanded(
          child: Container(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.65,
              child: GridView.builder(
                padding: EdgeInsets.all(0),
                itemCount: 20,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (context, index) {
                  return CustomButton();
                },
              )),
        )
      ]),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
      child: Container(
        decoration: BoxDecoration(
            color: kBlack, borderRadius: BorderRadius.circular(64)),
        child: Center(
          child: Text(
            'AC',
          ),
        ),
      ),
    );
  }
}
