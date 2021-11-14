import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const labelTextStyle = TextStyle(
  fontSize: 18.0,
  color: Colors.white,
);
const labelHeight = TextStyle(
  fontSize: 30.0,
  color: Colors.white,
  fontWeight: FontWeight.bold,
);
int _height = 180;
int _weight = 75;
int _age = 23;

const activeColor = Colors.red;
const inactiveColor = Color(0xFF616161);
Color maleCardColor = inactiveColor;
Color femaleCardColor = inactiveColor;

void main() {
  runApp(const MyApp());
}



class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {



  void cardChangeColor(int genderType){
        setState(() {
          if(genderType == 1){
            if(maleCardColor == inactiveColor){
              maleCardColor = activeColor;
              femaleCardColor = inactiveColor;
            }else{
              maleCardColor = inactiveColor;
            }
          }
          if(genderType == 2){
            if(femaleCardColor == inactiveColor){
              femaleCardColor = activeColor;
              maleCardColor = inactiveColor;
            }else {
              femaleCardColor = inactiveColor;
            }
          }
        });

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "BMI Calculator",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(

              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                          print("male is pressed");
                          cardChangeColor(1);

                      },
                      child: reusableContainer(
                        cardChild: iconwidget(
                          reusableIcon: FontAwesomeIcons.mars,
                          iconlabel: 'Male',
                        ),
                        backGroundColor: maleCardColor,
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                          print("Female is pressed");
                          cardChangeColor(2);

                      },
                      child: reusableContainer(
                        backGroundColor: femaleCardColor,
                        cardChild: iconwidget(
                          reusableIcon: FontAwesomeIcons.venus,
                          iconlabel: 'Female',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(

                children: [
                  Expanded(
                    child: reusableContainer(
                      backGroundColor: inactiveColor,
                      cardChild: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Height",
                                style: labelTextStyle,
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                _height.toString(),
                                style: labelHeight,
                              ),

                              Slider(
                                value: _height.toDouble(),
                                min: 120.0,
                                max: 220.0,
                                activeColor: Colors.red,
                                inactiveColor: const Color(0xFF8D8E98),
                                label: _height.round().toString(),
                                onChanged: (value) {
                                  setState(() {
                                    _height = value.round();
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(

                child: Row(
                  children: [
                    Expanded(
                      child: reusableContainer(

                        backGroundColor: inactiveColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              "Weight",
                              style: labelTextStyle,
                            ),
                            Text(
                              _weight.toString(),
                              style: labelHeight,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                    onPressed: (){
                                      setState(() {
                                        _weight --;
                                      });

                                    },
                                    icon: const Icon(
                                      FontAwesomeIcons.minus,
                                      size: 30,
                                      color: Colors.white,
                                    )),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                IconButton(
                                    onPressed: (){
                                      setState(() {
                                        _weight++;
                                      });
                                    },
                                    icon: const Icon(
                                      FontAwesomeIcons.plus,
                                      size: 30,
                                      color: Colors.white,
                                    ))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: reusableContainer(
                        backGroundColor: inactiveColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text("Age", style: labelTextStyle),
                            Text(
                                _age.toString(),
                                style: labelHeight),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget> [
                                IconButton(
                                    onPressed: (){
                                      setState(() {
                                        _age--;
                                      });

                                    },
                                    icon: const Icon(
                                      FontAwesomeIcons.minus,
                                      size: 30,
                                      color: Colors.white,
                                    )),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                IconButton(
                                    onPressed: (){
                                      setState(() {
                                        _age++;
                                      });

                                    },
                                    icon: const Icon(
                                      FontAwesomeIcons.plus,
                                      size: 30,
                                      color: Colors.white,
                                    ))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              color: Colors.red,
              height: 80.0,
              width: double.infinity,
              child: const Center(
                child: Text("Calculate", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class iconwidget extends StatelessWidget {
  iconwidget({required this.reusableIcon, required this.iconlabel});

  final IconData reusableIcon;
  final String iconlabel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(reusableIcon, size: 80.0),
        const SizedBox(
          height: 15.0,
        ),
        Text(iconlabel, style: labelTextStyle),
      ],
    );
  }
}

class reusableContainer extends StatelessWidget {
  reusableContainer({required this.backGroundColor, required this.cardChild});

  final Color backGroundColor;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      color: backGroundColor,
      child: cardChild,
    );
  }
}