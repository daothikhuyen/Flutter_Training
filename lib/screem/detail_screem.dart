import 'package:flutter/material.dart';

class DetailScreem extends StatefulWidget {
  const DetailScreem({super.key});

  @override
  State<DetailScreem> createState() => _DetailScreemState();
}

class _DetailScreemState extends State<DetailScreem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Hero(tag: 'imageHero',child: Image.network('https://picsum.photos/250?image=9'),),
        ),
      ),
    );
  }
}