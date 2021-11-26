import 'package:flutter/material.dart';


void main(){
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: const Sliderpage(),
    );
  }
}

class Sliderpage extends StatefulWidget {
  const Sliderpage({Key? key}) : super(key: key);

  @override
  _SliderpageState createState() => _SliderpageState();
}

class _SliderpageState extends State<Sliderpage> {

  int value = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SliderApp"),
        centerTitle: true,
      ),
      drawer: Drawer(
        elevation: 10.0,
        child: ListView(
          children: <Widget>[

          ],
        ),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 100.0, left: 20.0, right: 20.0, bottom: 20.0),
                color: Colors.black12,
                child: Column(
                  children: <Widget>[
                    Slider(
                        value: value.toDouble(),
                        min: 0,
                        max: 100,
                        divisions: 5,
                        activeColor: Colors.green,
                        inactiveColor: Colors.green,
                        label: value.toString(),
                        onChanged: (double newValue){
                          setState(() {
                            value = newValue.toInt();
                          });
                        },),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Slider(
                      value: value.toDouble(),
                      min: 0,
                      max: 100,
                      divisions: 5,
                      activeColor: Colors.red,
                      inactiveColor: Colors.red,
                      label: value.toString(),
                      onChanged: (double newValue){
                        setState(() {
                          value = newValue.toInt();
                        });
                      },),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Slider(
                      value: value.toDouble(),
                      min: 0,
                      max: 100,
                      divisions: 5,
                      activeColor: Colors.blue,
                      inactiveColor: Colors.blue,
                      label: value.toString(),
                      onChanged: (double newValue){
                        setState(() {
                          value = newValue.toInt();
                        });
                      },),
                  ],
                ),
              )
            ],
          ),
        ),

      ),
    );
  }
}
