import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Fruit {
  final String name;
  final double pos;
  bool? done;

  Fruit(this.name, this.pos, {this.done});
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
        body: Stack(
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
            // Positioned(
            //   bottom: 0,
            //   child: Container(
            //     color: Colors.green,
            //     height: 200,
            //     width: MediaQuery.of(context).size.width,
            //   ),
            // ),
            const FruitList(pos: 400),
            const FruitList(pos: 430),
            const FruitList(pos: 450),
            const FruitList(pos: 410),
            const FruitList(pos: 460),
          ],
        ),
      ),
    );
  }
}

class FruitList extends StatefulWidget {
  final double pos;

  const FruitList({Key? key, required this.pos}) : super(key: key);

  @override
  State<FruitList> createState() => _FruitListState();
}

class _FruitListState extends State<FruitList> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  late final AnimationController _fadeController = AnimationController(
    duration: Duration(milliseconds: Random().nextInt(500) + 700),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _fadeAnimation = CurvedAnimation(
    parent: _fadeController,
    curve: Curves.easeIn,
  );

  int activeFruit = 0;
  late List<Fruit> fruits;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animation = Tween<Offset>(
      begin: const Offset(0, 0.0),
      end: Offset(0, 4 + (((widget.pos / 100) - 4) * 2)),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _fadeController.addStatusListener((status) {
      if (status == AnimationStatus.forward && _fadeController.isAnimating) {
        // print("Fruit index: $activeFruit ");
        if (activeFruit != (fruits.length - 1)) {
          activeFruit += 1;
        } else {
          activeFruit = 0;
        }
        setState(() {});
      }
      if (status == AnimationStatus.completed) {}
    });

    fruits = [
      Fruit('Apple', widget.pos),
      Fruit('Pear', widget.pos),
      Fruit('Lemon', widget.pos),
      Fruit('Mango', widget.pos),
      Fruit('Strawberry', widget.pos),
    ];

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  void _animateFruitFall(Fruit fruit) async {
    _controller.forward().then((_) {
      _controller.reverse().then((_) {});
    });

    await Future.delayed(const Duration(milliseconds: 1500)).then(
      (value) async {
        await showDialog(
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
                      const SizedBox(height: 20),
                      Image.asset(
                        'assets/${fruit.name.toLowerCase()}.png',
                        width: 100,
                        height: 100,
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: Material(
                          child: Text(
                            fruit.name,
                            style: const TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );

        // _fadeController.forward(from: 0).then((_) {
        //   _fadeController.reverse().then((_) {});
        // });
        _fadeController.repeat(reverse: true);

        // if (activeFruit != (fruits.length - 1)) {
        //   activeFruit += 1;
        // } else {
        //   activeFruit = 0;
        // }
        // setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: fruits[activeFruit].pos,
      left: fruits[activeFruit].pos == 400
          ? 300
          : fruits[activeFruit].pos == 430
              ? 60
              : fruits[activeFruit].pos == 450
                  ? 250
                  : fruits[activeFruit].pos == 460
                      ? 120
                      : 200,
      child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: ScaleTransition(
            scale: _fadeAnimation,
            child: GestureDetector(
              behavior: HitTestBehavior.deferToChild,
              onTap: () {
                _fadeController.animateBack(1);
                _animateFruitFall(fruits[activeFruit]);
              },
              child: SlideTransition(
                position: _animation,
                child: Image.asset(
                  'assets/${fruits[activeFruit].name.toLowerCase()}.png',
                  width: 50,
                  height: 50,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
