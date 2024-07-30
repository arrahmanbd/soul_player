import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soul_player/core/constants/colors.dart';
import 'package:soul_player/layouts/mobile/screens/library/providers/library_provider.dart';
import 'package:soul_player/layouts/mobile/screens/library/providers/permission_provider.dart';

import 'screens/now_playing/nowplaying_screen.dart';

class AppSplashScreen extends ConsumerStatefulWidget {
  const AppSplashScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AppSplashScreenState();
}

class _AppSplashScreenState extends ConsumerState<AppSplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? scaleController;
  Animation<double>? scaleAnimation;

  bool _a = false;
  bool _c = false;
  bool _d = false;
  bool _e = false;
  bool secondAnim = false;
  bool goTo = false;
  Color boxColor = Colors.transparent;
  Color regularWhite = Colors.white;
  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void dispose() {
    if (scaleController != null) {
      scaleController!.dispose();
    }
    super.dispose();
  }

  void navigation() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const MobileHome(),
      ),
    );
  }

  Future<void> init() async {
    await Future.delayed(Duration.zero);
    final permission = ref.read(permissionProvider);
    if (permission) {
      ref.read(libraryProvider.notifier).scanAll();
    }
    Timer(const Duration(milliseconds: 1000), () {
      setState(() {
        boxColor = primary;
        _a = true;
      });
    });
    Timer(const Duration(milliseconds: 1500), () {
      setState(() {
        boxColor = regularWhite;
        _c = true;
      });
    });
    Timer(const Duration(milliseconds: 1700), () {
      setState(() {
        _e = true;
      });
    });
    Timer(const Duration(milliseconds: 3200), () {
      secondAnim = true;

      scaleController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1000),
      )..forward();
      scaleAnimation =
          Tween<double>(begin: 0.0, end: 12).animate(scaleController!);

      setState(() {
        boxColor = regularWhite;
        _d = true;
        goTo = true;
      });
      if (goTo) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MobileHome(),
          ),
        );
      }
    });
  }

  Widget build(BuildContext context) {
    double _h = MediaQuery.of(context).size.height;
    double _w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: deepDark,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: _d ? 900 : 2500),
              curve: _d ? Curves.fastLinearToSlowEaseIn : Curves.elasticOut,
              height: _d
                  ? 0
                  : _a
                      ? _h / (kIsWeb ? 2.5 : 4.5)
                      : 20,
              width: 20,
            ),
            AnimatedContainer(
              duration: Duration(seconds: _c ? 2 : 0),
              curve: Curves.fastLinearToSlowEaseIn,
              height: _d
                  ? _h
                  : _c
                      ? 200
                      : 20,
              width: _d
                  ? _w
                  : _c
                      ? 200
                      : 20,
              decoration: BoxDecoration(
                  color: !_d ? boxColor : regularWhite,
                  // shape: _d ? BoxShape.rectangle : BoxShape.circle,
                  borderRadius: _d
                      ? const BorderRadius.only()
                      : BorderRadius.circular(30)),
              child: secondAnim
                  ? Center(
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                            color: primary, shape: BoxShape.circle),
                        child: AnimatedBuilder(
                          animation: scaleAnimation!,
                          builder: (c, child) => Transform.scale(
                            scale: scaleAnimation!.value,
                            child: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: primary,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Center(
                      child: _e
                          ? Image.asset('assets/icons/256.png',
                              width: 120, height: 120)
                          : const SizedBox(),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
