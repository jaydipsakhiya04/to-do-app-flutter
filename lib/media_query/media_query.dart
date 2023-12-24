import 'package:flutter/material.dart';

class MediaQueryScreen extends StatefulWidget {
  const MediaQueryScreen({Key? key}) : super(key: key);

  @override
  State<MediaQueryScreen> createState() => _MediaQueryScreenState();
}

class _MediaQueryScreenState extends State<MediaQueryScreen> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Media Query"),
      ),
      body: Center(
        child: Container(
          height: h * 0.16,
          width: w * 0.5,
          alignment: Alignment.center,
          color: Colors.red.shade100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("height ---  $h"),
              Text("width ---  $w"),
            ],
          ),
        ),
      ),
    );
  }

  /// Piyu is best Singer ...
}
