import 'package:flutter/material.dart';



Color backgroundColor = Colors.white;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),

      home: MainScreen(),
    );
  }
}


class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int location = 60;

  var placeName = "Mountains";
  var mountainImage1 = "https://images.pexels.com/photos/417173/pexels-photo-417173.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  var mountainImage2 = "https://images.pexels.com/photos/2835436/pexels-photo-2835436.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";

  var forestImage1 = "https://images.pexels.com/photos/707915/pexels-photo-707915.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  var forestImage2 = "https://images.pexels.com/photos/1164857/pexels-photo-1164857.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";

  var beachImage1 = "https://images.pexels.com/photos/3293148/pexels-photo-3293148.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  var beachImage2 = "https://images.pexels.com/photos/3185490/pexels-photo-3185490.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";

  var islandImage1 = "https://images.pexels.com/photos/3293148/pexels-photo-3293148.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  var islandImage2 = "https://images.pexels.com/photos/8438123/pexels-photo-8438123.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";

  var cityImage1 = "https://images.pexels.com/photos/3075993/pexels-photo-3075993.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  var cityImage2 = "https://images.pexels.com/photos/2246476/pexels-photo-2246476.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";

  var imageUrl1 = "https://images.pexels.com/photos/417173/pexels-photo-417173.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  var imageUrl2 = "https://images.pexels.com/photos/2835436/pexels-photo-2835436.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(
        "Beautiful Places",
        textAlign: TextAlign.center,
      ),
        centerTitle: true,
        elevation: 10.0,
      ),

      body: Container(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: double.infinity,

              child: reusableContainer(
                  backGroundColor: backgroundColor,
                  cardChild: Text(placeName,
                      style: const TextStyle(
                      fontSize: 40.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,

                  )
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            reusableContainer(
              backGroundColor: backgroundColor,
              cardChild: Slider(
                value: location.toDouble(),
                onChanged: (double changeLocation) {
                  setState(() {
                    location = changeLocation.round();
                    if(location == 20){
                      placeName = "Forest";
                      imageUrl1 = forestImage1;
                      imageUrl2 = forestImage2;
                    }else if(location == 40){
                      placeName = "Beach";
                      imageUrl1 = beachImage1;
                      imageUrl2 = beachImage2;

                    }else if(location == 60){
                      placeName = "Mountains";
                      imageUrl1 = mountainImage1;
                      imageUrl2 = mountainImage2;
                    }
                    else if(location == 80){
                      placeName = "Island";
                      imageUrl1 = islandImage1;
                      imageUrl2 = islandImage2;

                    }else if(location == 100){
                      placeName = "City";
                      imageUrl1 = cityImage1;
                      imageUrl2 = cityImage2;
                    }
                  });
                },
                min: 0,
                max: 100,
                divisions: 5,
                activeColor: Colors.black,
                inactiveColor: Colors.greenAccent,
                label: placeName,
              ),
            ),
            reusableContainer(
                backGroundColor: backgroundColor,
                cardChild: Container(
                  margin: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                          child: Image.network(imageUrl1)
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      Expanded(
                          child: Image.network(imageUrl2)
                      )
                    ],
                  ),
                )
            )
          ],
        ),
      ),
    );
  }

}


class reusableContainer extends StatelessWidget {
  const reusableContainer(
      {required this.backGroundColor, required this.cardChild});

  final Color backGroundColor;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: backGroundColor,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: cardChild,
    );
  }
}