import 'package:numerical_methods/Models/NumericalMethod.dart';
import 'package:math_expressions/math_expressions.dart';
import 'dart:math';

class Bisection extends NumericalMethod {
  Bisection(
      {required double upperLimit,
      required double lowerLimit,
      required String expression})
      : super(
            upperLimit: upperLimit,
            lowerLimit: lowerLimit,
            expression: expression);

  double err = 100;
  int iterationCount = 0;
  static const String title = "Bisection";

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

    print('by bisection');

    while (this.err > NumericalMethod.error) {
      iterationCount++;

      if (!signCondition) {
        //error for wrong intervals;
        return null;
      }

      //getting f(root)
      root = (a + b) / 2.0;
      cm.bindVariable(x, Number(root));
      double fOfRoot = exp.evaluate(EvaluationType.REAL, cm);
      cm.bindVariable(x, Number(a));

      double fOfA = exp.evaluate(EvaluationType.REAL, cm);

      if (fOfRoot * fOfA < 0) {
        //interval[a,root]
        b = root;
        fOfb = fOfRoot;
      } else if (fOfRoot * fOfA > 0) {
        // interval[root,b]
        a = root;
        fOfA = fOfRoot;
      }

      print('[$a , $b]');

      //we will compute the error starting with the 2nd iteration
      if (iterationCount > 1) {
        //updating the err
        this.err = getCurrentError(oldRoot, root);
      }

      print('$iterationCount ,$root');
      oldRoot = root;
    }

    return root;
  }

  int getIterationCount() {
    return iterationCount;
  }
}
