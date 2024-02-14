import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'model.dart';



class ApiDemoPiyu extends StatefulWidget {
  const ApiDemoPiyu({super.key});

  @override
  State<ApiDemoPiyu> createState() => _ApiDemoPiyuState();
}

class _ApiDemoPiyuState extends State<ApiDemoPiyu> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          print("snapshot.data   --- ${snapshot.data}");
          print("snapshot.error   --- ${snapshot.error}");
          print("snapshot.hasData   --- ${snapshot.hasData}");
          if (snapshot.connectionState == ConnectionState.waiting) {
            const CircularProgressIndicator();
          } else if (snapshot.hasData) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 20),
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.purple.shade300,
                  height: 20,
                  width: 20,
                  child: Stack(
                    children: [
                      Image.network(
                        snapshot.data?[index].photoUrl ?? "",
                        // apiData[index].image.toString(),
                        // "https://d3j730xi5ph1dq.cloudfront.net/dream/style_thumbnail/cartoonist_v3.jpg",
                        height: 100,
                        width: 100,
                      ),
                      Positioned(
                          right: 25,
                          child: Text(
                            snapshot.data?[index].createdAt.toString() ?? "",

                            // " apiData[index].time.toString()",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                      Positioned(
                          left: 10,
                          top: 160,
                          child: Text(
                            snapshot.data?[index].name ?? "",

                            // " apiData[index].name.toString()",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                    ],
                  ),
                );
              },
            );
          }
          return Container(
            color: Colors.red.shade300,
          );
        },
      ),
    );
  }

  Future<List<ApiData>?> getData() async {
    final response = await http.get(
      Uri.parse("https://paint.api.wombo.ai/api/styles/"),
      // headers: {
      //   "Accept": "application/json",
      //   "Access-Control_Allow_Origin": "*"
      // }
    );
    print("response --- ${response.statusCode}");
    if (response.statusCode == 200) {
      print("response --- ${response.body}");

      return apiDataFromJson(response.body.toString());
    } else {
      return null;
    }
  }
}
