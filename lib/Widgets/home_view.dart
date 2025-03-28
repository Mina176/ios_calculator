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
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    history,
                    style: kHistoryStyle,
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    equation,
                    style: kResultStyle,
                  ),
                ),
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
                        if (equation == '0') {
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
                      },
                    );
                  },
                );
              } // %
              else if (index == 2) {
                return CustomButton(
                  symbol: valueToWidget(values[index]),
                  color: colorSetter(values[index]),
                  onTap: () {
                    setState(
                      () {
                        equation == '0' || equation.contains(values[index])
                            ? equation = equation
                            : equation += displayer(values[index]);
                      },
                    );
                  },
                );
              } // divided
              else if (index == 3) {
                return CustomButton(
                  symbol: valueToWidget(values[index]),
                  color: colorSetter(values[index]),
                  onTap: () {
                    setState(
                      () {
                        equation == '0' ||
                                equation.contains(values[index]) ||
                                equation.endsWith('+') ||
                                equation.endsWith('-') ||
                                equation.endsWith('*') ||
                                equation.endsWith('/') ||
                                equation.endsWith('%')
                            ? equation = equation
                            : equation += displayer(values[index]);
                      },
                    );
                  },
                );
              } // times
              else if (index == 7) {
                return CustomButton(
                  symbol: valueToWidget(values[index]),
                  color: colorSetter(values[index]),
                  onTap: () {
                    setState(
                      () {
                        equation == '0' ||
                                equation.contains(values[index]) ||
                                equation.endsWith('/')
                            ? equation = displayer(values[index])
                            : equation += displayer(values[index]);
                      },
                    );
                  },
                );
              } // minus
              else if (index == 11) {
                return CustomButton(
                  symbol: valueToWidget(values[index]),
                  color: colorSetter(values[index]),
                  onTap: () {
                    setState(
                      () {
                        equation == '0' || equation.contains(values[index])
                            ? equation = equation
                            : equation += displayer(values[index]);
                      },
                    );
                  },
                );
              } // plus
              else if (index == 15) {
                return CustomButton(
                  symbol: valueToWidget(values[index]),
                  color: colorSetter(values[index]),
                  onTap: () {
                    setState(
                      () {
                        equation == '0' || equation.contains(values[index])
                            ? equation = equation
                            : equation += displayer(values[index]);
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
                        history = equation;
                        equation = calculate(equation);
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
                        if (history != '') {
                          equation = '';
                          history = '';
                          equation += displayer(values[index]);
                        }
                        equation == '0'
                            ? equation = displayer(values[index])
                            : equation += displayer(values[index]);
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
