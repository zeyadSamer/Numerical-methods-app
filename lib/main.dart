import 'package:flutter/material.dart';
import './screens/HomeScreen.dart';
import './screens/InputScreen.dart';
void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    theme: Theme.of(context).copyWith(
      backgroundColor:Color(0xFFf6e3cd),

    ),
    debugShowCheckedModeBanner: false,



      routes: {

        '/':(context)=>HomeScreen(),

      },

    );
  }
}

