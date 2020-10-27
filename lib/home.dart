import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'size_config.dart';

class CovidData extends StatefulWidget {
  CovidDataState createState() => CovidDataState();
}

class CovidDataState extends State<CovidData> {
  final String url = 'https://api.kawalcorona.com/indonesia/';
  List data;

  Future<String> getData() async {
    var res = await http
        .get(Uri.encodeFull(url), headers: {'accept': 'application/json'});
    setState(() {
      data = json.decode(res.body);
    });
    checkData(data);
    return 'success!';
  }

  Widget build(context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Container(
                height: SizeConfig.screenHeight * 1,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [
                      0.3,
                      0.2
                    ],
                        colors: [
                      Color(0xFFdfedf7),
                      Color(0xFF328bea),
                    ])),
                child: Column(children: <Widget>[
                  Container(
                      height: SizeConfig.screenHeight * 0.1,
                      width: SizeConfig.screenWidth * 1,
                      margin: EdgeInsets.only(left: 25, top: 35, right: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Coronavirus Update",
                            style: TextStyle(
                                fontSize: SizeConfig.screenWidth * 0.06,
                                fontWeight: FontWeight.bold),
                          ),
                          Image.asset(
                            'images/covid-19.png',
                            height: SizeConfig.screenHeight * 0.1,
                            width: SizeConfig.screenWidth * 0.2,
                          ),
                        ],
                      )),
                  Container(
                    width: SizeConfig.screenWidth * 1,
                    height: SizeConfig.screenHeight * 0.31,
                    margin: EdgeInsets.only(left: 25, top: 15, right: 25),
                    child: Card(
                      color: Colors.white,
                      elevation: 10,
                      child: Container(
                          margin: EdgeInsets.all(10),
                          child: Column(children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      Image.asset('images/indonesia.png',
                                          height: SizeConfig.screenHeight * 0.1,
                                          width: SizeConfig.screenWidth * 0.15),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Text(
                                          "Indonesia",
                                          style: TextStyle(
                                              fontSize:
                                                  SizeConfig.screenWidth * 0.05,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 15),
                                  child: Column(
                                    children: [
                                      Text(
                                        "last Update",
                                        style: TextStyle(
                                            fontSize:
                                                SizeConfig.screenWidth * 0.03),
                                      ),
                                      Text("13/10/2020",
                                          style: TextStyle(
                                              fontSize: SizeConfig.screenWidth *
                                                  0.03))
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      margin: EdgeInsets.only(
                                          top: SizeConfig.screenHeight * 0.02),
                                      child: Row(
                                        children: <Widget>[
                                          Image.asset(
                                            'images/aktif.png',
                                            width: SizeConfig.screenWidth * 0.1,
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: SizeConfig.screenWidth *
                                                    0.025),
                                            child: Column(
                                              children: [
                                                Text(
                                                  'Kasus Positif',
                                                  style: TextStyle(
                                                      fontSize: SizeConfig
                                                              .screenWidth *
                                                          0.04),
                                                ),
                                                Text(
                                                  data == null
                                                      ? 'N/A'
                                                      : data[0]['positif'],
                                                  style: TextStyle(
                                                      fontSize: SizeConfig
                                                              .screenWidth *
                                                          0.04,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: SizeConfig.screenHeight * 0.02),
                                      child: Row(
                                        children: <Widget>[
                                          Image.asset(
                                            'images/dirawat.png',
                                            width: SizeConfig.screenWidth * 0.1,
                                          ),
                                          Column(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left:
                                                        SizeConfig.screenWidth *
                                                            0.02),
                                                child: Text(
                                                  'Pasien Dirawat',
                                                  style: TextStyle(
                                                      fontSize: SizeConfig
                                                              .screenWidth *
                                                          0.04),
                                                ),
                                              ),
                                              Text(
                                                data == null
                                                    ? 'N/A'
                                                    : data[0]['dirawat'],
                                                style: TextStyle(
                                                    fontSize:
                                                        SizeConfig.screenWidth *
                                                            0.04,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      margin: EdgeInsets.only(
                                          top: SizeConfig.screenHeight * 0.02),
                                      child: Row(
                                        children: <Widget>[
                                          Image.asset(
                                            'images/sembuh.png',
                                            width: SizeConfig.screenWidth * 0.1,
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: SizeConfig.screenWidth *
                                                    0.025),
                                            child: Column(
                                              children: [
                                                Text(
                                                  'Sembuh',
                                                  style: TextStyle(
                                                      fontSize: SizeConfig
                                                              .screenWidth *
                                                          0.04),
                                                ),
                                                Text(
                                                  data == null
                                                      ? 'N/A'
                                                      : data[0]['sembuh'],
                                                  style: TextStyle(
                                                      fontSize: SizeConfig
                                                              .screenWidth *
                                                          0.04,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: SizeConfig.screenHeight * 0.02),
                                      child: Row(
                                        children: <Widget>[
                                          Image.asset(
                                            'images/meninggal.png',
                                            width: SizeConfig.screenWidth * 0.1,
                                          ),
                                          Column(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left:
                                                        SizeConfig.screenWidth *
                                                            0.02),
                                                child: Text(
                                                  'Meninggal',
                                                  style: TextStyle(
                                                      fontSize: SizeConfig
                                                              .screenWidth *
                                                          0.04),
                                                ),
                                              ),
                                              Text(
                                                data == null
                                                    ? 'N/A'
                                                    : data[0]['meninggal'],
                                                style: TextStyle(
                                                    fontSize:
                                                        SizeConfig.screenWidth *
                                                            0.04,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ])),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Row(
                        children: [
                          Container(
                            height: SizeConfig.screenHeight * 0.132,
                            width: SizeConfig.screenWidth * 0.42,
                            margin: EdgeInsets.only(top: 15, left: 25),
                            child: Card(
                              color: Colors.white,
                              elevation: 10,
                              child: InkWell(
                                hoverColor: Colors.black,
                                onTap: () =>
                                    Navigator.pushNamed(context, '/provinsi'),
                                child: (Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: SizeConfig.screenHeight * 0.01),
                                      child: Image.asset(
                                        'images/pulau.png',
                                        width: SizeConfig.screenWidth * 1,
                                        height: SizeConfig.screenHeight * 0.05,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Text("Lihat Data Provinsi",
                                          style: TextStyle(
                                              fontSize:
                                                  SizeConfig.screenWidth * 0.04,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ],
                                )),
                              ),
                            ),
                          ),
                          Container(
                            height: SizeConfig.screenHeight * 0.132,
                            width: SizeConfig.screenWidth * 0.42,
                            margin: EdgeInsets.only(top: 15, left: 10),
                            child: Card(
                              color: Colors.white,
                              elevation: 10,
                              child: InkWell(
                                hoverColor: Colors.black,
                                onTap: () =>
                                    Navigator.pushNamed(context, '/obat'),
                                child: (Column(
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: SizeConfig.screenHeight * 0.013),
                                      child: Image.asset(
                                        'images/OnBoard2.png',
                                        width: SizeConfig.screenWidth * 1,
                                        height: SizeConfig.screenHeight * 0.05,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Text("Atur Jadwal Obat",
                                          style: TextStyle(
                                              fontSize:
                                                  SizeConfig.screenWidth * 0.04,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ],
                                )),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: SizeConfig.screenWidth * 1,
                        height: SizeConfig.screenHeight * 0.3,
                        margin: EdgeInsets.only(right: 25, left: 25, top: 40),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Text(
                                "Disiplin Terapkan Protokol Kesehatan",
                                style: TextStyle(
                                    fontSize: SizeConfig.screenWidth * 0.05,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Image.asset('images/masker.png',
                                        width: SizeConfig.screenWidth * 0.25,
                                        height: SizeConfig.screenHeight * 0.12),
                                    Text(
                                      'Menggunakan\nMasker',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize:
                                              SizeConfig.screenWidth * 0.04,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Image.asset(
                                      'images/cucitangan.png',
                                      width: SizeConfig.screenWidth * 0.25,
                                      height: SizeConfig.screenHeight * 0.12,
                                    ),
                                    Text(
                                      'Mencuci\nTangan',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize:
                                              SizeConfig.screenWidth * 0.04,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Image.asset(
                                      'images/socialdistancing.png',
                                      width: SizeConfig.screenWidth * 0.25,
                                      height: SizeConfig.screenHeight * 0.12,
                                    ),
                                    Text(
                                      'Menjaga\nJarak',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize:
                                              SizeConfig.screenWidth * 0.04,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ]))));
  }

  void initState() {
    super.initState();
    this.getData();
  }

  void checkData(var myList) {
    //length of empty list is zero
    if (myList.length == null) {
      print("List " + myList.toString() + " is empty");
    } else {
      print("List " + myList.toString() + " is not empty");
    }
  }
}
