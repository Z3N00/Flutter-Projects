import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Basic App",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.black,
        brightness: Brightness.dark
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}




class _MainPageState extends State<MainPage> {
  String myText = "Hello World";

  void onClick(){
    setState(() {
      if(myText.startsWith('H')){
        myText = "Welcome to Flutter";
      }else if(myText.startsWith("W")){
        myText = "Hello World";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(myText, style: const TextStyle(fontSize: 24.0),),
            const Padding(
                padding: EdgeInsets.only(top: 40.0)),
            MaterialButton(
              color: Colors.green,
              height: 40.0,
              minWidth: 100.0,
              child: const Text("Click Me", style: TextStyle(color: Colors.white),),
              onPressed: onClick,
            )
          ],
        ),
      ),
    );
  }
}
