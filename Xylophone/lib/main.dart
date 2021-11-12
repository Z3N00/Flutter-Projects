
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Xylophone",
      theme: ThemeData(
        brightness: Brightness.dark
      ),
      home: const Keyboard(),
    );
  }
}


class Keyboard extends StatefulWidget {
  const Keyboard({Key? key}) : super(key: key);

  @override
  _KeyboardState createState() => _KeyboardState();
}

class _KeyboardState extends State<Keyboard> {


  void playSound(int number){
    final player = AudioCache();
    player.play('$number.wav');

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
          child: Column(
            children: <Widget>[
              const Text("Xylophone", style: TextStyle(fontSize: 30.0, fontFamily: 'Courier'),),
              const Padding(padding: EdgeInsets.only(bottom: 50.0)),
              MaterialButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                height: 70.0,
                minWidth: double.infinity,
                color: Colors.red,
                onPressed: ()=> {playSound(1)}
                ),
              const SizedBox(height: 10.0),
              MaterialButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                  height: 70.0,
                  minWidth: double.infinity,
                  color: Colors.green,
                  onPressed: ()=>{playSound(2)}
              ),
              const SizedBox(height: 10.0),
              MaterialButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                  height: 70.0,
                  minWidth: double.infinity,
                  color: Colors.blue,
                  onPressed: ()=>{playSound(3)}
              ),
              const SizedBox(height: 10.0),
              MaterialButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                  height: 70.0,
                  minWidth: double.infinity,
                  color: Colors.orange,
                  onPressed: ()=>{playSound(4)}
              ),
              const SizedBox(height: 10.0),
              MaterialButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                  height: 70.0,
                  minWidth: double.infinity,
                  color: Colors.white,
                  onPressed: ()=>{playSound(5)}
              ),
              const SizedBox(height: 10.0),
              MaterialButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                  height: 70.0,
                  minWidth: double.infinity,
                  color: Colors.pink,
                  onPressed: ()=>{playSound(6)}
              ),
              const SizedBox(height: 10.0),
              MaterialButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                  height: 70.0,
                  minWidth: double.infinity,
                  color: Colors.purple,
                  onPressed: ()=>{playSound(7)}
              ),
              const SizedBox(height: 10.0),
              MaterialButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                  height: 70.0,
                  minWidth: double.infinity,
                  color: Colors.tealAccent,
                  onPressed: ()=>{playSound(8)}
              )
            ],
          ),
        ),
      ),
    );
  }
}

