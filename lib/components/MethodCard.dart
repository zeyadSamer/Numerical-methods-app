

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numerical_methods/Models/Bisection.dart';
import 'package:numerical_methods/Models/False-position.dart';
import 'package:numerical_methods/Models/NewtonRaphson.dart';
import 'package:numerical_methods/Models/Secant.dart';
import '../screens/InputScreen.dart';
class MethodCard extends StatelessWidget {
  final String imageUrl;
  final String  methodName;
  const MethodCard({required this.imageUrl, required this.methodName});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(methodName,
        style: TextStyle(
          fontSize: 20
        )

          ,),
        GestureDetector(
          onTap: (){

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => InputScreen(methodScreenName: methodName,)),
            );

            print("pressed");

            if(Bisection.title==methodName){

              Bisection bisection= Bisection(upperLimit: 2, lowerLimit: -2, expression: "(2*x)+2");
                  print(bisection.getFunctionRoot().toString());

            }else if (Secant.title==methodName){

              Secant secant=new Secant(upperLimit: 2, lowerLimit: -2, expression: "2*x +2");
                  print(secant.getFunctionRoot().toString());

            }else if(FalsePosition.title==methodName){

              FalsePosition falsePosition=new FalsePosition(upperLimit: 2, lowerLimit:-2, expression: "2*x +2");
              print(falsePosition.getFunctionRoot().toString());

            }else if(NewtonRaphson.title==methodName){

              NewtonRaphson newtonRaphson= new NewtonRaphson(expression: "2*x +2", initialRoot: 0);
              print(newtonRaphson.getFunctionRoot().toString());

            }




    },
          child: Card(
            child:Image(image: AssetImage(imageUrl),width: 250,)
          ),
        ),
        SizedBox(height: 30,)
      ],
    );

  }
}
