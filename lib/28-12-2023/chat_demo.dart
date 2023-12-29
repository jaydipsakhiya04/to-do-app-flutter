import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoflutter/comman_widget/custom_textfield_widget.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController textEditingController = TextEditingController();
  List<String> messageList = [];

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat App"),
      ),
      body: Stack(
        children: [
          Container(
              height: 1.sh,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: messageList.length,
                itemBuilder: (context, index) {
                  return messageBox(
                    msg: messageList[index],
                  );
                },
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        onChanged: (value) {
                          textEditingController.text = value;
                          setState(() {});
                        },
                        controller: textEditingController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Colors.blue),
                        )),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        messageList.add(textEditingController.text);
                        textEditingController.clear();
                        setState(() {});
                      },
                      icon: textEditingController.text.isEmpty
                          ? const Icon(Icons.audiotrack_rounded)
                          : const Icon(Icons.send),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget messageBox({required String msg}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          constraints: BoxConstraints(
            maxWidth: 0.8.sw,
            maxHeight: double.infinity,
          ),
          padding: EdgeInsets.all(10.r),
          margin: EdgeInsets.all(10.r),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                msg,
                style: const TextStyle(fontSize: 16.0),
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
    );
  }
}
