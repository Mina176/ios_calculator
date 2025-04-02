import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ios_calculator/styles.dart';
import 'package:math_expressions/math_expressions.dart';

const kYellow = Color(0xFFFF9F0A);
const kYellowOnPressed = Color(0xFFFBC78D);
const kGrey = Color(0xFF5C5B60);
const kGreyOnPressed = Color(0xFF8C8C8C);
const kBlack = Color(0xFF2A2A2C);
const kBlackOnPressed = Color(0xFF727272);

const List<String> values = [
  'del',
  'AC',
  '％',
  '÷',
  '7',
  '8',
  '9',
  '×',
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

final Map<String, Color> colorMap = {
  'del': kGrey,
  'AC': kGrey,
  '％': kGrey,
  '÷': kYellow,
  '7': kBlack,
  '8': kBlack,
  '9': kBlack,
  '×': kYellow,
  '4': kBlack,
  '5': kBlack,
  '6': kBlack,
  '-': kYellow,
  '1': kBlack,
  '2': kBlack,
  '3': kBlack,
  '+': kYellow,
  '00': kBlack,
  '0': kBlack,
  '.': kBlack,
  '=': kYellow
};

Widget valueToWidget(String value) {
  if (value == 'del') {
    return FaIcon(
      FontAwesomeIcons.deleteLeft,
      size: 32,
    );
  } else if (value == '÷') {
    return FaIcon(
      FontAwesomeIcons.divide,
      size: 32,
    );
  } else if (value == '×') {
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

Color colorSetter(String value) {
  if (value == 'del') {
    return kGrey;
  } else if (value == 'AC') {
    return kGrey;
  } else if (value == '％') {
    return kGrey;
  } else if (value == '÷') {
    return kYellow;
  } else if (value == '×') {
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

bool endsWithOperator(String equation) {
  if (equation.endsWith('+') ||
      equation.endsWith('-') ||
      equation.endsWith('×') ||
      equation.endsWith('÷') ||
      equation.endsWith('％')) {
    return true;
  } else {
    return false;
  }
}

bool containsOperator(String equation) {
  if (equation.contains('+') ||
      equation.contains('-') ||
      equation.contains('×') ||
      equation.contains('÷') ||
      equation.contains('％')) {
    return true;
  } else {
    return false;
  }
}
