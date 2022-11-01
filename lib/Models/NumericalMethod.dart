import "package:math_expressions/math_expressions.dart";



abstract class NumericalMethod{



  static double error=0.01;

  double upperLimit;
  double lowerLimit;
  String expression="3*x - 9";

   NumericalMethod({required this.upperLimit,required this.lowerLimit,required this.expression});

   bool checkOppositeSigns(double a, double b, Expression exp) {
    Variable x = Variable('x');
    ContextModel cm = ContextModel();
    cm.bindVariable(x, Number(a));
    double f_of_a = exp.evaluate(EvaluationType.REAL, cm);

    print('fofa:'+f_of_a.toString());

    cm.bindVariable(x, Number(b));
    double f_of_b = exp.evaluate(EvaluationType.REAL, cm);
    print('fofb:'+f_of_b.toString());

    if (f_of_a * f_of_b < 0) {
      return true;
    }

    print('false sign cond');
    return false;
  }


  double getCurrentError(double oldValue, double newValue) {
    return ((newValue - oldValue) / oldValue).abs();
  }

 dynamic getFunctionRoot(){return null;}



}