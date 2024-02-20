// ignore_for_file: unnecessary_parenthesis
import 'dart:io';
import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class SizeUtils {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double horizontalBlockSize;
  static late double verticalBlockSize;
  static late double appBarHeight;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    horizontalBlockSize = screenWidth / (isTablet() ? 150 : 100);
    verticalBlockSize = screenHeight / (isTablet() ? 150 : 100);
    appBarHeight = AppBar().preferredSize.height;
  }

  static bool isTablet() => Device.get().isTablet;
  static bool isPhone() => Device.get().isPhone;
  static bool isIphoneX() => Device.get().isIphoneX;

  static double fSize_40() {
    return horizontalBlockSize * 10.257; //40
  }

  static double fSize_30() {
    return horizontalBlockSize * 8.336; //30
  }

  static double fSize_25() {
    return horizontalBlockSize * 6.945; //25
  }

  static double fSize_24() {
    return horizontalBlockSize * 6.690; //24
  }

  static double fSize_20() {
    return horizontalBlockSize * 5.560; //20
  }

  static double fSize_18() {
    return horizontalBlockSize * 5.0; //18
  }

  static double fSize_16() {
    return horizontalBlockSize * 4.450; //16
  }

  static double fSize_15() {
    return horizontalBlockSize * 4.170; //15
  }

  static double fSize_14() {
    return horizontalBlockSize * 3.900; //14
  }

  static double fSize_11() {
    return horizontalBlockSize * 3.06; //11
  }

  static double fSize_12() {
    return horizontalBlockSize * 3.360; //12
  }

  static double fSize_13() {
    return horizontalBlockSize * 3.637; //13
  }

  static double fSize_10() {
    return horizontalBlockSize * 2.800; //10
  }

  static double fSize_8() {
    return horizontalBlockSize * 2.245; //8
  }

  static double fSize_6() {
    return horizontalBlockSize * 1.685; //6
  }

  static double fSize_4() {
    return horizontalBlockSize * 1.120; //4
  }
}

class Device {
  static double devicePixelRatio = ui.window.devicePixelRatio;
  static ui.Size size = ui.window.physicalSize;
  static double width = size.width;
  static double height = size.height;
  static double screenWidth = width / devicePixelRatio;
  static double screenHeight = height / devicePixelRatio;
  static ui.Size screenSize = ui.Size(screenWidth, screenHeight);
  final bool isTablet, isPhone, isIos, isAndroid, isIphoneX, hasNotch;
  static Device? _device;
  static Function? onMetricsChange;

  Device({
    required this.isTablet,
    required this.isPhone,
    required this.isIos,
    required this.isAndroid,
    required this.isIphoneX,
    required this.hasNotch,
  });

  factory Device.get() {
    if (_device != null) return _device!;

    if (onMetricsChange == null) {
      onMetricsChange = ui.window.onMetricsChanged;
      ui.window.onMetricsChanged = () {
        _device = null;

        size = ui.window.physicalSize;
        width = size.width;
        height = size.height;
        screenWidth = width / devicePixelRatio;
        screenHeight = height / devicePixelRatio;
        screenSize = ui.Size(screenWidth, screenHeight);

        onMetricsChange!();
      };
    }

    bool isTablet;
    bool isPhone;
    final isIos = Platform.isIOS;
    final isAndroid = Platform.isAndroid;
    var isIphoneX = false;
    var hasNotch = false;

    if (devicePixelRatio < 2 && (width >= 1000 || height >= 1000)) {
      isTablet = true;
      isPhone = false;
    } else if (devicePixelRatio == 2 && (width >= 1920 || height >= 1920)) {
      isTablet = true;
      isPhone = false;
    } else {
      isTablet = false;
      isPhone = true;
    }

    // Recalculate for Android Tablet using device inches
    if (isAndroid) {
      final adjustedWidth = _calWidth() / devicePixelRatio;
      final adjustedHeight = _calHeight() / devicePixelRatio;
      final diagonalSizeInches = (math
              .sqrt(math.pow(adjustedWidth, 2) + math.pow(adjustedHeight, 2))) /
          _ppi;

      if (diagonalSizeInches >= 7) {
        isTablet = true;
        isPhone = false;
      } else {
        isTablet = false;
        isPhone = true;
      }
    }

    if (isIos &&
        isPhone &&
        (screenHeight == 812 ||
            screenWidth == 812 ||
            screenHeight == 896 ||
            screenWidth == 896 ||
            // iPhone 12 pro
            screenHeight == 844 ||
            screenWidth == 844 ||
            // Iphone 12 pro max
            screenHeight == 926 ||
            screenWidth == 926)) {
      isIphoneX = true;
      hasNotch = true;
    }

    if (_hasTopOrBottomPadding()) hasNotch = true;

    return _device = Device(
      isTablet: isTablet,
      isPhone: isPhone,
      isAndroid: isAndroid,
      isIos: isIos,
      isIphoneX: isIphoneX,
      hasNotch: hasNotch,
    );
  }

  static double _calWidth() {
    if (width > height) {
      return (width +
          (ui.window.viewPadding.left + ui.window.viewPadding.right) *
              width /
              height);
    }
    return (width + ui.window.viewPadding.left + ui.window.viewPadding.right);
  }

  static double _calHeight() {
    return (height +
        (ui.window.viewPadding.top + ui.window.viewPadding.bottom));
  }

  static int get _ppi => Platform.isAndroid
      ? 160
      : Platform.isIOS
          ? 150
          : 96;

  static bool _hasTopOrBottomPadding() {
    final padding = ui.window.viewPadding;
    //print(padding);
    return padding.top > 0 || padding.bottom > 0;
  }
}
