import 'package:flutter/material.dart';
import 'package:soul_player/platform/linux/linux.dart';
import 'package:soul_player/platform/mobile/splash.dart';

import '../utils/device_utils.dart';

class LayoutFinder extends StatelessWidget {
  const LayoutFinder({super.key});

  @override
  Widget build(BuildContext context) {
    if (!GlobalUtils.mobile) {
      return const LinuxApp();
    } else {
      return const AppSplashScreen();
    }
  }
}
