import 'package:flutter/cupertino.dart';
import 'package:math_expressions/math_expressions.dart';

enum CalculatorButton {
  Zero,
  One,
  Two,
  Three,
  Four,
  Five,
  Six,
  Seven,
  Eight,
  Nine,
  Clear,
  Backspace,
  Evaluate,
  Dot,
  DoubleZero,
  Plus,
  Minus,
  Times,
  Over,
}

class ExpressionData extends ChangeNotifier {
  String _expression = "";
  String _result = "0";
  CalculatorButton _lastButton = CalculatorButton.Zero;

  String get expression => _expression;
  String get result => _result;

  void _clearExpression() {
    _expression = "";
    _result = "0";
    notifyListeners();
  }

  void _deleteLastDigit() {
    if (_expression.isEmpty) return;

    _expression = _expression.substring(0, _expression.length - 1);
  }

  void _evalExpression() {
    try {
      final Parser parser = Parser();
      Expression exp = parser.parse(_expression);

      _result = exp.evaluate(EvaluationType.REAL, ContextModel()).toString();
      _result = _result.replaceFirst(".0", "");
    } catch (e) {
      _result = "Erro";
    }
  }

  bool _endsWithOperation() {
    return _expression.endsWith("+") ||
        _expression.endsWith("-") ||
        _expression.endsWith("*") ||
        _expression.endsWith("/");
  }

  void buttonPressed(CalculatorButton button) {
    if (_lastButton == CalculatorButton.Evaluate) {
      _expression = _result;
      _result = "";
    }

    switch (button) {
      case CalculatorButton.Zero:
        _expression += "0";
        _lastButton = CalculatorButton.Zero;
        break;
      case CalculatorButton.One:
        _expression += "1";
        _lastButton = CalculatorButton.One;
        break;
      case CalculatorButton.Two:
        _expression += "2";
        _lastButton = CalculatorButton.Two;
        break;
      case CalculatorButton.Three:
        _expression += "3";
        _lastButton = CalculatorButton.Three;
        break;
      case CalculatorButton.Four:
        _expression += "4";
        _lastButton = CalculatorButton.Four;
        break;
      case CalculatorButton.Five:
        _expression += "5";
        _lastButton = CalculatorButton.Five;
        break;
      case CalculatorButton.Six:
        _expression += "6";
        _lastButton = CalculatorButton.Six;
        break;
      case CalculatorButton.Seven:
        _expression += "7";
        _lastButton = CalculatorButton.Seven;
        break;
      case CalculatorButton.Eight:
        _expression += "8";
        _lastButton = CalculatorButton.Eight;
        break;
      case CalculatorButton.Nine:
        _expression += "9";
        _lastButton = CalculatorButton.Nine;
        break;
      case CalculatorButton.Clear:
        _clearExpression();
        _lastButton = CalculatorButton.Clear;
        break;
      case CalculatorButton.Backspace:
        _deleteLastDigit();
        _lastButton = CalculatorButton.Backspace;
        break;
      case CalculatorButton.Evaluate:
        _evalExpression();
        _lastButton = CalculatorButton.Evaluate;
        break;
      case CalculatorButton.Dot:
        _expression += ".";
        _lastButton = CalculatorButton.Dot;
        break;
      case CalculatorButton.DoubleZero:
        _expression += "00";
        _lastButton = CalculatorButton.DoubleZero;
        break;
      case CalculatorButton.Plus:
        if (_endsWithOperation()) _deleteLastDigit();
        _expression += "+";
        _lastButton = CalculatorButton.Plus;
        break;
      case CalculatorButton.Minus:
        if (_endsWithOperation()) _deleteLastDigit();
        _expression += "-";
        _lastButton = CalculatorButton.Minus;
        break;
      case CalculatorButton.Times:
        if (_endsWithOperation()) _deleteLastDigit();
        _expression += "*";
        _lastButton = CalculatorButton.Times;
        break;
      case CalculatorButton.Over:
        if (_endsWithOperation()) _deleteLastDigit();
        _expression += "/";
        _lastButton = CalculatorButton.Over;
        break;
    }

    notifyListeners();
  }
}
