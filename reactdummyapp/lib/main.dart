import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var increment = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: _getAppBar(),
      bottomSheet: _getBottomSheet(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/background.jpeg'), fit: BoxFit.fill)),
        child: Column(
          children: [
            const Expanded(
              child: SizedBox(),
              flex: 3,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xfff2E7FF),
                    borderRadius: BorderRadius.circular(35.0)),
                child: _getDetailsWidget(),
              ),
              flex: 6,
            )
          ],
        ),
      ),
    );
  }

  Widget _getBottomSheet() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      height: 90.0,
      decoration: BoxDecoration(
          color: const Color(0xff2e0174), borderRadius: BorderRadius.circular(35.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            '\$450',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Container(
            width: 100,
            height: 35,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: const Center(
              child: Text(
                'Book a Tour',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff2e0174),
                    fontSize: 15),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _getDetailsWidget() {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'McWay Falls, United States',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21.0),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/star.png',
                          height: 28,
                        ),
                        const Text(
                          '5.0',
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/clock.png',
                          height: 28,
                        ),
                        const Text(
                          '7 Hours',
                          style: TextStyle(fontSize: 15),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/flight.png',
                          height: 28,
                        ),
                        const Text(
                          '200 km',
                          style: TextStyle(fontSize: 15),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Container(
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xffd0a6ff)),
                          borderRadius: BorderRadius.circular(30.0),
                          color: const Color(0xffd0a6ff)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap : (){
                              if(increment > 1) {
                                setState(() {
                                  increment--;
                                });
                              }
                            },
                            child: Container(
                              width: 20,
                              height: 30,
                              decoration: BoxDecoration(
                                border: Border.all(color: const Color(0xffb795df)),
                                borderRadius: BorderRadius.circular(5.0),
                                color: const Color(0xffb795df),
                              ),
                              child: const Icon(
                                Icons.remove,
                                size: 15,
                              ),
                            ),
                          ),
                          Text('$increment'),
                          InkWell(
                            onTap : (){
                              setState(() {
                                increment++;
                              });
                            },
                            child: Container(
                              width: 20,
                              height: 30,
                              decoration: BoxDecoration(
                                border: Border.all(color: const Color(0xffb795df)),
                                borderRadius: BorderRadius.circular(5.0),
                                color: const Color(0xffb795df),
                              ),
                              child: const Icon(
                                Icons.add,
                                size: 15,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/clock.png',
                          height: 28,
                        ),
                        Text(
                          '$increment Days',
                          style: const TextStyle(fontSize: 15.0),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          flex: 2,
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(35.0)),
            child: _getDescriptionWidget(),
          ),
          flex: 3,
        )
      ],
    );
  }

  Widget _getDescriptionWidget() {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Text(
                'Descriptions',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0,
                    color: Color(0xff5a106a)),
              ),
              Text(
                'Facility',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0,
                    color: Color(0xff807c7d)),
              )
            ],
          ),
        ),
        const Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'McWay Falls is an 80-foot-tall waterfall on the coast of Big Sur in central California that flows year-round from McWay Creek in Julia Pfeiffer Burns State Park, about 37 miles south of Carmel,into the Pacific Ocean.',
                style: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.bold,
                    height: 1.8,
                    fontSize: 15.0),
              ),
            ))
      ],
    );
  }

  Widget _getAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(80.0),
      child: SafeArea(
        child: Container(
          color: const Color(0xFF6300EF),
          child: ListTile(
            title: const Text(
              'Valkyrie Sky',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            subtitle: const Text(
              'The journey of a lifetime',
              style: TextStyle(color: Color(0xff945BF5)),
            ),
            trailing: Container(
              width: 70.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.more_horiz,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
