import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ButtonMikeSend extends StatefulWidget {
  const ButtonMikeSend({Key? key}) : super(key: key);

  @override
  State<ButtonMikeSend> createState() => _ButtonMikeSendState();
}

class _ButtonMikeSendState extends State<ButtonMikeSend> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          250.h.verticalSpace,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      textEditingController.text = value;
                      setState(() {});
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.blue),
                    )),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: textEditingController.text.isEmpty
                      ? const Icon(Icons.audiotrack_rounded)
                      : const Icon(Icons.send),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
