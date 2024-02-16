import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Screen1 extends StatelessWidget {
  Screen1({super.key});

  Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: controller.dataList.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Get.to(Screen2(dataModel: controller.dataList[index]))
                    ?.then((value) {
                  controller.dataList.refresh();
                  print("value ---- ${value}");
                  print("value ---- ${controller.dataList[1].reply}");
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Card(
                  child: Container(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.person),
                            Column(
                              children: [
                                Text(controller.dataList[index].name),
                                Text(controller.dataList[index].time),
                              ],
                            ),
                            Spacer(),
                            Icon(Icons.more_vert),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text(controller.dataList[index].query),
                        SizedBox(
                          height: 25,
                        ),
                        if ((controller.dataList[index].reply ?? "").isNotEmpty)
                          IntrinsicHeight(
                            child: Row(
                              children: [
                                Container(
                                  width: 1,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.person),
                                        Column(
                                          children: [
                                            Text(controller
                                                .dataList[index].name),
                                            Text(controller
                                                .dataList[index].time),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Obx(() {
                                      return Text(
                                          controller.dataList[index].reply ??
                                              "");
                                    })
                                  ],
                                ),
                              ],
                            ),
                          )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}

class Screen2 extends StatelessWidget {
  DataModel dataModel;

  Screen2({super.key, required this.dataModel});

  Controller controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.person),
        title: Column(
          children: [
            Text(dataModel.name),
            Text(dataModel.time),
          ],
        ),
      ),
      body: Column(
        children: [
          Text(dataModel.query),
          SizedBox(
            height: 20,
          ),
          IntrinsicHeight(
            child: Row(
              children: [
                Container(
                  width: 1,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 6,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.person),
                        Column(
                          children: [
                            Text(dataModel.name),
                            Text(dataModel.time),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Obx(() {
                      return Text(controller.replyController.value.text);
                    })
                  ],
                ),
              ],
            ),
          ),
          Spacer(),
          Expanded(
              child: TextField(
                controller: controller.replyController.value,
                decoration: InputDecoration(
                    hintText: "Type a Message",
                    suffix: IconButton(
                      onPressed: () {
                        dataModel.reply = controller.replyController.value.text;
                        controller.replyController.value.clear();
                        Get.back();
                      },
                      icon: const Icon(Icons.send),
                    )),
              )),
        ],
      ),
    );
  }
}

class DataModel {
  String name, time, query;

  String? reply;

  DataModel({
    required this.name,
    required this.time,
    required this.query,
    this.reply = '',
  });
}

class Controller extends GetxController {
  Rx<TextEditingController> replyController = TextEditingController().obs;

  RxList<DataModel> dataList = <DataModel>[
    DataModel(
        name: "Jaydip Sakhiya",
        time: "1 month ago",
        reply: "skdjbsjdbjsijdbijs",
        query:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book"),
    DataModel(
        name: "Priyanka Dhebariya",
        time: "1 month ago",
        query:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book"),
    DataModel(
        name: "Devin Devin",
        time: "1 month ago",
        query:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book"),
    DataModel(
        name: "Demo user 1",
        time: "1 month ago",
        query:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book"),
    DataModel(
        name: "Demo user 2",
        time: "1 month ago",
        query:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book"),
  ].obs;
}
