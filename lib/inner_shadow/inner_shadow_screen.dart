import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;

class InnerShadowScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final innerShadow = ConcaveDecoration(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      depression: 2,
      colors: [
        // Color(0xFF61C680),
        Color.fromRGBO(0, 0, 0, 0.5),
        Color.fromRGBO(0, 0, 0, 0),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Inner Shadow'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            defaultButton(),
            SizedBox(height: 100),
            Stack(
              children: [
                defaultButton(),
                Container(
                  width: 84 * 2,
                  height: 24 * 2,
                  decoration: innerShadow,
                ),
              ],
            ),
            SizedBox(height: 100),
            Container(
              width: 84 * 2,
              height: 24 * 2,
              decoration: innerShadow,
            ),
          ],
        ),
      ),
    );
  }

  Container defaultButton() {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        color: Color(0xFF61C680),
      ),
      width: 84 * 2,
      height: 24 * 2,
    );
  }
}

class ConcaveDecoration extends Decoration {
  final ShapeBorder shape;
  final double depression;
  final List<Color> colors;

  ConcaveDecoration({
    required this.shape,
    required this.depression,
    required this.colors,
  })   : assert(shape != null),
        assert(depression >= 0),
        assert(colors == null || colors.length == 2);

  @override
  BoxPainter createBoxPainter([void onChanged]) {
    return _ConcaveDecorationPainter(shape, depression, colors);
  }

  @override
  EdgeInsetsGeometry get padding => shape.dimensions;
}

class _ConcaveDecorationPainter extends BoxPainter {
  ShapeBorder shape;
  double depression;
  List<Color> colors;

  _ConcaveDecorationPainter(this.shape, this.depression, this.colors) {
    // colors ??= [Colors.black87, Colors.white];
  }

  @override
  void paint(
      ui.Canvas canvas, ui.Offset offset, ImageConfiguration configuration) {
    final rect = offset & configuration.size!;
    final shapePath = shape.getOuterPath(rect);

    final delta = 16 / rect.longestSide;
    final stops = [0.5 - delta, 0.5 + delta];

    final path = Path()
      ..fillType = PathFillType.evenOdd
      ..addRect(rect.inflate(depression * 2))
      ..addPath(shapePath, Offset.zero);
    canvas.save();
    canvas.clipPath(shapePath);

    final paint = Paint()
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, depression);
    final clipSize = rect.size.aspectRatio > 1
        ? Size(rect.width, rect.height / 2)
        : Size(rect.width / 2, rect.height);
    for (final alignment in [Alignment.topLeft, Alignment.bottomRight]) {
      final shaderRect =
          alignment.inscribe(Size.square(rect.longestSide), rect);
      paint
        ..shader = ui.Gradient.linear(
            shaderRect.topLeft, shaderRect.bottomRight, colors, stops);

      canvas.save();
      canvas.clipRect(alignment.inscribe(clipSize, rect));
      canvas.drawPath(path, paint);
      canvas.restore();
    }
    canvas.restore();
  }
}
