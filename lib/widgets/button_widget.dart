import 'dart:math' as math;

import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  CustomButton({Key key}) : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animation = Tween(begin: 1.1, end: 1.3).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedBuilder(
          animation: _animationController,
          builder: (context, widget) {
            return Transform.rotate(
              angle: _animationController.status == AnimationStatus.forward
                  ? (math.pi * 2) * _animationController.value
                  : -(math.pi * 2) * _animationController.value,
              child: Container(
                height: 55,
                width: 55,
                child: CustomPaint(
                  painter: ButtonCanvas(
                    radius: _animation.value,
                  ),
                ),
              ),
            );
          },
        ),
        Positioned(
          top: 15,
          left: 13,
          child: Image.asset(
            "assets/furniture/right-arrow.png",
            scale: 2.5,
          ),
        ),
      ],
    );
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
