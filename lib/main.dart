import 'package:cobaavd/home.dart';
import 'package:cobaavd/onBoarding.dart';
import 'package:cobaavd/provinsi_page.dart';
import 'package:flutter/material.dart';
import 'package:cobaavd/obat.dart';
import 'package:cobaavd/nyoba.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => SplashScreen(),
      '/home': (context) => CovidData(),
      '/provinsi': (context) => ProvinsiPage(),
      '/obat': (context) => Nyoba(),
    },
  ));
}
