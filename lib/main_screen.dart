import 'package:flutter/material.dart';
import 'package:tree_animation/logic.dart';


class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

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
            const FruitListWidget(pos: 400),
            const FruitListWidget(pos: 430),
            const FruitListWidget(pos: 450),
            const FruitListWidget(pos: 410),
            const FruitListWidget(pos: 460),
          ],
        ),
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
