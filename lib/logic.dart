import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tree_animation/common/styles.dart';
import 'package:tree_animation/common/themes.dart';
import 'package:tree_animation/screen/main_screen/address_controller.dart';
import 'package:tree_animation/screen/main_screen/create_order_controller.dart';
import 'package:tree_animation/screen/main_screen/inventory_controller.dart';

class Fruit {
  final String name;
  final double pos;
  bool? done;

  Fruit(this.name, this.pos, {this.done});
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
  InventoryController inventoryController = Get.find();
  AddAddressController addressController = Get.find();

  CreateOrderController createOrderController = Get.find();
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
                  width: Get.width * 0.8,
                  // height: Get.height * 0.6,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: Insets.xxl, horizontal: 23),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            // height: Get.height * .6,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  offset: Offset(1, 4),
                                  blurRadius: 21,
                                  color: Color.fromRGBO(0, 0, 0, 0.16),
                                )
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(Insets.xl),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      child: Column(
                                    children: [
                                      Text(
                                        "Congratulations",
                                        textAlign: TextAlign.center,
                                        style: TextStyles.title2.copyWith(
                                          fontFamily: "JD",
                                          fontSize: 24,
                                          color: AppTheme.darkYellow,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "You've won",
                                        textAlign: TextAlign.center,
                                        style: TextStyles.title2.copyWith(
                                          fontFamily: "JD",
                                          fontSize: 16,
                                          color: AppTheme.greyB5B5B5,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(
                                        height: Insets.lg,
                                      ),
                                      Image.asset(
                                        'assets/images/${fruit.name.toLowerCase()}.png',
                                        width: 100,
                                        height: 100,
                                      ),
                                      const SizedBox(height: 20),
                                      Center(
                                        child: Text(
                                          "1 kg ${fruit.name} as complimentory gift",
                                          style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  )),
                                  SizedBox(
                                    height: Insets.xl,
                                  ),
                                  InkWell(
                                    onTap: () async {},
                                    child: Text(
                                      "Yay!",
                                      textAlign: TextAlign.center,
                                      style: TextStyles.title2.copyWith(
                                        fontSize: 20,
                                        color: AppTheme.green518216,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 23,
                          ),
                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppTheme.grey595959,
                              ),
                              child: const Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 35,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
            );
          },
        );

        _fadeController.repeat(reverse: true);
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
                  'assets/images/${fruits[activeFruit].name.toLowerCase()}.png',
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
