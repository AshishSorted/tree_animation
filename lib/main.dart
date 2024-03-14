import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Fruit {
  final String name;
  final double pos;

  Fruit(this.name, this.pos);
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Fruit> fruits = [
    Fruit('Lemon', 400),
    Fruit('Mango', 400),
    Fruit('Strawberry', 400),
    Fruit('Pear', 400),
    Fruit('Apple', 400),
  ];

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
            Positioned(
              bottom: 0,
              child: Container(
                color: Colors.green,
                height: 200,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            ...fruits
                .asMap()
                .entries
                .map((entry) =>
                    FloatingFruits(fruits: entry.value, index: entry.key))
                .toList(),
          ],
        ),
      ),
    );
  }
}

class FloatingFruits extends StatefulWidget {
  final Fruit fruits;
  final int index;

  const FloatingFruits({Key? key, required this.fruits, required this.index})
      : super(key: key);

  @override
  State<FloatingFruits> createState() => _FloatingFruitsState();
}

class _FloatingFruitsState extends State<FloatingFruits>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animation = Tween<Offset>(
      begin: const Offset(0, 0.0),
      end: const Offset(0, 4),
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
    Future.delayed(const Duration(milliseconds: 1500))
        .then((value) => showDialog(
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
                          const SizedBox(height: 20),
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
            ));
    _controller.forward().then((_) {
      _controller.reverse().then((_) {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(seconds: 1),
      bottom: widget.fruits.pos,
      left: 100,
      child: GestureDetector(
        behavior: HitTestBehavior.deferToChild,
        onTap: () {
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
