// import 'package:flutter/material.dart';
// import '../../../utils/models/master/group.dart';
// import '../group_info/group_information_screen.dart';
//
// class FirstScreen extends StatefulWidget {
//   Group group;
//
//   FirstScreen({super.key, required this.group});
//
//   @override
//   _FirstScreenState createState() => _FirstScreenState();
// }
//
// class _FirstScreenState extends State<FirstScreen> {
//   bool start = false;
//
//   @override
//   void initState() {
//     super.initState();
//
//     Future.delayed(Duration(milliseconds: 200)).then((value) {
//       setState(() {
//         start = true;
//       });
//       Future.delayed(Duration(milliseconds: 700)).then((value) {
//         Navigator.push(
//           context,
//           ScaleRoute(
//             page: (GroupInformationScreen(
//               group: widget.group,
//             )),
//           ),
//         );
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: OverflowBox(
//         maxHeight: MediaQuery.of(context).size.longestSide * 2,
//         maxWidth: MediaQuery.of(context).size.longestSide * 2,
//         child: AnimatedContainer(
//           alignment: Alignment.centerLeft,
//           curve: Curves.easeIn,
//           duration: Duration(milliseconds: 700),
//           width: start ? MediaQuery.of(context).size.longestSide * 2 : 0,
//           height: start ? MediaQuery.of(context).size.longestSide * 2 : 0,
//           decoration: BoxDecoration(
//               color: start ? Colors.white : Colors.blue,
//               shape: BoxShape.circle),
//           child: Container(
//             alignment: Alignment.centerLeft,
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class ScaleRoute extends PageRouteBuilder {
//   final Widget page;
//
//   ScaleRoute({required this.page})
//       : super(
//     pageBuilder: (
//         BuildContext context,
//         Animation<double> animation,
//         Animation<double> secondaryAnimation,
//         ) =>
//     page,
//     transitionsBuilder: (
//         BuildContext context,
//         Animation<double> animation,
//         Animation<double> secondaryAnimation,
//         Widget child,
//         ) {
//       return ScaleTransition(
//         scale: Tween<double>(
//           begin: 0.0,
//           end: 1.0,
//         ).animate(
//           CurvedAnimation(
//             parent: animation,
//             curve: Curves.fastOutSlowIn,
//           ),
//         ),
//         child: child,
//       );
//     },
//   );
// }
//
// class ClickScreenWidget extends StatefulWidget {
//   @override
//   _ClickScreenWidgetState createState() => _ClickScreenWidgetState();
// }
//
// class _ClickScreenWidgetState extends State<ClickScreenWidget> {
//   Offset? _tapPosition;
//
//   void _handleTap(TapUpDetails details) {
//     setState(() {
//       _tapPosition = details.globalPosition;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTapUp: _handleTap,
//       child: Stack(
//         children: [
//           Positioned.fill(
//             child: Container(
//               color: Colors.white,
//             ),
//           ),
//           if (_tapPosition != null)
//             Positioned(
//               left: _tapPosition!.dx - 25,
//               top: _tapPosition!.dy - 25,
//               child: Container(
//                 width: 50,
//                 height: 50,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Colors.red,
//                 ),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }
