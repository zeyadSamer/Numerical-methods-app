import 'package:flutter/material.dart';
import 'package:numerical_methods/components/MethodCard.dart';
import '../Models/method-enum.dart';

class HomeScreen extends StatelessWidget {
  final List<Map> numericalMethodsList = [
    {
      'method_name': Methods.Bisection.name,
      //'url':'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfIYrtm_WEf-1Jt3NqVrkP3RdOmdX8QJ_S9A&usqp=CAU'

      'url': 'lib/images/bisection.jpg'
    },
    {
      'method_name': Methods.False_Position.name,
      //'url':'https://slideplayer.com/slide/14903729/91/images/3/False-Position+Method.jpg'
      'url': 'lib/images/False-PositionMethod.jpg'
    },
    {
      'method_name': Methods.Fixed_Point_iteration.name,

      //'url':'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKSi2ZUOTT1X5DKGoSmqF6w5dP_C9tYNZrUu_jodTLkqZ3WTh4XMUaYXF1o3jDbJSVkv8&usqp=CAU',
      'url': 'lib/images/fixed.jpeg'
    },
    {
      'method_name': Methods.Newton_Raphson.name,
      //     'url':'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSACzAEUURnF3iVetfh7IAO7rvB34P86JuNQQ&usqp=CAU',
      'url': 'lib/images/newton.png'
    },
    {
      'method_name': Methods.Secant.name,
      //'url':'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAyJ8C3hm6p7Xc5zFDv7-HZkDjYI7ogG0efQ&usqp=CAU'
      'url': 'lib/images/secant.jpeg'
    }
  ];

  List<MethodCard> getNumericalMethodCards() {
    return numericalMethodsList
        .map((method) => MethodCard(
            imageUrl: method['url'],
            methodName: method['method_name'].toString()))
        .toList();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //leading: Image.asset('zeyad.jpg'),

          toolbarHeight: 80,
          title: Text("Numerical Methods",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              )),
          backgroundColor: Colors.white,
          shadowColor: Colors.white10,
        ),
        body: Column(
          children: <Widget>[
            Row(children: <Widget>[
              Expanded(
                child: Container(
                  height: 130,
                  margin:
                      EdgeInsets.only(top: 30, bottom: 30, left: 10, right: 10),
                  child: Card(
                    color: Color(0xFF0e0e29),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        " Let's find the root  ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
            Row(
              children: [
                Expanded(child: Container()),
              ],
            ),
            Text('Choose A Method',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: ListView(
                children: getNumericalMethodCards(),
              ),
            )
          ],
        ));
  }
}
