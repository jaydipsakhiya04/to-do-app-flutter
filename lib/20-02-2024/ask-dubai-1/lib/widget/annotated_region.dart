import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAnnotatedRegions extends StatelessWidget {
  final Widget child;
  final bool isDarkTheme;

  const CustomAnnotatedRegions({Key? key, required this.child, this.isDarkTheme = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: _statusBarColor(),
        statusBarBrightness: _statusBarColor(),
      ),
      child: child,
    );
  }

  Brightness _statusBarColor() {
    late Brightness brightness;

    if (isDarkTheme) {
      brightness = Platform.isIOS ? Brightness.light : Brightness.dark;
    } else {
      brightness = Platform.isIOS ? Brightness.dark : Brightness.light;
    }

    return brightness;
  }
}
