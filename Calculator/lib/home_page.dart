import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var num1, num2, ans = 0;
  TextEditingController t1 = TextEditingController(text: "");
  TextEditingController t2 = TextEditingController(text: "");

  void onPress(int id){
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      if(id == 0){
        ans = num1+num2;
      }else if(id == 1){
        ans = num1-num2;
      }else if(id == 2){
        ans = num1*num2;
      }else if(id == 3){
        ans = num1 ~/ num2;
      }

    });
  }

  void clear(){
    setState(() {
      t1.text = "";
      t2.text = "";
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
      ),
      body: Container(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[


            Text("Output : $ans",
            style: const TextStyle(fontSize: 20.0, color: Colors.purple, fontWeight: FontWeight.bold),
            ),

            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: "Enter Number 1"
              ),
              controller: t1,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  hintText: "Enter Number 2"
              ),
              controller: t2,
            ),
            // const Padding(padding: EdgeInsets.only(top: 20.0)),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                MaterialButton(
                  color: Colors.greenAccent,
                  onPressed: ()=>onPress(0),
                  child: const Text("+"),),
                MaterialButton(
                  color: Colors.greenAccent,
                  onPressed: ()=>onPress(1),
                  child: const Text("-"),),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                MaterialButton(
                  color: Colors.greenAccent,
                  onPressed: ()=>onPress(2),
                  child: const Text("*"),),
                MaterialButton(
                  color: Colors.greenAccent,
                  onPressed: ()=>onPress(3),
                  child: const Text("/"),),

              ],
            ),

            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MaterialButton(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    color: Colors.greenAccent,
                    child: const Text("Clear"),
                    onPressed: clear
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
