import 'package:flutter/material.dart';

class FyingSaucerPage extends StatefulWidget {
  const FyingSaucerPage({super.key});

  @override
  State<FyingSaucerPage> createState() => _FyingSaucerPageState();
}

class _FyingSaucerPageState extends State<FyingSaucerPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animation;
  final Image ufo = Image.asset('assets/images/ufo.jpg');

  @override
  void initState() {
    super.initState();
    _animation = AnimationController(
      duration: const Duration(seconds: 7),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        BeanTrainsition(animation: _animation),
                Expanded(
          child: SizedBox(width: 90, height: 90, child: ufo)
        ),
      ],
    );
  }

  
}

class BeanTrainsition extends StatelessWidget {
  const BeanTrainsition({
    super.key,
    required AnimationController animation,
  }) : _animation = animation;

  final AnimationController _animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (_, __) {
        return ClipPath(
          clipper: const BeamClipper(),
          child: Container(
            height: 10000,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.center,
                radius: 3,
                colors: [Colors.yellow, Colors.transparent],
                stops: [0, _animation.value]
              ),
            ),
          ),
        );
      },
    );
  }
}

class BeamClipper extends CustomClipper<Path> {
  const BeamClipper();

  @override
  getClip(Size size) {
    return Path()
      ..lineTo(size.width / 2, size.height / 2)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..lineTo(size.width / 2, size.height / 2)
      ..close();
  }

  /// Return false always because we always clip the same area.
  @override
  bool shouldReclip(CustomClipper oldClipper) => false;
}


