import 'package:flutter/material.dart';
import 'package:ios_calculator/Widgets/custom_button.dart';
import 'package:ios_calculator/constants.dart';
import 'package:ios_calculator/styles.dart';

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
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    reverse: true,
                    child: Text(
                      history,
                      style: kHistoryStyle,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    reverse: true,
                    child: FittedBox(
                      child: Text(
                        equation,
                        style: kResultStyle56,
                        maxLines: 1,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.65,
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.all(0),
            itemCount: values.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
            itemBuilder: (context, index) {
              // delete left button
              if (index == 0) {
                return CustomButton(
                  symbol: valueToWidget(values[index]),
                  color: colorSetter(values[index]),
                  onTap: () {
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
                            : equation =
                                equation.substring(0, equation.length - 1);
                      },
                    );
                  },
                  onLongPress: () {
                    setState(
                      () {
                        equation = '0';
                        history = '';
                      },
                    );
                  },
                );
              } // AC
              else if (index == 1) {
                return CustomButton(
                  symbol: valueToWidget(values[index]),
                  color: colorSetter(values[index]),
                  onTap: () {
                    setState(
                      () {
                        equation = '0';
                        history = '';
                      },
                    );
                  },
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
                  onTap: () {
                    setState(
                      () {
                        if (history != '') {
                          history = '';
                        }
                        endsWithOperator(equation)
                            ? equation =
                                equation.substring(0, equation.length - 1) +
                                    displayer(values[index])
                            : equation += displayer(values[index]);
                      },
                    );
                  },
                );
              } // 00 button
              else if (index == 16) {
                return CustomButton(
                  symbol: valueToWidget(values[index]),
                  color: colorSetter(values[index]),
                  onTap: () {
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
                  },
                );
              } // '.'
              else if (index == 18) {
                return CustomButton(
                  symbol: valueToWidget(values[index]),
                  color: colorSetter(values[index]),
                  onTap: () {
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
                  },
                );
              } //equals
              else if (index == 19) {
                return CustomButton(
                  symbol: valueToWidget(values[index]),
                  color: colorSetter(values[index]),
                  onTap: () {
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
                  },
                );
              } else {
                return CustomButton(
                  symbol: valueToWidget(values[index]),
                  color: colorSetter(values[index]),
                  onTap: () {
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
                        if (equation.endsWith('0')) {
                          equation = equation;
                        }
                      },
                    );
                  },
                );
              }
            },
          ),
        ),
      ]),
    ));
  }
}
