import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ios_calculator/styles.dart';
import 'package:math_expressions/math_expressions.dart';

const kYellow = Color(0xFFFF9F0A);
const kGrey = Color(0xFF5C5B60);
const kBlack = Color(0xFF2A2A2C);

const List<String> values = [
  'del',
  'AC',
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
  if (value == 'del') {
    return FaIcon(
      FontAwesomeIcons.deleteLeft,
      size: 32,
    );
  } else if (value == '/') {
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
  if (value == 'del') {
    return kGrey;
  } else if (value == 'AC') {
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

String displayer(String value) {
  if (value == 'del') {
    return '0';
  } else if (value == 'AC') {
    return '0';
  } else {
    return value;
  }
}

String calculate(String expression) {
  if (expression.endsWith('+') ||
      expression.endsWith('-') ||
      expression.endsWith('*') ||
      expression.endsWith('/') ||
      expression.endsWith('%')) {
    return expression;
  }
  String resultString = '';
  Parser parser = Parser();
  Expression exp = parser.parse(expression);

  ContextModel cm = ContextModel();
  double result = exp.evaluate(EvaluationType.REAL, cm);
  result.toString().endsWith('0')
      ? resultString = result.toInt().toString()
      : resultString = result.toString();

  return resultString;
}
