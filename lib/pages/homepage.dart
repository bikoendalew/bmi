
import 'package:bmi/pages/history.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bmi_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> page=[const BMI(),HistoryPage()];
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(

      navigationBar: const CupertinoNavigationBar(
        backgroundColor: Colors.white,
        middle: Text("BMI"),
      ),
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
items: const [
 BottomNavigationBarItem(icon: Icon(CupertinoIcons.home,),label:'IBM' ),
  BottomNavigationBarItem(icon: Icon(CupertinoIcons.home,),label:'History' )
],
        ),

tabBuilder: (context,index){
          return CupertinoTabView(
            builder: (context){
              return page[index];
            },
          );
},
      ),
    );
  }
}
