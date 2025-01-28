import 'package:flutter/material.dart';

class FadeContainer extends StatelessWidget {
  final Animation<Color?> fadeAnimation;

  const FadeContainer({super.key, required this.fadeAnimation});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "fade",
      child: AnimatedBuilder(
        animation: fadeAnimation,
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
              color: fadeAnimation.value ?? Colors.transparent,
            ),
          );
        },
      ),
    );
  }
}
