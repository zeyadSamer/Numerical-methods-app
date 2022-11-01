
import'package:flutter/material.dart';
class OpenMethodsForm extends StatelessWidget {
  final String hintMessage;
  final TextEditingController eqnController;
  final TextEditingController gOfXController;
  final TextEditingController controller;
  bool isFixedPoint;
  OpenMethodsForm({ this.isFixedPoint=false, required this.hintMessage,required this.eqnController,
    required this.controller,
    required this.gOfXController


  });

  Widget getInitialExpression(){


    return TextFormField(
      controller: eqnController,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.text,

      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        labelText:'Your Equation',
      ),

    );


  }


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(

          children: [
            SizedBox(height:10),

            Flexible(child: isFixedPoint?getInitialExpression():Text('')),
            SizedBox(height:20),

            Flexible(
              child: TextFormField(
                controller: isFixedPoint?gOfXController:eqnController,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.text,

                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  labelText:isFixedPoint? 'g(x)=':'Your Equation',
                ),

              ),
            ), SizedBox(height: 20, width: 10),

            Flexible(
              child: TextFormField(
                controller: controller,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,

                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  labelText: hintMessage,
                ),


              ),
            ), SizedBox(height: 20, width: 10),


          ]
      ),
    );
  }
}
