import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ios_calculator/constants.dart';
import 'package:math_expressions/math_expressions.dart';

Widget valueToWidget(String value, double iconSize, double textSize) {
  if (value == 'del') {
    return FaIcon(
      FontAwesomeIcons.deleteLeft,
      size: iconSize,
    );
  } else if (value == '÷') {
    return FaIcon(
      FontAwesomeIcons.divide,
      size: iconSize,
    );
  } else if (value == '×') {
    return FaIcon(
      FontAwesomeIcons.xmark,
      size: iconSize,
    );
  } else if (value == '-') {
    return FaIcon(
      FontAwesomeIcons.minus,
      size: iconSize,
    );
  } else if (value == '+') {
    return FaIcon(
      FontAwesomeIcons.plus,
      size: iconSize,
    );
  } else if (value == '=') {
    return FaIcon(
      FontAwesomeIcons.equals,
      size: iconSize,
    );
  } else {
    return Text(
      value,
      style: TextStyle(fontSize: textSize, fontWeight: FontWeight.w700),
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
    return kPink;
  } else if (value == '×') {
    return kPink;
  } else if (value == '-') {
    return kPink;
  } else if (value == '+') {
    return kPink;
  } else if (value == '=') {
    return kPink;
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

String formatNumber(String numStr) {
  if (numStr.isEmpty) return "";

  // Remove existing commas before reformatting
  numStr = numStr.replaceAll(',', '');

  // Handle decimals separately
  if (numStr.contains('.')) {
    List<String> parts = numStr.split('.');
    String integerPart = parts[0];
    String decimalPart = parts.length > 1 ? parts[1] : "";

    // Format the integer part (Add commas)
    integerPart = integerPart.replaceAllMapped(
        RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]},");

    return "$integerPart.$decimalPart"; // Recombine
  } else {
    return numStr.replaceAllMapped(
        RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]},");
  }
}
