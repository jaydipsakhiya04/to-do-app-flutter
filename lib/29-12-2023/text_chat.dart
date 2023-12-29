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
        title: const Text("Text"),
      ),
      body: Column(
        children: [
          200.h.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                constraints: BoxConstraints(
                  maxWidth: 0.8.sw,
                  maxHeight: double.infinity,
                ),
                padding: EdgeInsets.all(10.r),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "hy",
                      style: TextStyle(fontSize: 16.0),
                    ),
                    12.h.verticalSpace,
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Time"),
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
