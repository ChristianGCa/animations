import 'package:flutter/material.dart';

class StaggerAnimation extends StatelessWidget {
  final AnimationController controller;
  final Color buttonColor = Color.fromRGBO(80, 210, 194, 1);

  StaggerAnimation({super.key, required this.controller})
      : buttonSqueeze = Tween<double>(
          begin: 320,
          end: 60,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0, 0.150),
          ),
        ),
        buttonZoomOut = Tween<double>(
          begin: 60,
          end: 1000,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.5, 1, curve: Curves.bounceInOut),
          ),
        );

  final Animation<double> buttonSqueeze;
  final Animation<double> buttonZoomOut;

  Widget _buildAnimation(BuildContext context, Widget? child) {
    return Padding(
      padding: EdgeInsets.only(bottom: 50),
      child: InkWell(
        onTap: () {
          controller.forward();
        },
        child: Hero(
          tag: 'fade',
          child: buttonZoomOut.value <= 60
        ? Container(
        width: buttonSqueeze.value,
          height: 60,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: _buildInside(context),
        )
            : Container(
        width: buttonZoomOut.value,
        height: buttonZoomOut.value,
        decoration: BoxDecoration(
          color: buttonColor,
          shape: buttonZoomOut.value < 500 ?
          BoxShape.circle : BoxShape.rectangle,
        ),
      ),
        ),
      ),
    );
  }

  Widget _buildInside(BuildContext context) {
    if (buttonSqueeze.value > 75) {
      return Text(
        'Sign in',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.3,
        ),
      );
    } else {
      return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        strokeWidth: 1,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: _buildAnimation,
    );
  }
}
