import 'package:numerical_methods/Models/NumericalMethod.dart';
import 'package:math_expressions/math_expressions.dart';

class FalsePosition extends NumericalMethod {
  FalsePosition(
      {required double upperLimit,
      required double lowerLimit,
      required String expression})
      : super(
            upperLimit: upperLimit,
            lowerLimit: lowerLimit,
            expression: expression);

  double err = 100;
  int iterationCount = 0;
  static const String title="False_Position";



  @override
  dynamic getFunctionRoot() {
    double oldRoot = 0;
    double root = 100;
    double a = lowerLimit;
    double b = upperLimit;
    double fOfA = 1;
    double fOfb = 1;
    Variable x = Variable('x');
    Parser p = Parser();
    Expression exp = p.parse(expression);
    ContextModel cm = ContextModel();

    bool signCondition = checkOppositeSigns(lowerLimit, upperLimit, exp);
    print("by FalsePosition");


    while (err > NumericalMethod.error) {
      iterationCount++;
      if (!signCondition) {
        //error for wrong intervals;
        return null;
      }

      cm.bindVariable(x, Number(b));
      double fOfb = exp.evaluate(EvaluationType.REAL, cm);

      cm.bindVariable(x, Number(a));
      double fOfA = exp.evaluate(EvaluationType.REAL, cm);

      root = b - ((fOfb * (b - a)) / (fOfb - fOfA));
      cm.bindVariable(x, Number(root));
      double fOfRoot = exp.evaluate(EvaluationType.REAL, cm);
      if (fOfRoot * fOfA < 0) {
        b = root;
        fOfb = fOfRoot;
      } else {
        a = root;
        fOfA = fOfRoot;
      }

      if (iterationCount > 1) {
        //updating the err
        err = getCurrentError(oldRoot, root);
      }
      oldRoot = root;
    }


    return root;
  }

  int getIterationCount(){

    return iterationCount;
  }
}
