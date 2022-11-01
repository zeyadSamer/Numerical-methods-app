import 'package:flutter/material.dart';
import 'package:numerical_methods/Models/NumericalMethod.dart';
import 'dart:core';
class OutputScreen extends StatelessWidget {
  const OutputScreen({required this.rootData});

  final Map rootData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,


          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color:Color(0xFFE4d7FF),

                  ),
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: [
                      Text('Found The Root At:',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,


                      ),


                      ),
                      Text('X=${rootData['root'].toStringAsFixed(4)}',
                      style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold
                      ),

                      ),

                      CircleAvatar(
                        child:Text(rootData['iterations'],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 60,fontWeight: FontWeight.bold
                        ),),
                        radius: 90,
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,


                      ),
                      Text('Iterations',
                        style: TextStyle(
                            fontSize: 40
                        ),)

                      ,
                      Text(' With Approximate Error=${NumericalMethod.error}',
                        style: TextStyle(
                            fontSize: 20,fontWeight: FontWeight.bold
                        ),


                      ),
                      TextButton(onPressed: (){
                        Navigator.pop(context);
                      },

                      child:Text('Back to Method',
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,

                      ),)
                      )


                    ],
                  ),


                ),
              ),
            ),





          ],





        ),
      ),
    );
  }
}
