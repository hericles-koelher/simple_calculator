import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_calculator/models/expression_data.dart';

class CalculatorHomePage extends StatelessWidget {
  Widget buildButton(
      {required Color color,
      required String text,
      required CalculatorButton pressedButton,
      required BuildContext context}) {
    return Expanded(
      child: GestureDetector(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(1.0),
              decoration: BoxDecoration(
                color: color,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: AutoSizeText(
                text,
                style: TextStyle(
                  fontSize: 75,
                  color: Colors.white,
                ),
                maxLines: 1,
              ),
            ),
          ],
        ),
        onTap: () {
          final ExpressionData data = Provider.of(context, listen: false);
          debugPrint("Botão clicado: ${pressedButton.toString()}");
          data.buttonPressed(pressedButton);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          "Simple Calculator",
          style: TextStyle(
            fontSize: 25.0,
          ),
          maxLines: 1,
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Screen
            Expanded(
              child: Consumer<ExpressionData>(
                builder: (context, expData, builder) {
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        AutoSizeText(
                          expData.expression,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 40.0,
                            color: Colors.grey[600],
                          ),
                        ),
                        AutoSizeText(
                          expData.result,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 50.0,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            // Keyboard
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  // First Row
                  Expanded(
                    child: Row(
                      children: [
                        buildButton(
                          color: Colors.pinkAccent,
                          text: "C",
                          context: context,
                          pressedButton: CalculatorButton.Clear,
                        ),
                        buildButton(
                          color: Colors.blueAccent,
                          text: "⌫",
                          context: context,
                          pressedButton: CalculatorButton.Backspace,
                        ),
                        buildButton(
                          color: Colors.blueAccent,
                          text: "÷",
                          context: context,
                          pressedButton: CalculatorButton.Over,
                        ),
                        buildButton(
                          color: Colors.blueAccent,
                          text: "×",
                          context: context,
                          pressedButton: CalculatorButton.Times,
                        ),
                      ],
                    ),
                  ),
                  // Second Row
                  Expanded(
                    child: Row(
                      children: [
                        buildButton(
                          color: Colors.grey,
                          text: "7",
                          context: context,
                          pressedButton: CalculatorButton.Seven,
                        ),
                        buildButton(
                          color: Colors.grey,
                          text: "8",
                          context: context,
                          pressedButton: CalculatorButton.Eight,
                        ),
                        buildButton(
                          color: Colors.grey,
                          text: "9",
                          context: context,
                          pressedButton: CalculatorButton.Nine,
                        ),
                        buildButton(
                          color: Colors.blueAccent,
                          text: "-",
                          context: context,
                          pressedButton: CalculatorButton.Minus,
                        ),
                      ],
                    ),
                  ),
                  // Third Row
                  Expanded(
                    child: Row(
                      children: [
                        buildButton(
                          color: Colors.grey,
                          text: "4",
                          context: context,
                          pressedButton: CalculatorButton.Four,
                        ),
                        buildButton(
                          color: Colors.grey,
                          text: "5",
                          context: context,
                          pressedButton: CalculatorButton.Five,
                        ),
                        buildButton(
                          color: Colors.grey,
                          text: "6",
                          context: context,
                          pressedButton: CalculatorButton.Six,
                        ),
                        buildButton(
                          color: Colors.blueAccent,
                          text: "+",
                          context: context,
                          pressedButton: CalculatorButton.Plus,
                        ),
                      ],
                    ),
                  ),
                  // Fourth, Fifth Row and "=" Button
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            children: [
                              // Fourth Row
                              Expanded(
                                child: Row(
                                  children: [
                                    buildButton(
                                      color: Colors.grey,
                                      text: "1",
                                      context: context,
                                      pressedButton: CalculatorButton.One,
                                    ),
                                    buildButton(
                                      color: Colors.grey,
                                      text: "2",
                                      context: context,
                                      pressedButton: CalculatorButton.Two,
                                    ),
                                    buildButton(
                                      color: Colors.grey,
                                      text: "3",
                                      context: context,
                                      pressedButton: CalculatorButton.Three,
                                    ),
                                  ],
                                ),
                              ),
                              // Fifty Row
                              Expanded(
                                child: Row(
                                  children: [
                                    buildButton(
                                      color: Colors.grey,
                                      text: ".",
                                      context: context,
                                      pressedButton: CalculatorButton.Dot,
                                    ),
                                    buildButton(
                                      color: Colors.grey,
                                      text: "0",
                                      context: context,
                                      pressedButton: CalculatorButton.Zero,
                                    ),
                                    buildButton(
                                      color: Colors.grey,
                                      text: "00",
                                      context: context,
                                      pressedButton:
                                          CalculatorButton.DoubleZero,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        // "=" Button
                        buildButton(
                          color: Colors.pinkAccent,
                          text: "=",
                          context: context,
                          pressedButton: CalculatorButton.Evaluate,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
