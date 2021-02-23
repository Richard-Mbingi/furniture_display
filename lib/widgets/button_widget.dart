import 'dart:math' as math;

import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  CustomButton({Key key}) : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animation = Tween(begin: 1.0, end: 1.2)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
    _controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, widget) {
          return Transform.rotate(
            angle: _controller.status == AnimationStatus.forward
                ? (math.pi * 2) * _controller.value
                : -(math.pi * 2) * _controller.value,
            child: InkWell(
              onTap: (){},
              child: Container(
                height: 55,
                width: 55,
                child: CustomPaint(
                  painter: ButtonCanvas(
                    radius: _animation.value,
                  ),
                ),
              ),
            ),
          );
        });
  }
}

class ButtonCanvas extends CustomPainter {
  double radius;
  ButtonCanvas({this.radius});

  @override
  void paint(Canvas canvas, Size size) {
    Paint _arc = Paint()
      ..color = Colors.deepOrange
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    Paint _circle = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.fill;

    Offset _center = Offset(size.width / 2, size.height / 2);

    canvas.drawCircle(_center, size.width / 2, _circle);

    canvas.drawArc(
      Rect.fromCenter(
        center: _center,
        width: size.width * radius,
        height: size.height * radius,
      ),
      math.pi / 4,
      math.pi / 2,
      false,
      _arc,
    );
    canvas.drawArc(
      Rect.fromCenter(
        center: _center,
        width: size.width * radius,
        height: size.height * radius,
      ),
      -math.pi / 4,
      -math.pi / 2,
      false,
      _arc,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
