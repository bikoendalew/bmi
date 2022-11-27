import 'dart:math';
import 'dart:developer' as developer;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bmi/widgets/card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'calculator.dart';

class BMI extends StatefulWidget {
  const BMI({Key? key}) : super(key: key);

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  double? h,w;
  int age =23;
int weight=45,height=56;
  int gender=0;
  @override
  Widget build(BuildContext context) {
    w=MediaQuery.of(context).size.width;
    h=MediaQuery.of(context).size.height;
    return  CupertinoPageScaffold(

          child: Center(
            child: Container(
         height: h!*0.85,
              child:Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,

                 children: [
                   ageSelector(),
                   weightSelector()
                 ],
                  ),
                  heightSelector(),
                  genderSelector(),
calculateButton()
                ],

              ),
            ),
          )
      );


  }
  Widget ageSelector(){
    return  InfoCard(
      height: h! * 0.20,
      width: w! * 0.45,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Age yr',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            age.toString(),
            style: const TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.w700,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 50,
                child: CupertinoDialogAction(
                  key: const Key('age_minus'),
                  onPressed: () {
                    setState(() {
                      age--;
                    });
                  },
                  textStyle: const TextStyle(
                    fontSize: 25,
                    color: Colors.red,
                  ),
                  child: const Text('-'),
                ),
              ),
              SizedBox(
                width: 50,
                child: CupertinoDialogAction(
                  key: const Key('age_plus'),
                  onPressed: () {
                    setState(
                          () {
                        age++;
                      },
                    );
                  },
                  textStyle: const TextStyle(
                    fontSize: 25,
                    color: Colors.blue,
                  ),
                  child: const Text('+'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
  Widget weightSelector() {
    return InfoCard(
      height: h! * 0.20,
      width: w! * 0.45,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Weight lbs',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            weight.toString(),
            style: const TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.w700,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 50,
                child: CupertinoDialogAction(
                  key: const Key('weight_minus'),
                  onPressed: () {
                    setState(() {
                      weight--;
                    });
                  },
                  textStyle: const TextStyle(
                    fontSize: 25,
                    color: Colors.red,
                  ),
                  child: const Text('-'),
                ),
              ),
              SizedBox(
                width: 50,
                child: CupertinoDialogAction(
                  key: const Key('Weight_plus'),
                  onPressed: () {
                    setState(
                          () {
                        weight++;
                      },
                    );
                  },
                  textStyle: const TextStyle(
                    fontSize: 25,
                    color: Colors.blue,
                  ),
                  child: const Text('+'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
  Widget heightSelector(){
    return InfoCard(
        height: h!*0.15,
        width: w!*0.90,
        child: Column(
children: [
 const Text('Height in',style: TextStyle(
fontSize: 15,fontWeight: FontWeight.w400
  ),),
  Text(height.toString(),
    style: const TextStyle(
      fontSize: 45,fontWeight: FontWeight.w700
  ),),
        SizedBox(
          width: w!*0.80,
          child: CupertinoSlider(
            divisions: 90,
            min:0,
            max:90,
            value: height.toDouble(),
            onChanged: (value){
              setState((){
                height=value.toInt();
              });
            },
          ),
        )
]

        ));
  }
  Widget genderSelector(){
  return InfoCard(height: h!*0.11,width: w!*0.90,child: Column(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const Text('Gender',style: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 15
      ),),
      CupertinoSlidingSegmentedControl(
        groupValue: gender,
          children: const {
            0:Text("Male"),
            1:Text("Female")
          },
          onValueChanged: (value){
            setState((){
              gender=value as int;
            });
          }
      )
    ],
  ),);
  }
  Widget calculateButton(){
    return Container(
      height: h!*0.07,
      child: CupertinoButton.filled(
       onPressed: (){
         if(height>0&&weight>0&&age>0){
           double bmi = calculateBMI(height, weight);
           _showResultDialog(bmi);
         }
       },
        child:const Text('Calculate BMI')
      ),
    );
  }
  void _showResultDialog(double _bmi) {
    String? _status;
    if (_bmi < 18.5) {
      _status = "Underweight";
    } else if (_bmi >= 18.5 && _bmi < 25) {
      _status = "Normal";
    } else if (_bmi >= 25 && _bmi < 30) {
      _status = "Overweight";
    } else if (_bmi >= 30) {
      _status = "Obese";
    }
    showCupertinoDialog(
      context: context,
      builder: (BuildContext _context) {
        return CupertinoAlertDialog(
          title: Text(_status!),
          content: Text(
            _bmi.toStringAsFixed(2),
          ),
          actions: [
            CupertinoDialogAction(
              child: const Text('Ok'),
              onPressed: () {
                _saveResult(_bmi.toString(), _status!);
                Navigator.pop(_context);
              },
            ),
          ],
        );
      },
    );
  }
  void _saveResult(String _bmi, String _status) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      'bmi_date',
      DateTime.now().toString(),
    );
    await prefs.setStringList(
      'bmi_data',
      <String>[
        _bmi,
        _status,
      ],
    );
    developer.log("\x1B[32mBMI Result Saved!\x1B[0m");
  }
}
