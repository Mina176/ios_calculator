import 'package:flutter/material.dart';
import 'package:ios_calculator/Widgets/custom_button.dart';
import 'package:ios_calculator/Widgets/display_screen.dart';
import 'package:ios_calculator/constants.dart';
import 'package:ios_calculator/methods.dart';

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
      body: OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.portrait
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(children: [
                    DisplayScreen(
                        history: history,
                        equation: equation,
                        historyOnTap: () {
                          setState(() {
                            equation = history;
                            history = '';
                          });
                        }),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.65,
                      child: GridView.count(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.all(0),
                        crossAxisCount: 4,
                        mainAxisSpacing: 4,
                        crossAxisSpacing: 4,
                        children: values.map((value) {
                          return CustomButton(
                            symbol: valueToWidget(value),
                            color: colorSetter(value),
                            onTap: () => onBtnTap(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ]),
                )
              : Column(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.blue,
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.65,
                      color: Colors.red,
                    ),
                  ],
                );
        },
      ),
    );
  }

  onBtnTap(String value) {
    setState(() {
      if (value == 'del') {
        {
          if (history == '') {
            equation.substring(0, equation.length - 1);
          } else {
            history = '';
            equation = '0';
          }
          equation.length == 1
              ? equation = '0'
              : equation = equation.substring(0, equation.length - 1);
        }
      } else if (value == 'AC') {
        {
          equation = '0';
          history = '';
        }
      } else if (value == '=') {
        {
          if (endsWithOperator(equation)) {
            history == '';
          } else if (containsOperator(equation)) {
            history = equation;
            equation = calculate(equation);
          }
        }
      } else if (value == '.') {
        {
          if (equation.endsWith('.')) {
            equation = equation;
          } else if (endsWithOperator(equation)) {
            equation += '0.';
          } else {
            equation += '.';
          }
        }
      } else if (value == '00') {
        {
          if (equation == '0') {
            equation = '0';
            return;
          }
          if (history == '') {
            equation == '0' ? equation = '00' : equation += '00';
          } else if (history != '') {
            history = '';
            equation = '';
            equation += '00';
          }
        }
      } else if (value == '％' ||
          value == '+' ||
          value == '-' ||
          value == '×' ||
          value == '÷') {
        {
          if (history != '') {
            history = '';
          }
          endsWithOperator(equation)
              ? equation = equation.substring(0, equation.length - 1) + value
              : equation += value;
        }
      } else {
        {
          if (history == '') {
            equation == '0' ? equation = value : equation += value;
          } else {
            history = '';
            equation = '';
            equation += value;
          }
        }
      }
    });
  }
}
