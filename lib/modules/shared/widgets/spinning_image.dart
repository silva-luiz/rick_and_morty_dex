import 'package:flutter/material.dart';

class SpinningImage extends StatefulWidget {
  final double size;

  const SpinningImage({super.key, this.size = 50});

  @override
  _SpinningImageState createState() => _SpinningImageState();
}

class _SpinningImageState extends State<SpinningImage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: Image.asset(
        'assets/images/icon.png',
        width: widget.size,
        height: widget.size,
      ),
    );
  }
}
