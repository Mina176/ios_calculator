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
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(children: [
        DisplayScreen(history: history, equation: equation),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.65,
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.all(0),
            itemCount: values.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, mainAxisSpacing: 4, crossAxisSpacing: 4),
            itemBuilder: (context, index) {
              // delete left button
              if (index == 0) {
                return CustomButton(
                  symbol: valueToWidget(values[index]),
                  color: colorSetter(values[index]),
                  onTap: () => deleteLeft(),
                );
              } // AC
              else if (index == 1) {
                return CustomButton(
                  symbol: valueToWidget(values[index]),
                  color: colorSetter(values[index]),
                  onTap: () => ac(),
                );
              }
              // operators
              else if (index == 2 ||
                  index == 3 ||
                  index == 7 ||
                  index == 11 ||
                  index == 15) {
                return CustomButton(
                  symbol: valueToWidget(values[index]),
                  color: colorSetter(values[index]),
                  onTap: () => opeartors(index),
                );
              } // 00 button
              else if (index == 16) {
                return CustomButton(
                  symbol: valueToWidget(values[index]),
                  color: colorSetter(values[index]),
                  onTap: () => doubleZero(index),
                );
              } // '.'
              else if (index == 18) {
                return CustomButton(
                  symbol: valueToWidget(values[index]),
                  color: colorSetter(values[index]),
                  onTap: () => decimalPoint(index),
                );
              } //equals
              else if (index == 19) {
                return CustomButton(
                  symbol: valueToWidget(values[index]),
                  color: colorSetter(values[index]),
                  onTap: () => equals(),
                );
              } else {
                return CustomButton(
                  symbol: valueToWidget(values[index]),
                  color: colorSetter(values[index]),
                  onTap: () => numbers(index),
                );
              }
            },
          ),
        ),
      ]),
    ));
  }

  void numbers(int index) {
    setState(
      () {
        if (history == '') {
          equation == '0'
              ? equation = displayer(values[index])
              : equation += displayer(values[index]);
        } else {
          history = '';
          equation = '';
          equation += displayer(values[index]);
        }
      },
    );
  }

  void equals() {
    setState(
      () {
        if (endsWithOperator(equation)) {
          history == '';
        } else if (containsOperator(equation)) {
          history = equation;
          equation = calculate(equation);
        }
      },
    );
  }

  void decimalPoint(int index) {
    setState(
      () {
        if (equation.endsWith('.')) {
          equation = equation;
        } else if (endsWithOperator(equation)) {
          equation += '0.';
        } else {
          equation += displayer(values[index]);
        }
      },
    );
  }

  void doubleZero(int index) {
    setState(
      () {
        if (equation == '0') {
          equation = '0';
          return;
        }
        if (history == '') {
          equation == '0'
              ? equation = displayer(values[index])
              : equation += displayer(values[index]);
        } else if (history != '') {
          history = '';
          equation = '';
          equation += displayer(values[index]);
        }
      },
    );
  }

  void opeartors(int index) {
    setState(
      () {
        if (history != '') {
          history = '';
        }
        endsWithOperator(equation)
            ? equation = equation.substring(0, equation.length - 1) +
                displayer(values[index])
            : equation += displayer(values[index]);
      },
    );
  }

  void ac() {
    setState(
      () {
        equation = '0';
        history = '';
      },
    );
  }

  void deleteLeft() {
    setState(
      () {
        if (history == '') {
          equation.substring(0, equation.length - 1);
        } else {
          history = '';
          equation = '0';
        }
        equation.length == 1
            ? equation = '0'
            : equation = equation.substring(0, equation.length - 1);
      },
    );
  }
}
