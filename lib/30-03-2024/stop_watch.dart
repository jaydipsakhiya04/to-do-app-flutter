import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class StopwatchController extends GetxController {
  final stopwatch = Stopwatch();
  final isPlaying = RxBool(false);
  final elapsedTime = RxString("00:00:000");


  void startStopMethod() {
    if (stopwatch.isRunning) {
      print("stop stop thyyhhh");
      stopwatch.stop();
      isPlaying.value = false;
    } else {
      stopwatch.start();
      isPlaying.value = true;
    }
  }

  void resetWatch() {
    stopwatch.reset();
    elapsedTime.value = "00:00:000";

    if (isPlaying.isTrue) {
      stopwatch.stop();
      isPlaying.value = false;
    }
  }

  String formatTime(int milliseconds) {
    String millisecondsStr = (milliseconds % 1000).toString().padLeft(3, "0");
    String secondsStr =
    ((milliseconds ~/ 1000) % 60).toString().padLeft(2, "0");
    String minutesStr =
    ((milliseconds ~/ 1000) ~/ 60).toString().padLeft(2, "0");
    return "$minutesStr:$secondsStr:$millisecondsStr";
  }

  void startTimer() async {
    print("timer start hoo");

    while (stopwatch.isRunning) {
      await Future.delayed(const Duration(milliseconds: 30));
      elapsedTime.value = formatTime(stopwatch.elapsed.inMilliseconds);
    }
  }

  @override
  void onInit() {
    super.onInit();
    ever(isPlaying, (isPlaying) {
      if (isPlaying!) {
        startTimer();
      }
    });
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Stopwatch',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final stopwatchController = Get.put(StopwatchController());
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() => Text(
                stopwatchController.elapsedTime.value,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              )),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: stopwatchController.resetWatch,
                      icon: const Icon(Icons.stop)),
                  const SizedBox(
                    width: 40,
                  ),
                  IconButton(
                      onPressed: stopwatchController.startStopMethod,
                      icon: Obx(() => Icon(stopwatchController.isPlaying.value
                          ? Icons.pause
                          : Icons.play_arrow))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
