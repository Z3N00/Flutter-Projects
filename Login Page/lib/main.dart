import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LoginPage(),
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
    );
  }
}


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin{
  late AnimationController _iconAnimationController;
  late Animation<double> _iconAnimation;

  @override
  void initState(){
    super.initState();
    _iconAnimationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 500)
    );
    _iconAnimation = CurvedAnimation(
        parent: _iconAnimationController,
        curve: Curves.easeOut
    );
    _iconAnimation.addListener(() => setState((){}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          const Image(
            image: AssetImage("assets/img.jpg"),
            fit: BoxFit.cover,
            color: Colors.black87,
            colorBlendMode: BlendMode.darken,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  <Widget>[
              FlutterLogo(
                size: _iconAnimation.value * 100,
              ),
              Form(
                  child: Theme(
                    data: ThemeData(
                      brightness: Brightness.dark,
                      primarySwatch: Colors.blue,
                      inputDecorationTheme: const InputDecorationTheme(
                        labelStyle: TextStyle(
                          color: Colors.blue,
                          fontSize: 20.0
                        )
                      )
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(40.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          TextFormField(
                            decoration: const InputDecoration(
                            labelText: "Enter Email",
                              ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          TextFormField(
                              decoration: const InputDecoration(
                              labelText: "Enter Password",
                            ),
                            keyboardType: TextInputType.text,
                            obscureText: true,
                          ),
                          const Padding(
                              padding: EdgeInsets.only(top: 40.0)),
                          MaterialButton(
                            height: 40.0,
                            minWidth: 100.0,
                            color: Colors.blue,
                            textColor: Colors.white,
                            child: const Text("Login"),
                            onPressed: ()=>{
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Work In Progress!!")))
                            },
                            splashColor: Colors.blueAccent,
                          )
                        ]
                      ),
                    ),
                  )
                )
              ],
            ),
          ],
        ),
      );
    }
  }

