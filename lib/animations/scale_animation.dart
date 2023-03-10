import 'package:flutter/material.dart';

class ScalingAnimation extends StatefulWidget {
  const ScalingAnimation({Key? key}) : super(key: key);

  @override
  State<ScalingAnimation> createState() => _ScalingAnimationState();
}

class _ScalingAnimationState extends State<ScalingAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller = AnimationController(
    vsync: this,
    duration: Duration(seconds: 2),
  )..repeat(reverse: false);
  late final Animation<double> _animation =
      CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: 3,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 2,
        ),
        itemBuilder: (context, index) => ScaleTransition(
          scale: controller,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
