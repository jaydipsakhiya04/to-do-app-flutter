import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todoflutter/shopping%20app/second_page.dart';

class FirstSceen extends StatefulWidget {
  const FirstSceen({Key? key}) : super(key: key);

  @override
  State<FirstSceen> createState() => _FirstSceenState();
}

class _FirstSceenState extends State<FirstSceen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 4),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => SecondScreen(),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              child: Image.asset('asset/images/wscreen.png', fit: BoxFit.fill),
            ),
          ),
        ],
      ),
    );
  }
}
