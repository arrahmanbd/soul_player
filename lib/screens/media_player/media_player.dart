import 'package:broken_soul/providers/music_player/player_provider.dart';
import 'package:broken_soul/screens/allsongs/all_songs.dart';
import 'package:broken_soul/screens/media_player/volume_rocker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

class MediaPlayerSkin extends StatelessWidget {
  const MediaPlayerSkin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliderDrawer(
      isCupertino: true,
      slideDirection: SlideDirection.LEFT_TO_RIGHT,
      sliderOpenSize: MediaQuery.of(context).size.width - 150,
      appBar: const SliderAppBar(
        appBarPadding: EdgeInsets.symmetric(horizontal: 16),
        appBarColor: Color.fromARGB(255, 37, 37, 37),
        title: Text(
          'BrokenSoul',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
        ),
      ),
      slider: Container(color: Colors.grey[900], child: const ScanAllSongs()),
      child: Container(
        color: Colors.grey[900],
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Consumer(
                builder: (_, WidgetRef ref, __) {
                  final playerState = ref.watch(playerProvider);
                  String text = playerState.currentSong.title;
                  return LCDMonitor(
                    songName: text.length <= 10 ? text : text.substring(0, 10),
                    title: playerState.currentSong.artist ??
                        'Unknown Artist',
                    duration: formatDuration(playerState.position),
                    volume: playerState.volume,
                    durationBar: 4,
                  );
                },
              ),
              const SizedBox(height: 20),
              Consumer(
                builder: (_, WidgetRef ref, __) {
                  return ControllerButtons(
                    onPlay: () {
                      ref.read(playerProvider.notifier).resume();
                    },
                    onPause: () {
                      ref.read(playerProvider.notifier).pause();
                    },
                    onNext: () {
                      ref.read(playerProvider.notifier).playNext();
                    },
                    onPrevious: () {
                      ref.read(playerProvider.notifier).playPrevious();
                    },
                  );
                },
              ),
              const SizedBox(height: 10.0),
              VolDark(),
            ],
          ),
        ),
      ),
    );
  }

  String formatDuration(Duration duration) {
    // Format duration as needed (e.g., mm:ss)
    return '${duration.inMinutes.remainder(60).toString().padLeft(2, '0')}:${(duration.inSeconds.remainder(60)).toString().padLeft(2, '0')}';
  }
}

class LCDMonitor extends StatelessWidget {
  final String songName;
  final String title;
  final String duration;
  final double volume;
  final double durationBar;

  const LCDMonitor({
    super.key,
    required this.songName,
    required this.title,
    required this.duration,
    required this.volume,
    required this.durationBar,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(300, 200),
      painter: LCDMonitorPainter(
        songName: songName,
        title: title,
        duration: duration,
        volume: volume,
        durationBar: durationBar,
      ),
    );
  }
}

class LCDMonitorPainter extends CustomPainter {
  final String songName;
  final String title;
  final String duration;
  final double volume;
  final double durationBar;

  LCDMonitorPainter({
    required this.songName,
    required this.title,
    required this.duration,
    required this.volume,
    required this.durationBar,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    // Draw LCD screen background
    final Rect screenRect =
        Rect.fromLTWH(20, 20, size.width - 40, size.height - 40);
    canvas.drawRect(screenRect, paint);

    // Draw LCD frame
    final Paint framePaint = Paint()
      ..color = Colors.grey[800]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;
    canvas.drawRect(screenRect, framePaint);

    // Draw song name
    _drawText(canvas, songName, 30, 50, size.width - 60, 24, Colors.white);

    // Draw title
    _drawText(canvas, title, 30, 80, size.width - 60, 18, Colors.grey[400]!);

    // Draw duration
    _drawText(
        canvas, duration, 30, 110, size.width - 60, 18, Colors.grey[400]!);

    // Draw volume bar
    _drawDashedProgressBar(
      canvas,
      30,
      140,
      size.width - 60,
      20,
      volume,
      Colors.blueAccent,
    );

    // Draw charge bar
    _drawDashedProgressBar(
      canvas,
      30,
      170,
      size.width - 60,
      20,
      durationBar,
      Colors.greenAccent,
    );
  }

  void _drawText(Canvas canvas, String text, double x, double y,
      double maxWidth, double fontSize, Color color) {
    final TextSpan span = TextSpan(
      text: text,
      style: TextStyle(color: color, fontSize: fontSize),
    );
    final TextPainter tp = TextPainter(
      text: span,
      textAlign: TextAlign.left,
      textDirection: TextDirection.ltr,
    );
    tp.layout(maxWidth: maxWidth);
    tp.paint(canvas, Offset(x, y));
  }

  void _drawDashedProgressBar(Canvas canvas, double x, double y, double width,
      double height, double progress, Color color) {
    final Paint backgroundPaint = Paint()
      ..color = Colors.grey[700]!
      ..style = PaintingStyle.fill;
    final Paint progressPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final Rect backgroundRect = Rect.fromLTWH(x, y, width, height);
    canvas.drawRect(backgroundRect, backgroundPaint);

    int dashCount = 20;
    double dashWidth = (width - 2) / dashCount;
    double dashHeight = height - 2;
    double gapWidth = 2.0;

    for (int i = 0; i < dashCount; i++) {
      double startX = x + (i * (dashWidth + gapWidth)) + gapWidth;
      if (i / dashCount < progress) {
        canvas.drawRect(
          Rect.fromLTWH(startX, y + 1, dashWidth, dashHeight),
          progressPaint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class ControllerButtons extends StatelessWidget {
  final VoidCallback onPlay;
  final VoidCallback onPause;
  final VoidCallback onNext;
  final VoidCallback onPrevious;

  const ControllerButtons({
    super.key,
    required this.onPlay,
    required this.onPause,
    required this.onNext,
    required this.onPrevious,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildButton(Icons.skip_previous, onPrevious),
        _buildButton(Icons.pause, onPause),
        _buildButton(Icons.play_arrow, onPlay),
        _buildButton(Icons.skip_next, onNext),
      ],
    );
  }

  Widget _buildButton(IconData icon, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomPaint(
        size: const Size(40, 40),
        painter: ButtonPainter(),
        child: IconButton(
          icon: Icon(icon),
          color: Colors.white,
          onPressed: onPressed,
        ),
      ),
    );
  }
}

class ButtonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.grey[850]!
      ..style = PaintingStyle.fill;

    final Path path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width * 0.7, 0)
      ..lineTo(size.width, size.height * 0.3)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);

    final Paint highlightPaint = Paint()
      ..color = Colors.grey[900]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final Path highlightPath = Path()
      ..moveTo(1, 1)
      ..lineTo(size.width * 0.7, 1)
      ..lineTo(size.width - 1, size.height * 0.3)
      ..lineTo(size.width - 1, size.height - 1)
      ..lineTo(1, size.height - 1)
      ..close();

    canvas.drawPath(highlightPath, highlightPaint);

    final Paint shadowPaint = Paint()
      ..color = Colors.black.withOpacity(0.6)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final Path shadowPath = Path()
      ..moveTo(size.width, size.height)
      ..lineTo(size.width * 0.7, size.height)
      ..lineTo(0, size.height * 0.3)
      ..lineTo(0, 0);

    canvas.drawPath(shadowPath, shadowPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
