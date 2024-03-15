import 'dart:ui';

import 'package:flutter/material.dart';

import '../common/styles.dart';
import '../common/themes.dart';

class ShowAlertDialog {
  static showAlertDialog(BuildContext context, Widget child,
      {Function(dynamic)? onThen}) {
    showDialog(
      context: context,
      useSafeArea: false,
      barrierColor: AppTheme.white.withOpacity(.2),
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: AnimatedAlertDialog(
            child: child,
          ),
        );
      },
    ).then((value) {
      if (onThen != null) {
        onThen(value);
      }
    });
  }
}

class AnimatedAlertDialog extends StatefulWidget {
  final Widget? child;

  const AnimatedAlertDialog({super.key, this.child});

  @override
  _AnimatedAlertDialogState createState() => _AnimatedAlertDialogState();
}

class _AnimatedAlertDialogState extends State<AnimatedAlertDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 0),
    );

    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: AlertDialog(
        insetPadding: const EdgeInsets.symmetric(
          horizontal: 0,
          vertical: 0,
        ).copyWith(
          top: Insets.xxl * 1.5,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: Insets.xs),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        content: widget.child,
      ),
    );
  }
}
