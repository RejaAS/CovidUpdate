import 'package:flutter/material.dart';

class Obat extends StatefulWidget {
  ObatState createState() => ObatState();
}

class ObatState extends State<Obat> {
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Atur Obat'),
        ),
      ),
    );
  }
}
