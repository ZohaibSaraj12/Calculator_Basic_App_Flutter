import 'package:calculator_app/buttons.dart';
import 'package:math_expressions/math_expressions.dart';

class Functionality {
  static String userInput = '';
  static bool isDotUsed = false;
  static bool isOperatorUsed = false;
  static void appendInput(String s, Function setState) {
    setState(() {
      switch (s) {
        // pattern matching in dart similar to java language

        case String digit when Button.digitButtons.contains(s):
          userInput += digit;
          isOperatorUsed = false;
          break;
        
        case "AC":
          userInput = '';
          isDotUsed = false;
          isOperatorUsed = false;
          break;

        case "⌫":
          if (userInput.isNotEmpty) {
            userInput = userInput.substring(0, userInput.length - 1);
          }

          break;

        case ".":
          if (isDotUsed) {
            return;
          }
          if (userInput.isEmpty) {
            userInput += '0.';
            isDotUsed = true;
          } else {
            userInput += '0.';
            isDotUsed = true;
          }

          break;

        case String operator when Button.operatorButtons.contains(s):
          if (operator == '=' &&
              userInput.isNotEmpty &&
              !isLastValueOperator(userInput)) {
            userInput = calculateResult(userInput);
          } else if (!isOperatorUsed && operator != '=') {
            userInput += operator;
            isOperatorUsed = true;
            isDotUsed = false;
          }

        case String percentage when Button.topRowButtons.contains("%"):
          userInput += percentage;
          isDotUsed = false;
          isOperatorUsed = false;
          break;
      }
    });
  }

  static String calculateResult(String expression) {
    
      ExpressionParser expressionParser = GrammarParser();
      ContextModel contextModel = ContextModel();
      Expression exp = expressionParser.parse(expression);

      double result = exp.evaluate(EvaluationType.REAL, contextModel);
      bool isInt = isInteger(result);
      if (isInt) {
        // String using, which pretend to be calculated more efficiently than an integer
        return result.toInt().toString();
      } else {
        return result.toStringAsFixed(2);
      }
    
  }

  static bool isInteger(double value) {
    if (value % 1 == 0) {
      return true;
    } else {
      return false;
    }
  }

  static bool isLastValueOperator(String s) {
    int length = s.length;
    return Button.operatorButtons.contains(s[length - 1]);
  }
}
