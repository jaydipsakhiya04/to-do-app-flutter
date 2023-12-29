import 'package:flutter/material.dart';
import 'package:todoflutter/comman_widget/custom_textfield_widget.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat App"),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 500,
                  margin: EdgeInsets.all(20),
                  color: Colors.red.shade300,
                ),
                Container(
                  height: 500,
                  margin: EdgeInsets.all(20),
                  color: Colors.yellow.shade300,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: CustomTextField(
                isShowBorder: true,
                hintText: "Text",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
