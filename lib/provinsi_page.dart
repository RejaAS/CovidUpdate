import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import './JSON/provinsi.dart';
import 'package:intl/intl.dart';

class ProvinsiPage extends StatefulWidget {
  ProvinsiState createState() => ProvinsiState();
}

class ProvinsiState extends State<ProvinsiPage> {
  TextEditingController editingController = TextEditingController();
  final formatter = new NumberFormat("#,###");

  List<Provinsi> filteredList = List();
  List<Provinsi> _list = List();
  var loading = false;

  Future<Null> _fetchData() async {
    setState(() {
      loading = true;
    });

    final response =
        await http.get('https://api.kawalcorona.com/indonesia/provinsi');
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        for (Map i in data) {
          _list.add(Provinsi.fromJson(i));
          filteredList = _list;
        }
        loading = false;
      });
    }
  }

  void initState() {
    super.initState();
    _fetchData();
  }

  Widget build(context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Color(0xFFF1EABD),
          body: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [
                    0.3,
                    // 0.4,
                    // 0.7,
                    0.2
                  ],
                      colors: [
                    Color(0xFFdfedf7),
                    // Color(0xFFaacfee),
                    // Color(0xFF61a6e9),
                    Color(0xFF328bea),
                  ])),
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(
                          top: 35, bottom: 20, left: 15, right: 15),
                      child: Row(
                        children: [
                          Text("Data Provinsi",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold)),
                          Image.asset(
                            'images/pulau.png',
                            width: 125,
                            height: 60,
                            fit: BoxFit.fill,
                          ),
                        ],
                      )),
                  Container(),
                  Expanded(
                      child: loading
                          ? Center(
                              child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'images/loading.gif',
                                  height: 100,
                                  width: 100,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Text(
                                    'Loading...',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                )
                              ],
                            ))
                          : Column(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: TextField(
                                    controller: editingController,
                                    onChanged: (string) {
                                      setState(() {
                                        filteredList = _list
                                            .where((prov) => prov
                                                .attributes.provinsi
                                                .toLowerCase()
                                                .contains(string.toLowerCase()))
                                            .toList();
                                      });
                                    },
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        labelText: "Cari Nama Provinsi",
                                        prefixIcon: Icon(Icons.search),
                                        border: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.white, width: 15),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)))),
                                  ),
                                ),
                                Expanded(
                                  child: ListView.builder(
                                    padding: EdgeInsets.all(0),
                                    itemCount: filteredList.length,
                                    itemBuilder: (context, index) {
                                      final x = filteredList[index];
                                      return Container(
                                          margin: EdgeInsets.only(
                                              left: 15, right: 15, bottom: 2),
                                          child: Card(
                                              elevation: 20,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 10),
                                                      child: Row(
                                                        children: [
                                                          Image.asset(
                                                              'images/covid-19.png',
                                                              width: 20),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 10),
                                                            child: Text(
                                                              x.attributes
                                                                  .provinsi,
                                                              style: TextStyle(
                                                                  fontSize: 20,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                            child:
                                                                Row(children: [
                                                          Image.asset(
                                                            'images/aktif.png',
                                                            width: 25,
                                                            height: 25,
                                                          ),
                                                          Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      left: 5),
                                                              child: Column(
                                                                children: [
                                                                  Text("Aktif"),
                                                                  Text(
                                                                      formatter
                                                                          .format(
                                                                        x.attributes
                                                                            .kasusPosi,
                                                                      ),
                                                                      style: TextStyle(
                                                                          fontWeight:
                                                                              FontWeight.bold)),
                                                                ],
                                                              )),
                                                        ])),
                                                        Container(
                                                            child: Row(
                                                                children: [
                                                              Image.asset(
                                                                'images/sembuh.png',
                                                                width: 25,
                                                                height: 25,
                                                              ),
                                                              Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              5),
                                                                  child: Column(
                                                                    children: [
                                                                      Text(
                                                                          "Sembuh"),
                                                                      Text(
                                                                          formatter
                                                                              .format(
                                                                            x.attributes.kasusSemb,
                                                                          ),
                                                                          style:
                                                                              TextStyle(fontWeight: FontWeight.bold)),
                                                                    ],
                                                                  ))
                                                            ])),
                                                        Container(
                                                            child:
                                                                Row(children: [
                                                          Image.asset(
                                                            'images/meninggal.png',
                                                            width: 25,
                                                            height: 25,
                                                          ),
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 5),
                                                            child: Column(
                                                              children: [
                                                                Text(
                                                                    "Meninggal"),
                                                                Text(
                                                                    formatter
                                                                        .format(
                                                                      x.attributes
                                                                          .kasusMeni,
                                                                    ),
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold)),
                                                              ],
                                                            ),
                                                          )
                                                        ]))
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              )));
                                    },
                                  ),
                                ),
                              ],
                            ))
                ],
              )),
        ));
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
