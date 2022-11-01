
import 'package:numerical_methods/Models/NumericalMethod.dart';
import 'package:math_expressions/math_expressions.dart';

class FixedPoint extends NumericalMethod{


  static String title="Fixed_Point_iteration";

  int decimalPlaces;

  String expression="2*x-2";

String initialExpression;
  int iterationCount=0;

  FixedPoint({required this.decimalPlaces,required this.expression ,required this.initialExpression}):super(expression: expression,
    lowerLimit: 0,
    upperLimit: 1
      //lowerlimit and upperlimit will be modified




  );


  int _getEndingX(){



    Parser p = Parser();

    Expression exp = p.parse(initialExpression);

    //finding upper limit that make sign change

    int count=upperLimit.toInt();

      while(!checkOppositeSigns(lowerLimit,count.toDouble(),exp)){
        print(count);
        count++;
    }

return count;
  }




  bool _checkGDashCondition(){
    Variable x = Variable('x');
    Parser p = Parser();
    Expression exp = p.parse(expression);
    ContextModel cm = ContextModel();

    Expression derivedExpression=exp.derive('x').simplify();
    cm.bindVariable(x, Number((upperLimit)));

    double gDash=derivedExpression.evaluate(EvaluationType.REAL,cm);

    if(gDash.abs()<1){
      return true;

    }

    return false;

  }




  int getIterationCount(){

    return iterationCount;

  }

  @override
  dynamic getFunctionRoot() {
   //we have the lower limit =0


    this.upperLimit=_getEndingX().toDouble();

    //if | gDash | < 1
    if(_checkGDashCondition()) {


      Variable x = Variable('x');
      Parser p = Parser();
      Expression exp = p.parse(expression);
      ContextModel cm = ContextModel();


// calculate x0
      cm.bindVariable(x, Number(lowerLimit));
      double previous=exp.evaluate(EvaluationType.REAL, cm);

 // calculate x1
      int count =lowerLimit.toInt()+1;
      cm.bindVariable(x, Number(count));
      double ans=exp.evaluate(EvaluationType.REAL, cm);



      while(ans.toStringAsFixed(decimalPlaces)!=previous.toStringAsFixed(decimalPlaces)){
        count++;

        previous=ans;
        print(previous);


        cm.bindVariable(x, Number(previous));
        ans=exp.evaluate(EvaluationType.REAL, cm);
        print(ans);

        this.iterationCount++;



      }






     return ans;


    }else{


      print('method cannot be applied');
      return null;
    }






  }




  }
















