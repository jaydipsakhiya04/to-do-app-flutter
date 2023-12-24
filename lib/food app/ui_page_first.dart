import 'dart:async';
import 'package:flutter/material.dart';
import 'package:todoflutter/food%20app/ui_page_second.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 5),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => SecondPage(),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Image(
          image: AssetImage('asset/images/pc.png'),
        ),
      ),
    );
  }
}
