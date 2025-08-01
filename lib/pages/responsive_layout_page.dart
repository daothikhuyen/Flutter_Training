import 'package:flutter/material.dart';
import 'package:fraction/fraction.dart';

class ResponsiveLayoutPage extends StatefulWidget {
  const ResponsiveLayoutPage({super.key});

  @override
  State<ResponsiveLayoutPage> createState() => _ResponsiveLayoutPageState();
}

class _ResponsiveLayoutPageState extends State<ResponsiveLayoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AspectRatioWiget(raito: '16 / 9'),
            AspectRatioWiget(raito: '3 / 2'),
          ],
        ),
      ),
    );
  }
}

class AspectRatioWiget extends StatelessWidget {
  final String raito;

  const AspectRatioWiget({super.key, required this.raito});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: Fraction.fromString(raito).toDouble() ,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          border: Border.all(color: Colors.white),
        ),
        padding: EdgeInsets.all(10),
        child: Center(child: Text('AspectRatio $raito')),
      ),
    );
  }
}
