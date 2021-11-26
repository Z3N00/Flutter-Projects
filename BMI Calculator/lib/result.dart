import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/main.dart';

String resultText = "Normal";
double resultNumber = 20.5;
String resultDescription = "You have a normal body weight";



const activeColor = Color(0xFF00838F);
const inactiveColor = Color(0xFF616161);

const labelTextStyle = TextStyle(
  fontSize: 18.0,
  color: Colors.white,
  fontWeight: FontWeight.bold,
);

const textHeight = TextStyle(
  fontSize: 18.0,
);

const numberHeight = TextStyle(
  fontSize: 45.0,
  fontWeight: FontWeight.bold,
);

const btnHeight = TextStyle(
  fontSize: 30.0,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

class result extends StatefulWidget {
  const result({Key? key}) : super(key: key);

  @override
  _resultState createState() => _resultState();
}

class _resultState extends State<result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "BMI Calculator",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF00838F),
          ),
        ),
      ),
      body: Column(

        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.all(15),
              color: inactiveColor,
              child: Column(
                children: [
                  Text(resultText),
                  Text(
                    resultNumber.toString(),
                  ),
                  Text(resultDescription),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
