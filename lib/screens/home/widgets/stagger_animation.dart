import 'package:flutter/material.dart';

import 'animated_list_view.dart';
import 'fade_container.dart';
import 'home_top.dart';

class StaggerAnimation extends StatelessWidget {
  final AnimationController controller;

  StaggerAnimation({super.key, required this.controller})
      : containerGrow = CurvedAnimation(
          parent: controller,
          curve: Curves.ease,
        ),
        listSlidePosition = EdgeInsetsTween(
                begin: EdgeInsets.only(bottom: 0),
                end: EdgeInsets.only(bottom: 80))
            .animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.325,
              0.8,
              curve: Curves.ease,
            ),
          ),
        ),
        fadeAnimation =
            ColorTween(begin: Color.fromRGBO(80, 210, 194, 1), end: Color.fromRGBO(80, 210, 194, 0))
                .animate(
          CurvedAnimation(parent: controller, curve: Curves.decelerate),
        );

  final Animation<double> containerGrow;
  final Animation<EdgeInsets> listSlidePosition;
  final Animation<Color?> fadeAnimation;

  Widget _buildAnimation(BuildContext context, Widget? child) {
    return Stack(
      children: [
        ListView(
          padding: EdgeInsets.zero,
          children: [
            HomeTop(
              containerGrow: containerGrow,
            ),
            AnimatedListView(
              listSlidePosition: listSlidePosition,
            ),
          ],
        ),
        IgnorePointer(
          child: FadeContainer(
            fadeAnimation: fadeAnimation,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: AnimatedBuilder(animation: controller, builder: _buildAnimation),
      ),
    );
  }
}
