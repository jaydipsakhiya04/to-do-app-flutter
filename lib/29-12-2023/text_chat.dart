import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextChatDemo extends StatefulWidget {
  const TextChatDemo({Key? key}) : super(key: key);

  @override
  State<TextChatDemo> createState() => _TextChatDemoState();
}

class _TextChatDemoState extends State<TextChatDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text"),
      ),
      body: Column(
        children: [
          200.h.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 200,
                color: Colors.green.shade300,
                child: Column(
                  children: [
                    const Text(
                        "isfbkdlfnkdklklhlkjhljljljjljlkjlkjlkjlhjlkhlkhkjhjkglklhlkjhljljljjljlkjlkjlkjlhjlkhlkhkjhjkghkjgkjkgkgkjgjkljjljlkjlkjlkjlhjlkhlkhkjhjkghkjgkjkgkgkjgjkjjflkndfbnd"),
                    20.h.verticalSpace,
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("121212121"),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
