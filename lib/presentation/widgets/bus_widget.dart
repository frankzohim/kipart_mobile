import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ki_part/config/app_assets.dart';
import 'dart:ui' as ui;

class BusWidget extends StatelessWidget {
  final String? departureCity;
  final String? destinationCity;
  final String? departureDate;
  final String? arrivalDate;
  final TextStyle? cityNameStyle;
  final TextStyle? dateStyle;
  final Color color;
  final Color? banckgroundColor;
  const BusWidget(
      {super.key,
      this.departureCity,
      this.destinationCity,
      this.departureDate,
      this.arrivalDate,
      this.cityNameStyle,
      this.dateStyle,
      this.banckgroundColor = Colors.white,
      this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    final myCityStyle = cityNameStyle ??
        Theme.of(context)
            .textTheme
            .headline6!
            .copyWith(color: Theme.of(context).colorScheme.primary);
    final myDateStyle = dateStyle ?? Theme.of(context).textTheme.bodySmall;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 40,
          width: double.infinity,
          alignment: Alignment.center,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomPaint(
                size: Size.fromHeight(50),
                painter: _BusPainter(color, banckgroundColor!,
                    Theme.of(context).brightness == Brightness.dark),
              ),
              Image.asset(AppAssets.busIcon, color: color),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (departureCity != null)
              Text(
                departureCity!,
                style: myCityStyle,
              ),
            if (destinationCity != null)
              Text(
                destinationCity!,
                style: myCityStyle,
              ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (departureDate != null)
              Text(
                departureDate!,
                style: myDateStyle,
              ),
            if (arrivalDate != null)
              Text(
                arrivalDate!,
                style: myDateStyle,
              ),
          ],
        ),
      ],
    );
  }

  Future<ui.Image> _loadImage(String imageAssetPath) async {
    final ByteData data = await rootBundle.load(imageAssetPath);
    final codec = await ui.instantiateImageCodec(
      data.buffer.asUint8List(),
      // targetHeight: 40, targetWidth: 300, allowUpscaling: true
    );
    var frame = await codec.getNextFrame();
    return frame.image;
  }
}

class _BusPainter extends CustomPainter {
  final Color color;
  final Color backgroundColor;
  final bool isDarkMode;

  _BusPainter(this.color, this.backgroundColor, this.isDarkMode);

  @override
  void paint(Canvas canvas, Size size) async {
    canvas.drawCircle(
        Offset(30, size.height / 2),
        10,
        Paint()
          ..color = color
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round
          ..strokeWidth = 5);
    for (var i = 0; i < (size.width - 35) ~/ 30; i++) {
      canvas.drawLine(
          Offset(35 + i * 30, (size.height / 2)),
          Offset(35 + i * 30 + 10, (size.height / 2)),
          Paint()
            ..color = color
            ..style = PaintingStyle.stroke
            ..strokeWidth = 2);
    }

    Path p = Path()
      ..moveTo(size.width - 20, size.height / 2 + 15)
      ..lineTo(size.width - 30, size.height)
      ..addArc(
        Offset(size.width - 30, size.height / 2 - 15) & Size(20, 20),
        pi,
        pi,
      )
      ..lineTo(size.width - 20, size.height / 2 + 15)
      ..close();
    canvas.drawPath(
        p,
        Paint()
          ..color = color
          ..style = PaintingStyle.fill);
    canvas.drawCircle(Offset(size.width - 20, size.height / 2 - 5), 3,
        Paint()..color = backgroundColor);
  }

  @override
  bool shouldRepaint(_BusPainter oldDelegate) {
    return true;
  }
}
