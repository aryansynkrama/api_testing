import 'package:flutter/material.dart';

class BubbleBurstAnimation extends StatefulWidget {
  @override
  _BubbleBurstAnimationState createState() => _BubbleBurstAnimationState();
}

class _BubbleBurstAnimationState extends State<BubbleBurstAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _animation = Tween<double>(begin: 1, end: 0).animate(_animationController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          // Animation has completed, do something here
        }
      });
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Opacity(
        opacity: _animation.value,
        child: Image.asset('images/pokemon.jpg'),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
