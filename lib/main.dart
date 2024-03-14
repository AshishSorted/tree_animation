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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  late final AnimationController _fadeController = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _fadeAnimation = CurvedAnimation(
    parent: _fadeController,
    curve: Curves.easeIn,
  );

  int activeFruit = 0;

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

    _fadeController.addStatusListener((status) {
      print(status.toString());
      if (status == AnimationStatus.forward) {
        if (activeFruit != (fruits.length - 1)) {
          activeFruit += 1;
        } else {
          activeFruit = 0;
        }
        setState(() {});
        // _fadeController
        // _fadeController.repeat();
      }
      if (status == AnimationStatus.completed) {
        _fadeController.forward(from: 0);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final List<Fruit> fruits = [
    Fruit('Apple', 400),
    Fruit('Pear', 400),
    Fruit('Lemon', 400),
    Fruit('Mango', 400),
    Fruit('Strawberry', 400),
  ];

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

        if (activeFruit != (fruits.length - 1)) {
          activeFruit += 1;
        } else {
          activeFruit = 0;
        }
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Positioned(
            bottom: fruits[activeFruit].pos,
            left: 100,
            child: AnimatedContainer(
              duration: const Duration(seconds: 1),
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: GestureDetector(
                  behavior: HitTestBehavior.deferToChild,
                  onTap: () {
                    _controller.reset();
                    _controller.forward();
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
        ],
      ),
    );
  }
}
