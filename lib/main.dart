import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_calculator/models/expression_data.dart';
import 'package:simple_calculator/pages/calculator_home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ExpressionData>(
      create: (context) => ExpressionData(),
      child: MaterialApp(
        home: CalculatorHomePage(),
      ),
    );
  }
}
