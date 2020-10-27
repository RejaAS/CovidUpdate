import 'package:intl/intl.dart';

import 'size_config.dart';
import 'package:flutter/material.dart';

class Nyoba extends StatefulWidget {
  NyobaState createState() => NyobaState();
}

class NyobaState extends State<Nyoba> {
  DateTime now = new DateTime.now();

  Widget build(context) {
    return Stack(
      children: [
        Image.asset(
          "images/background.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.fill,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: <Widget>[
              Container(
                height: 230,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: Row(
                              children: [
                                Text(
                                  "23",
                                  style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Oktober 2020",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      Text(
                                        "Jumat",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                child: CircleAvatar(
                                  radius: 45,
                                  child: ClipOval(
                                    child: Image.asset('images/prnoia.jpg'),
                                  ),
                                ),
                              ),
                              // Container(
                              //     width: 70.0,
                              //     height: 70.0,
                              //     decoration: new BoxDecoration(
                              //       color: Colors.white,
                              //       shape: BoxShape.circle,
                              //     ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text("Billie Eyelash",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(now.day.toString() +
                            " " +
                            now.month.toString() +
                            " " +
                            now.year.toString()),
                        Text("sadasd"),
                        Text("sadasd"),
                        Text("sadasd"),
                        Text("sadasd"),
                        Text("sadasd"),
                        Text("sadasd"),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                height: 453,
                width: 500,
                decoration: BoxDecoration(
                    color: Color(0XFFf5f5f5),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20),
                    Text(
                      "Jadwal Hari ini",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: InkWell(
                        hoverColor: Colors.black,
                        child: Card(
                          elevation: 3,
                          child: Container(
                            width: SizeConfig.screenWidth,
                            height: 75,
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: [
                                      Image.asset(
                                        'images/OnBoard2.png',
                                        width: 50,
                                        height: 50,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "18.00 WIB",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "Obat putih 2 butir",
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 140),
                                        child: Column(
                                          children: [
                                            Icon(Icons.edit),
                                            Text(
                                              "Edit",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
