import 'package:flutter/material.dart';
import 'dart:convert';


void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List info = [];

  _initData() {
    DefaultAssetBundle.of(context)
        .loadString("json/data.json")
        .then((value) => {info = json.decode(value)});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.only(top: 70, left: 20, right: 15),
            child: Column(
              children: [
                Row(children: [
                  Text(
                    'Training',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                  ),
                  Expanded(child: Container()),
                  Icon(
                    Icons.arrow_back_ios,
                    size: 17,
                  ),
                  SizedBox(width: 5),
                  Icon(
                    Icons.calendar_today_outlined,
                    size: 17,
                  ),
                  SizedBox(width: 6),
                  Icon(Icons.arrow_forward_ios, size: 17),
                ]),
                SizedBox(height: 40),
                Row(
                  children: [
                    Text(
                      'Your program',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    Expanded(child: Container()),
                    Text(
                      'Details',
                      style: TextStyle(color: Colors.blue),
                    ),
                    Icon(Icons.arrow_forward, size: 17)
                  ],
                ),
                SizedBox(height: 40),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 220,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(80),
                          bottomLeft: Radius.circular(10),
                          topLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      gradient: LinearGradient(colors: [
                        Color.fromRGBO(56, 69, 189, 1),
                        Color.fromRGBO(96, 117, 222, 0.7)
                      ], begin: Alignment.bottomLeft)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Next workout',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      SizedBox(height: 10),
                      Text('Legs Toning',
                          style: TextStyle(color: Colors.white, fontSize: 25)),
                      Text('and Glutes Workout',
                          style: TextStyle(color: Colors.white, fontSize: 25)),
                      SizedBox(height: 30),
                      Row(
                        children: [
                          Icon(
                            Icons.timer,
                            color: Colors.white,
                          ),
                          Text(
                            '60 mins',
                            style: TextStyle(color: Colors.white),
                          ),
                          Expanded(child: Container()),
                          Icon(
                            Icons.play_circle,
                            color: Colors.white,
                            size: 60,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  // color: Colors.red,
                  width: MediaQuery.of(context).size.width,
                  // height: 100,
                  child: Stack(children: [
                    Container(
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromRGBO(96, 117, 222, 0.4),
                      ),
                      margin: EdgeInsets.only(top: 30),
                    ),
                    Container(
                        height: 150,
                        // color: Colors.red.withOpacity(0.5),
                        width: 350,
                        margin: EdgeInsets.only(right: 200),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/running_girl.png'),
                                fit: BoxFit.fill))),
                    Container(
                        // color: Colors.red,
                        margin: EdgeInsets.only(top: 50, left: 180),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'You are doing great !',
                                style: TextStyle(
                                    color: Color.fromRGBO(56, 69, 189, 1),
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'keep it up',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                              Text(
                                'stick to your plan',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              )
                            ])),
                  ]),
                ),
                SizedBox(height: 25),
                Row(
                  children: [
                    Text(
                      'Area of Focus',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    )
                  ],
                ),
                Expanded(
                  child:ListView.builder(
                      itemCount: (info.length.toDouble() / 2).toInt(),
                      itemBuilder: (_, i) {
                        var a = 2 * i;
                        var b = 2 * i + 1;
                        return Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.only(
                                  left: 20, right: 20, bottom: 20),
                              width:
                                  (MediaQuery.of(context).size.width - 90) / 2,
                              height: 150,
                              child: Center(
                                  child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Text(
                                        info[a]["title"],
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14),
                                      ))),
                              decoration: BoxDecoration(
                                  // border: Border.all(width: 3),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: const Offset(
                                        5.0,
                                        5.0,
                                      ),
                                      blurRadius: 10.0,
                                      spreadRadius: 2.0,
                                    ), //BoxShadow
                                    BoxShadow(
                                      color: Colors.white,
                                      offset: const Offset(0.0, 0.0),
                                      blurRadius: 0.0,
                                      spreadRadius: 0.0,
                                    ),
                                  ],
                                  image: DecorationImage(
                                    image: AssetImage(info[a]["image"]),
                                  )),
                            ),
                            Container(
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.only(bottom: 20),
                                width:
                                    (MediaQuery.of(context).size.width - 90) /
                                        2,
                                height: 150,
                                child: Center(
                                    child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Text(info[b]["title"],
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14)))),
                                decoration: BoxDecoration(
                                    // border: Border.all(width: 3),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey,
                                        offset: const Offset(
                                          5.0,
                                          5.0,
                                        ),
                                        blurRadius: 10.0,
                                        spreadRadius: 2.0,
                                      ), //BoxShadow
                                      BoxShadow(
                                        color: Colors.white,
                                        offset: const Offset(0.0, 0.0),
                                        blurRadius: 0.0,
                                        spreadRadius: 0.0,
                                      ),
                                    ],
                                    image: DecorationImage(
                                      image: AssetImage(info[b]["image"]),
                                    )))
                          ],
                        );
                      }),
                )
              ],
            )));
  }
}
