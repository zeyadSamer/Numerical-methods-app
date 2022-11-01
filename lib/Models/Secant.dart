import 'package:numerical_methods/Models/NumericalMethod.dart';
import 'package:math_expressions/math_expressions.dart';
class Secant extends NumericalMethod{

  double err=100.0;

  static const String title="Secant";

  Secant({required double upperLimit ,required double lowerLimit ,required String expression } ):super(

    upperLimit: upperLimit,
    lowerLimit: lowerLimit,
    expression: expression
  );



int iterationCount=0;


  @override
    double getFunctionRoot(){


    double oldRoot = lowerLimit;
    double root = upperLimit;
    double fOfRoot=1;
    double fOfOldRoot=1;


    Variable x = Variable('x');
    Parser p = Parser();
    Expression exp = p.parse(expression);
    ContextModel cm = ContextModel();


    print("by secant");


    while(err>NumericalMethod.error){

      iterationCount++;
      cm.bindVariable(x,Number(root));
      fOfRoot=exp.evaluate(EvaluationType.REAL, cm);

      cm.bindVariable(x,Number(oldRoot));
      fOfOldRoot=exp.evaluate(EvaluationType.REAL, cm);


      // to assign this value to the old root after calculating the new root that depends on the current old root
      double temp=root;

      root= root - ( fOfRoot * (root-oldRoot ) / (fOfRoot-fOfOldRoot) );

      oldRoot=temp;

        err = getCurrentError(oldRoot, root);
        print(err);





      print("iteration:$iterationCount, $root");



    }


   return root;

  }


  int getIterationCount(){

    return this.iterationCount;

  }









}