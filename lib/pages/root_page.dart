import 'dart:math';
import 'dart:ui';

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
    final Animation<double> curve = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    );
    Animation<int> alpha = IntTween(
      begin: 0,
      end: 255,
    ).animate(_animationController);
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
        title: Text('Page Home'),
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
          Expanded(
             child: FyingSaucerPage(),
          ),
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
                        sin(_animationController.value * 2 * pi) * pi / 10; // Lắc
            
                    return Transform.rotate(angle: angle, child: child);
                  },
                  child: Icon(Icons.ac_unit_rounded, size: 80),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
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
    );
  }
}

// implicit animation
  // Positioned(
  //   left: (MediaQuery.of(context).size.width/2)-80,
  //   top: (MediaQuery.of(context).size.height/2)-120,
  //   child: AnimatedRotation(
  //     turns: myAngle,
  //     duration: const Duration(seconds: 2),
  //     child: CircleAvatar(
  //       radius: 80,
  //       backgroundColor: Color(0xffFDCF09),
  //       child: CircleAvatar(
  //         radius: 70,
  //         backgroundImage: NetworkImage(
  //           'https://s3.o7planning.com/images/boy-128.png',
  //         ),
  //       ),
  //     ),
  //   ),
  // ),
