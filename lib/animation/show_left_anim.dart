import 'dart:async';
import 'package:flutter/material.dart';

class ShowLeftAnimation extends StatefulWidget {
  final Widget child;
  final int delay;

  ShowLeftAnimation({required this.child, required this.delay});

  @override
  _ShowLeftAnimationState createState() => _ShowLeftAnimationState();
}

class _ShowLeftAnimationState extends State<ShowLeftAnimation>
    with TickerProviderStateMixin {
  late AnimationController _animController;
  late Animation<Offset> _animOffset;

  @override
  void initState() {
    super.initState();

    _animController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    final curve =
        CurvedAnimation(curve: Curves.decelerate, parent: _animController);
    _animOffset = Tween<Offset>(begin: const Offset(1, 1), end: Offset.zero)
        .animate(curve);
    _animController.forward();
  }

  @override
  void dispose() {
    if (mounted) _animController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      child: SlideTransition(
        position: _animOffset,
        child: widget.child,
      ),
      opacity: _animController,
    );
  }
}
