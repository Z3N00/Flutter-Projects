import 'dart:math';

import 'package:flutter/material.dart';


void main(){
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey
      ),
      home: LoginPage(),
    );
  }
}


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late  bool _isHidden = true;
  int _value = 10;
  Color buttonColor = Colors.blueGrey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     //resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("LogIn Page"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Container(

          margin: const EdgeInsets.only(top: 100.0, left: 20.0, right: 20.0, bottom: 20.0),
          child: Column(
           // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:   <Widget>[
              const CircleAvatar(
                radius: 100.0,
                backgroundImage: AssetImage("assets/profile.jpg"),
                ),

              Container(
                margin: const EdgeInsets.all(40.0),

                child: Column(
                  children: [
                    TextFormField(

                    decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueGrey,
                        width: 5.0,

                      )
                    ),
                      labelText: "Email",
                      prefixIcon: Icon(Icons.mail)
                    ),
                    keyboardType: TextInputType.emailAddress,

                  ),
                   const SizedBox(
                      height: 20.0,
                    ),

                    TextFormField(

                      decoration:  InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(23.0),
                          borderSide: const BorderSide(
                            color: Colors.blueGrey,
                            width: 5.0
                          )
                        ),
                        labelText: "Password",
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: _isHidden ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
                          onPressed: () {
                            setState(() {
                              _isHidden = !_isHidden;
                            });
                        },
                        )
                      ),
                      keyboardType: TextInputType.text,
                      obscureText: _isHidden,
                    )
                  ]
                ),
              ),
              MaterialButton(
                  child: Text("Click"),
                  color: buttonColor,
                  height: 40.0,
                  minWidth: 100.0,
                  textColor: Colors.white,
                  onPressed: (){}
                  ),
              const SizedBox(
                height: 20.0,
              ),

              Slider(
                  min: 0,
                  max: 100,
                  label: _value.toString(),
                  divisions: 100,
                  value: _value.toDouble(),
                  onChanged: (double Newvalue){
                    setState(() {
                      _value = Newvalue.round();
                      buttonColor = Colors.primaries[Random().nextInt(Colors.primaries.length)];

                    });
                  },

                  )

            ],
          ),

        ),
      ),
    );
  }
}
