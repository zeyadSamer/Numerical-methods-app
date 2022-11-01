import 'package:flutter/material.dart';
import 'package:numerical_methods/Models/method-enum.dart';
import 'package:numerical_methods/components/Form1.dart';
import 'package:numerical_methods/components/Form2.dart';
import 'package:numerical_methods/screens/OutputScreen.dart';

import '../Models/Bisection.dart';
import '../Models/False-position.dart';
import '../Models/NewtonRaphson.dart';
import '../Models/Secant.dart';
import '../Models/FixedPoint.dart';
class InputScreen extends StatelessWidget {
  InputScreen({required this.methodScreenName});

  TextEditingController eqnController = TextEditingController();
  TextEditingController upperLimitController = TextEditingController();
  TextEditingController lowerLimitController = TextEditingController();
  TextEditingController initialRootController = TextEditingController();
  TextEditingController desiredDecimalController = TextEditingController();
  TextEditingController gOfXController=TextEditingController();

  late double upperLimit;
  late double lowerLimit;
  late double root;
  late int initialRoot;
  late int desiredDecimal;
   int iterations=0;
  dynamic getMethodForm() {
    if (methodScreenName == Methods.Bisection.name ||
        methodScreenName == Methods.False_Position.name ||
        methodScreenName == Methods.Secant.name) {
      return BracketingForm(
        eqnController: eqnController,
        lowerLimitController: lowerLimitController,
        upperLimitController: upperLimitController,
      );
    } else if (methodScreenName == Methods.Newton_Raphson.name) {
      return OpenMethodsForm(
        hintMessage: " Your P0 'Initial Root' ",
        controller: initialRootController,
        gOfXController: gOfXController,
        eqnController: eqnController,
      );
    } else {
      return OpenMethodsForm(isFixedPoint: true,hintMessage: 'Your Desired Decimal Places',

      eqnController: eqnController,
        gOfXController: gOfXController,

        controller: desiredDecimalController,

      );
    }
  }

  final String methodScreenName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(

        toolbarHeight: 80,
        title: Text(methodScreenName,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30,
                letterSpacing: 2)),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),

        shadowColor: Colors.white10,
      ),
      body: Card(
        child: Card(
          shadowColor: Colors.black12,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(' Method Parameters',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
              SizedBox(height: 10),
              getMethodForm(),
              SizedBox(height: 25),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    String equation = eqnController.text;

                    if (Bisection.title == methodScreenName) {
                       this. upperLimit = double.parse(upperLimitController.text);
                      this. lowerLimit = double.parse(lowerLimitController.text);

                      Bisection bisection = Bisection(
                          upperLimit: upperLimit,
                          lowerLimit: lowerLimit,
                          expression: equation);
                      this.root=bisection.getFunctionRoot();
                      this.iterations=bisection.getIterationCount();


                    } else if (Secant.title == methodScreenName) {
                      this. upperLimit = double.parse(upperLimitController.text);
                      this. lowerLimit = double.parse(lowerLimitController.text);

                      Secant secant =  Secant(
                          upperLimit: upperLimit, lowerLimit: lowerLimit, expression: equation);
                      this.root=secant.getFunctionRoot();
                      this.iterations=secant.getIterationCount();




                    } else if (FalsePosition.title == methodScreenName) {
                      this. upperLimit = double.parse(upperLimitController.text);
                      this. lowerLimit = double.parse(lowerLimitController.text);


                      FalsePosition falsePosition = new FalsePosition(
                          upperLimit: upperLimit, lowerLimit:lowerLimit, expression: equation);

                      this.root=falsePosition.getFunctionRoot();
                      this.iterations=falsePosition.getIterationCount();




                    } else if (NewtonRaphson.title == methodScreenName) {

                      this.initialRoot=int.parse(initialRootController.text);
                      NewtonRaphson newtonRaphson = new NewtonRaphson(
                          expression: equation, initialRoot:initialRoot );

                      this.root=newtonRaphson.getFunctionRoot();
                      this.iterations=newtonRaphson.getIterationCount();

                    }else if(methodScreenName==FixedPoint.title){

                      this.desiredDecimal=int.parse(desiredDecimalController.text);

                      FixedPoint fixedPoint = FixedPoint(decimalPlaces: desiredDecimal, expression: gOfXController.text,initialExpression:eqnController.text);
                      print('entering class');
                      this.root=fixedPoint.getFunctionRoot();



                      this.iterations=fixedPoint.getIterationCount();







                    }

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OutputScreen(
                                rootData: {
                                  'root': root,
                                  'methodName': methodScreenName,
                                  'iterations':iterations.toString()
                                },
                              )),
                    );

                    // calculate the root , goto output screen and pass the data
                  },
                  child: Text(
                    "Find The Root",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3,
                        color: Colors.white),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xFF0e0e29),
                    padding: EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
