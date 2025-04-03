import 'package:flutter/material.dart';
import 'package:ios_calculator/methods.dart';
import 'package:ios_calculator/styles.dart';

class Result extends StatelessWidget {
  const Result({
    super.key,
    required this.equation,
  });
  final String equation;

  @override
  Widget build(BuildContext context) {
    if (equation.length < 8) {
      return CustomText(
        text: equation,
        textStyle: kResultStyle65,
      );
    }
    if (equation.length < 10) {
      return CustomText(
        text: equation,
        textStyle: kResultStyle55,
      );
    }
    if (equation.length < 12) {
      return CustomText(
        text: equation,
        textStyle: kResultStyle45,
      );
    }
    return CustomText(
      text: equation,
      textStyle: kResultStyle35,
    );
  }
}

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    required this.textStyle,
  });

  final String text;

  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        reverse: true,
        child: Text(
          formatNumber(text),
          style: textStyle,
          maxLines: 1,
        ),
      ),
    );
  }
}
