import 'package:numerical_methods/Models/NumericalMethod.dart';
import 'package:math_expressions/math_expressions.dart';

class NewtonRaphson extends NumericalMethod {
  int initialRoot;
  double err=100.0;
  static const String title="Newton_Raphson";
  int iterationCount=0;
  //lower limit and upper limit is not needed in this method

  NewtonRaphson({required expression, required this.initialRoot})
      : super(expression: expression, upperLimit: 0.0, lowerLimit: 0.0);



  @override
    getFunctionRoot() {


    double oldRoot=initialRoot.toDouble();
    double root=initialRoot.toDouble();
    double fOfRoot= 1;
    double fOfRootdash = 1;
    Variable x = Variable('x');
    Parser p = Parser();
    Expression exp = p.parse(expression);
    ContextModel cm = ContextModel();


    print("by newton raphson");

    while(err>NumericalMethod.error){

     //calculate f(Root)
      cm.bindVariable(x, Number(root));
      fOfRoot=exp.evaluate(EvaluationType.REAL, cm);
      Expression derivedExpression=exp.derive('x').simplify();
      fOfRootdash=derivedExpression.evaluate(EvaluationType.REAL, cm);
      iterationCount++;

      oldRoot=root;
      root= root - (fOfRoot/fOfRootdash);


      //error computation

      if(iterationCount>1){

        this.err=getCurrentError(oldRoot,root);


      }



      print("iteration:$iterationCount, $root");

    }


    return root;
  }

  int getIterationCount(){

    return iterationCount;
  }











}



