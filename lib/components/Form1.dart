import 'package:flutter/material.dart';

class BracketingForm extends StatelessWidget {

  BracketingForm({required this.eqnController,required this.upperLimitController,required this.lowerLimitController});

  final TextEditingController eqnController;


  // TextEditingController eqnController=TextEditingController();
  // TextEditingController upperLimitController=TextEditingController();
  // TextEditingController loweLimitController=TextEditingController();
  String eqn="";
  late int upperLimit;
  late int lowerLimit;
  final TextEditingController upperLimitController;
  final TextEditingController lowerLimitController;


  @override
  Widget build(BuildContext context) {
   return Expanded(
      child: Column(

          children: [


            Flexible(

              child:  TextFormField(
                controller: eqnController,
                textAlign: TextAlign.center,

                keyboardType: TextInputType.text,

                decoration:  InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius:BorderRadius.circular(40),
                  ),
                  labelText: 'Your Equation',
                ),

              ),
            ),SizedBox(height: 15,width:10),

            Flexible(

              child: TextFormField(
                controller: upperLimitController,


                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,

                decoration:  InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius:BorderRadius.circular(40),
                  ),
                  labelText: 'Your Upper Limit',
                ),


              ),
            ),   SizedBox(height: 15,width:10),
            Flexible(
              child:  TextFormField(
                controller: lowerLimitController,

                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,

                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius:BorderRadius.circular(40),
                  ),

                  labelText: 'Your Lower Limit',
                ),
              ),
            ),



          ]
      ),
    );


  }
}
