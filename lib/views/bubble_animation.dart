// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'dart:math' as math;
//
//
// class Bubble {
//   final Offset position;
//   final double radius;
//   final double speed;
//
//   Bubble({required this.position, required this.radius, required this.speed});
//
//   void update() {
//     position.translate(0, -speed);
//   }
//
//   bool isOffscreen(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return position.dy < -radius || position.dx < -radius || position.dx > size.width + radius;
//   }
//
//   bool contains(Offset point) {
//     return (point - position).distance <= radius;
//   }
//
//   Widget build(BuildContext context) {
//     return Positioned(
//       left: position.dx - radius,
//       top: position.dy - radius,
//       child: Container(
//         width: radius * 2,
//         height: radius * 2,
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           color: Colors.blue,
//         ),
//       ),
//     );
//   }
// }
//
// class Particle {
//   Offset position;
//   final double radius;
//   final double speed;
//   final double direction;
//
//   Particle({required this.position, required this.radius, required this.speed, required this.direction});
//
//   void update() {
//     final dx = speed * math.cos(direction);
//     final dy = speed * math.sin(direction);
//     position = position.translate(dx, -dy);
//   }
//
//   bool isOffscreen(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return position.dy < -radius || position.dx < -radius || position.dx > size.width + radius;
//   }
//
//   Widget build(BuildContext context) {
//     return Positioned(
//       left: position.dx - radius,
//       top: position.dy - radius,
//       child: Container(
//         width: radius * 2,
//         height: radius * 2,
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           color: Colors.blue,
//         ),
//       ),
//     );
//   }
// }
//
// class BubbleBurstAnimation extends StatefulWidget {
//   @override
//   _BubbleBurstAnimationState createState() => _BubbleBurstAnimationState();
// }
//
// class _BubbleBurstAnimationState extends State<BubbleBurstAnimation> with TickerProviderStateMixin {
//   final List<Bubble> bubbles = [];
//
//   late AnimationController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 3),
//     )..addListener(() {
//       setState(() {
//         bubbles.removeWhere((bubble) => bubble.isOffscreen(context));
//         bubbles.forEach((bubble) => bubble.update());
//       });
//     });
//     _controller.forward();
//     _createBubbles();
//   }
//
//   void _createBubbles() {
//     const bubbleCount = 20;
//     const minRadius = 10.0;
//     const maxRadius = 30.0;
//     const minSpeed = 1.0;
//     const maxSpeed = 4.0;
//
//     final size = MediaQuery.of(context).size;
//     final random = math.Random();
//     for (var i = 0; i < bubbleCount; i++) {
//       final radius = minRadius + random.nextDouble() * (maxRadius - minRadius);
//       final speed = minSpeed + random.nextDouble() * (maxSpeed - minSpeed);
//       final x = radius + random.nextDouble() * (size.width - radius * 2);
//       final y = size.height + radius;
//       bubbles.add(Bubble(position: Offset(x, y), radius: radius, speed: speed));
//     }
//   }
//
//   void _burstBubble(Bubble bubble) {
//     setState(() {
//       final particleCount = 20;
//       final particleMinRadius = 2.0;
//       final particleMaxRadius = 5.0;
//       final particleMinSpeed = 1.0;
//       final particleMaxSpeed = 4.0;
//
//       final random = math.Random();
//       final particles = List.generate(particleCount, (_) {
//         final radius = particleMinRadius + random.nextDouble() * (particleMaxRadius - particleMinRadius);
//         final speed = particleMinSpeed + random.nextDouble() * (particleMaxSpeed - particleMinSpeed);
//         final direction = 2 * math.pi * random.nextDouble();
//         return Particle(
//           position: bubble.position,
//           radius: radius,
//           speed: speed,
//           direction: direction,
//         );
//       });
//
//       bubbles.remove(bubble);
//       bubbles.addAll(particles);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTapUp: (details) {
//         final bubble = bubbles.firstWhere((bubble) => bubble.contains(details.localPosition), orElse: () => null);
//         if (bubble != null) {
//           _burstBubble(bubble);
//         }
//       },
//       child: Stack(
//         children: bubbles.map((bubble) => bubble.build(context)).toList(),
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }
