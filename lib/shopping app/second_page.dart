import 'package:flutter/material.dart';


class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset('asset/images/v.png'),
        centerTitle: true,
        title: Image.asset('asset/images/trendy.png'),
        actions: [
          Image.asset('asset/images/cart.png'),

        ],
      ),
    );
  }
}
