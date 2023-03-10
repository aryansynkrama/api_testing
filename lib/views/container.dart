import 'package:flutter/material.dart';

class HeroAnimation extends StatelessWidget {
  const HeroAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: 'String',
        child: Container(
          width: 500,
          height: 500,
          color: Colors.blue,
        ),
      ),
    );
  }
}
