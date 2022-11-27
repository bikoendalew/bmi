import 'package:bmi/pages/bmi_page.dart';
import 'package:bmi/pages/history.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmi/pages/homepage.dart';
//import 'pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title:"IBMI",
      routes: {
        '/':(BuildContext context)=>const HomePage(),
        'bmi':(BuildContext context)=>const BMI(),
        'history':(BuildContext context)=> HistoryPage(),
      },
      initialRoute: '/',
    );
  }
}

