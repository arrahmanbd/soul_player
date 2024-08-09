import 'dart:typed_data';
import 'package:flutter/material.dart';

import 'dart:ui' as ui;

Widget buildSongImage(Uint8List art) {
  if (art.isNotEmpty) {
    try {
      //Decode base64 string to Uint8List
      //Uint8List imageBytes = base64Decode(song.picture);
      return Image.memory(
        art,
        fit: BoxFit.cover,
      );
    } catch (e) {
      // Handle decoding error or invalid image data
      print('Error decoding image: $e');
      return const Icon(Icons.music_note);
    }
  } else {
    return const Icon(Icons.music_note);
  }
}

Future<Uint8List> createHerNameImage() async {
  final recorder = ui.PictureRecorder();
  final canvas = Canvas(
      recorder, Rect.fromPoints(const Offset(0, 0), const Offset(100, 100)));

  final paint = Paint()
    ..color = Colors.blue
    ..style = PaintingStyle.fill;

  // Draw background
  canvas.drawRect(const Rect.fromLTWH(0, 0, 100, 100), paint);

  // Draw text
  final textPainter = TextPainter(
    text: const TextSpan(
      text: 'M',
      style: TextStyle(
          color: Colors.white, fontSize: 80, fontWeight: FontWeight.bold),
    ),
    textAlign: TextAlign.center,
    textDirection: TextDirection.ltr,
  )..layout(maxWidth: 100);

  textPainter.paint(canvas, const Offset(10, 10));

  final picture = recorder.endRecording();
  final img = await picture.toImage(100, 100);
  final byteData = await img.toByteData(format: ui.ImageByteFormat.png);
  return byteData!.buffer.asUint8List();
}

Uint8List generateStaticImage() {
  // Create a simple 1x1 pixel PNG image with a red color
 return Uint8List.fromList([
    137, 80, 78, 71, 13, 10, 26, 10, // PNG header
    0, 0, 0, 13, 73, 72, 68, 82, // IHDR chunk
    0, 0, 0, 1, 0, 0, 0, 1, // Image dimensions: 1x1 pixel
    8, 2, 0, 0, 0, 0, 0, 0, // Bit depth, color type, compression method, etc.
    0, 0, 0, 12, 73, 68, 65, 84, // IDAT chunk
    8, 1, 0, 0, 0, 0, 1, 0, 0, 0, // Image data
    0, 0, 0, 0, 73, 69, 78, 68, // IEND chunk
    0, 0, 0, 0, 0, 0, 0, 0, 0 // Padding bytes
  ]);
}
