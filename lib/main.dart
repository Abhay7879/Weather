import 'package:flutter/material.dart';
import 'package:weather_app/home.dart';
import 'package:weather_app/loading.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => const Loading(),
        "/home": (context) => const Home(),
        "/loading": (context) => const Loading(),
      },
    ),
  );
}
