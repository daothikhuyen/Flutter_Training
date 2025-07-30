import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_practice/pages/fying_saucer_page.dart';

class RootPage extends StatefulWidget {
  final int tabIndex;

  const RootPage({super.key, required this.tabIndex});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  double myAngle = 0.0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            text: 'Xin chào',
            style: TextStyle(
              fontSize: 18,
              locale: Locale('vi'), // đây là locale, không phải "local"
            ),
          ),
        ),
        backgroundColor: Color(0xFFf0eddc),
        actions: <Widget>[
          TextButton(
            onPressed: () {},
            child: Icon(Icons.calendar_month_outlined),
          ),
          TextButton(onPressed: () {}, child: Icon(Icons.more_vert)),
        ],
      ),
      body: Column(
        children: [
          Expanded(child: FyingSaucerPage()),
          Expanded(
            child: Row(
              // clipBehavior: Clip.none,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: RotationTransition(
                    alignment: Alignment.center,
                    turns: _animationController,
                    child: CircleAvatar(
                      radius: 80,
                      backgroundColor: Color(0xffFDCF09),
                      child: CircleAvatar(
                        radius: 70,
                        backgroundImage: NetworkImage(
                          'https://s3.o7planning.com/images/boy-128.png',
                        ),
                      ),
                    ),
                  ),
                ),
                AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    double angle =
                        sin(_animationController.value * 2 * pi) *
                        pi /
                        10; // Lắc

                    return Transform.rotate(angle: angle, child: child);
                  },
                  child: Icon(Icons.ac_unit_rounded, size: 80),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Semantics(
        label: 'Button stop animation',
        button: true,
        enabled: true,
        readOnly: true,
        child: FloatingActionButton(
          onPressed: () {
            setState(() {
              if (_animationController.isAnimating) {
                _animationController.stop();
              } else {
                _animationController.repeat();
              }
            });
          },
          child: const Icon(Icons.rotate_right_outlined),
        ),
      ),
    );
  }
}
