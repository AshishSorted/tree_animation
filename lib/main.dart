import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Fruit {
  final String name;
  final double pos;

  Fruit(this.name, this.pos);
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Fruit> fruits = [
    Fruit('Apple', 400),
    // Fruit('Orange'),
    // Fruit('Banana'),
    // Fruit('Grape'),
    // Fruit('Watermelon'),
    // Fruit('Strawberry'),
    // Fruit('Pineapple'),
    // Fruit('Mango'),
    // Fruit('Cherry'),
    // Fruit('Kiwi'),
    // Fruit('Pear'),
    // Fruit('Plum'),
    // Fruit('Lemon'),
    // Fruit('Peach'),
    // Fruit('Blueberry'),
  ];

  double pos = 300;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'Floating Fruits',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Container(
          child: Stack(
            children: [
              Positioned(
                bottom: 200,
                right: 10,
                left: 10,
                child: Image.asset(
                  'assets/tree.png',
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(color: Colors.green, height: 200, width: MediaQuery.of(context).size.width,),
              ),
              FloatingFruits(fruits: fruits[0]),
              // AnimatedPositioned(
              //   duration: Durations.long4,
              //   bottom: pos,
              //   child: GestureDetector(
              //     onTap: () {
              //       pos = pos == 200 ? 400 : 200;
              //       setState(() {
              //       });
              //     },
              //     child: Image.asset(
              //       'assets/apple.png',
              //       width: 50,
              //       height: 50,
              //     ),
              //   ),
              // ),

            ],
          ),
        ),
      ),
    );
  }
}

class FloatingFruits extends StatefulWidget {
  final Fruit fruits;

  const FloatingFruits({Key? key, required this.fruits}) : super(key: key);

  @override
  State<FloatingFruits> createState() => _FloatingFruitsState();
}

class _FloatingFruitsState extends State<FloatingFruits>
    with SingleTickerProviderStateMixin{

  double pos = 0;

  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    pos = widget.fruits.pos;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      reverseDuration: const Duration(seconds: 1),
    );
    _animation = Tween<Offset>(
      begin: const Offset(0.0, 0.0),
      end: const Offset(0.0, 4.5),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _animateFruitFall() {
    _controller.forward().then((_) {
      _controller.reverse().then((_) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Center(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/${widget.fruits.name.toLowerCase()}.png',
                        width: 100,
                        height: 100,
                      ),
                      SizedBox(height: 20),
                      Text(
                        widget.fruits.name,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return
      AnimatedPositioned(
          duration: Durations.long4,
        bottom: pos,
        child: GestureDetector(
            behavior: HitTestBehavior.deferToChild,
            onTap: () {
              // pos = pos == 100 ? widget.fruits.pos : 100;
              // setState(() {
              // });
              _controller.reset();
              _controller.forward();
              _animateFruitFall();
            },
            child: SlideTransition(
              position: _animation,
              child: Image.asset(
                'assets/${widget.fruits.name.toLowerCase()}.png',
                width: 50,
                height: 50,
              ),
            ),
        ),
      );
  }
}
//
// class FruitWidget extends StatefulWidget {
//   final Fruit fruit;
//
//   const FruitWidget({Key? key, required this.fruit}) : super(key: key);
//
//   @override
//   _FruitWidgetState createState() => _FruitWidgetState();
// }
//
// class _FruitWidgetState extends State<FruitWidget>
//     with SingleTickerProviderStateMixin {
//
//
//   @override
//   void initState() {
//     super.initState();
//
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   void _animateFruitFall() {
//     _controller.forward().then((_) {
//       _controller.reverse().then((_) {
//         showDialog(
//           context: context,
//           builder: (BuildContext context) {
//             return Center(
//               child: AnimatedContainer(
//                 duration: const Duration(milliseconds: 500),
//                 curve: Curves.easeInOut,
//                 width: 200,
//                 height: 200,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(20.0),
//                 ),
//                 child: SingleChildScrollView(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Image.asset(
//                         'assets/${widget.fruit.name.toLowerCase()}.png',
//                         width: 100,
//                         height: 100,
//                       ),
//                       SizedBox(height: 20),
//                       Text(
//                         widget.fruit.name,
//                         style: const TextStyle(fontSize: 20),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           },
//         );
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       behavior: HitTestBehavior.translucent,
//       onTap: () {
//         _controller.reset();
//         _controller.forward();
//         _animateFruitFall();
//       },
//       child: SlideTransition(
//         position: _animation,
//         child: Image.asset(
//           'assets/${widget.fruit.name.toLowerCase()}.png',
//           width: 50,
//           height: 50,
//         ),
//       ),
//     );
//   }
// }
