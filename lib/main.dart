import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:untitledproject/constants/color.dart';
import 'package:untitledproject/constants/header.dart';
import 'package:untitledproject/main.dart';
import 'package:untitledproject/screens/home.dart';
import 'package:untitledproject/todoitem.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  bool isChecked=false;

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen()
    );
  }
}

