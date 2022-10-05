// import 'package:auto_animated/auto_animated.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import 'camion.dart';
// import 'car.dart';
// import 'moto.dart';

// class PageOne extends StatefulWidget {
//   @override
//   _PageOneState createState() => _PageOneState();
// }

// class _PageOneState extends State<PageOne> {
//   /// The global key to access the animated list.
//   final _animatedListKey = GlobalKey<AnimatedListState>();

//   ScrollController _scrollController;

//   @override
//   void initState() {
//     _scrollController = ScrollController();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }

//   final List<Widget> pages = [
//     Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         children: [
//           GestureDetector(
//             onTap: () {
//               Get.to(const Moto());
//             },
//             child: Container(
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               decoration: BoxDecoration(
//                 borderRadius: const BorderRadius.all(
//                   Radius.circular(16),
//                 ),
//                 color: const Color(0xfffdc72f).withOpacity(0.8),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.1),
//                     spreadRadius: 2,
//                     blurRadius: 2,
//                     offset: const Offset(0, 3), // changes position of shadow
//                   ),
//                 ],
//               ),
//               height: 150,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Text(
//                     "Moto",
//                     // style: Theme.of(context).textTheme.bodyText1,
//                   ),
//                   Image.asset("assets/images/motol.png"),
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(height: 10),
//           GestureDetector(
//             onTap: () {
//               Get.to(const Car());
//             },
//             child: Container(
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               decoration: BoxDecoration(
//                 borderRadius: const BorderRadius.all(
//                   Radius.circular(8),
//                 ),
//                 color: const Color(0xfffdc72f).withOpacity(0.8),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.1),
//                     spreadRadius: 2,
//                     blurRadius: 2,
//                     offset: const Offset(0, 3), // changes position of shadow
//                   ),
//                 ],
//               ),
//               height: 150,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Text(
//                     "Car",
//                     // style: Theme.of(context).textTheme.bodyText1,
//                   ),
//                   Image.asset("assets/images/car.png"),
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(height: 10),
//           GestureDetector(
//             onTap: () {
//               Get.to(const Camion());
//             },
//             child: Container(
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               decoration: BoxDecoration(
//                 borderRadius: const BorderRadius.all(
//                   Radius.circular(8),
//                 ),
//                 color: const Color(0xfffdc72f).withOpacity(0.8),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.1),
//                     spreadRadius: 2,
//                     blurRadius: 2,
//                     offset: const Offset(0, 3), // changes position of shadow
//                   ),
//                 ],
//               ),
//               height: 150,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Text(
//                     "Camion",
//                     // style: Theme.of(context).textTheme.bodyText1,
//                   ),
//                   Image.asset("assets/images/bus.png"),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     )
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Example')),
//       body: ,
//     );
//   }
// }
