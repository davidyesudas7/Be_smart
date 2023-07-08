import 'dart:math';

import 'package:flutter/material.dart';

class HalfCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height);
    final radius = min(size.width / 2, size.height / 2);
    const double markerInterval =
        pi / 10; // Dividing the half circle into 10 equal parts
    const double markerStartAngle = -pi; // Start angle for the markers

    // Draw the value points
    final markerPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    for (int i = 0; i <= 10; i++) {
      final markerAngle = markerStartAngle + (markerInterval * i);
      final markerX = center.dx + cos(markerAngle) * radius;
      final markerY = center.dy + sin(markerAngle) * radius;
      final markerPoint = Offset(markerX, markerY);

      // Draw the value point as a dot
      const markerRadius = 2.0;
      canvas.drawCircle(markerPoint, markerRadius, markerPaint);
    }

    // Draw the inner circle with elevation
    final innerCircleRadius =
        radius * 0.6; // Adjust the size of the inner circle here
    final innerCircleRect =
        Rect.fromCircle(center: center, radius: innerCircleRadius);
    final innerCirclePaint = Paint()..color = Colors.white;

    canvas.drawShadow(
      Path()..addOval(innerCircleRect),
      Colors.black,
      30.0,
      true,
    );

    canvas.drawCircle(center, innerCircleRadius, innerCirclePaint);

    // Draw the text inside the inner circle
    final textPainter = TextPainter(
      text: const TextSpan(
        text: '22c',
        style: TextStyle(
            fontSize: 22.0, fontWeight: FontWeight.w700, color: Colors.black),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(center.dx - textPainter.width / 2,
          center.dy - textPainter.height / 2),
    );
  }

  @override
  bool shouldRepaint(HalfCirclePainter oldDelegate) {
    return false;
  }
}

class TempratureDropdown extends StatefulWidget {
  const TempratureDropdown({super.key});

  @override
  State<TempratureDropdown> createState() => _TempratureDropdownState();
}

class _TempratureDropdownState extends State<TempratureDropdown> {
  int _selectedValue = 24;
  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<int>> items = [];
    for (int i = 14; i <= 28; i++) {
      items.add(DropdownMenuItem<int>(
        value: i,
        child: Text(
          '${i}c',
          style: TextStyle(fontSize: 30),
        ),
      ));
    }
    return Center(
      child: DropdownButton<int>(
        icon: const Icon(Icons.arrow_drop_up),
        value: _selectedValue,
        items: items,
        onChanged: (int? newValue) {
          setState(() {
            _selectedValue = newValue!;
          });
        },
      ),
    );
  }
}

class HumidityDropDown extends StatefulWidget {
  const HumidityDropDown({super.key});

  @override
  State<HumidityDropDown> createState() => _HumidityDropDownState();
}

class _HumidityDropDownState extends State<HumidityDropDown> {
  int _selectedValue = 54;
  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<int>> items = [];
    for (int i = 20; i <= 60; i++) {
      items.add(DropdownMenuItem<int>(
        value: i,
        child: Text(
          '$i%',
          style: const TextStyle(fontSize: 30),
        ),
      ));
    }
    return Center(
      child: DropdownButton<int>(
        icon: const Icon(Icons.arrow_drop_up),
        value: _selectedValue,
        items: items,
        onChanged: (int? newValue) {
          setState(() {
            _selectedValue = newValue!;
          });
        },
      ),
    );
  }
}
