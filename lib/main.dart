import 'package:flutter/material.dart';
import 'package:flutter_api_testing/views/container.dart';

import 'animations/scale_animation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Hero(
              tag: 'String',
              child: Container(
                width: 20,
                height: 20,
                color: Colors.red,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HeroAnimation(),
                  ),
                );
              },
              child: Text('Go To Next Page'),
            ),
          ],
        ),
      ),
    );
  }
}

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  bool start = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 200)).then((value) {
      setState(() {
        start = true;
      });
      Future.delayed(Duration(milliseconds: 700)).then((value) {
        Navigator.push(
          context,
          ScaleRoute(
            page: (RedPage()),
          ),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: OverflowBox(
      maxHeight: MediaQuery.of(context).size.longestSide * 2,
      maxWidth: MediaQuery.of(context).size.longestSide * 2,
      child: AnimatedContainer(
        curve: Curves.easeIn,
        duration: Duration(milliseconds: 700),
        width: start ? MediaQuery.of(context).size.longestSide * 2 : 0,
        height: start ? MediaQuery.of(context).size.longestSide * 2 : 0,
        decoration: BoxDecoration(
            color: /*start ?*/ Colors.red /*: Colors.black */,
            shape: BoxShape.circle),
        child: Center(child: Text("uber")),
      ),
    ));
  }
}

class RedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(
        child: Text(
          "I am RedPage",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}

class ScaleRoute extends PageRouteBuilder {
  final Widget page;

  ScaleRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return ScaleTransition(
              scale: Tween<double>(
                begin: 0.0,
                end: 1.0,
              ).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Curves.fastOutSlowIn,
                ),
              ),
              child: child,
            );
          },
        );
}
