import 'package:flutter/material.dart';
import 'package:tree_animation/logic.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        backgroundColor: Colors.yellow,
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
              'assets/images/tree.png',
              fit: BoxFit.contain,
            ),
          ),

          const FruitListWidget(pos: 400),
          const FruitListWidget(pos: 430),
          const FruitListWidget(pos: 450),
          const FruitListWidget(pos: 410),
          const FruitListWidget(pos: 460),
        ],
      ),
    );
  }
}

class FruitListWidget extends StatelessWidget {
  final double pos;

  const FruitListWidget({Key? key, required this.pos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FruitList(pos: pos);
  }
}
