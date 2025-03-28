import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ios_calculator/styles.dart';

const kYellow = Color(0xFFFF9F0A);
const kGrey = Color(0xFF5C5B60);
const kBlack = Color(0xFF2A2A2C);

const List<String> values = [
  'AC',
  'C',
  '%',
  '/',
  '7',
  '8',
  '9',
  '*',
  '4',
  '5',
  '6',
  '-',
  '1',
  '2',
  '3',
  '+',
  '00',
  '0',
  '.',
  '=',
];

Widget valueToWidget(String value) {
  if (value == '/') {
    return FaIcon(
      FontAwesomeIcons.divide,
      size: 32,
    );
  } else if (value == '*') {
    return FaIcon(
      FontAwesomeIcons.xmark,
      size: 32,
    );
  } else if (value == '-') {
    return FaIcon(
      FontAwesomeIcons.minus,
      size: 32,
    );
  } else if (value == '+') {
    return FaIcon(
      FontAwesomeIcons.plus,
      size: 32,
    );
  } else if (value == '=') {
    return FaIcon(
      FontAwesomeIcons.equals,
      size: 32,
    );
  } else {
    return Text(
      value,
      style: keyboardStyle,
    );
  }
}

colorSetter(String value) {
  if (value == 'AC') {
    return kGrey;
  } else if (value == 'C') {
    return kGrey;
  } else if (value == '%') {
    return kGrey;
  } else if (value == '/') {
    return kYellow;
  } else if (value == '*') {
    return kYellow;
  } else if (value == '-') {
    return kYellow;
  } else if (value == '+') {
    return kYellow;
  } else if (value == '=') {
    return kYellow;
  } else {
    return kBlack;
  }
}
