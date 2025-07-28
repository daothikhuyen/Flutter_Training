import 'dart:ui';

import 'package:flutter/material.dart';

class RootPage extends StatelessWidget {
  final int tabIndex;

  const RootPage({super.key, required this.tabIndex});

  @override
  Widget build(BuildContext context) {
    final color = Colors.primaries[tabIndex];

    Widget _buildIconImage(String namePic) => Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PhysicalModel(
          color: Colors.white,
          elevation: 6,
          borderRadius: BorderRadius.circular(12),
          clipBehavior: Clip.antiAlias,
          child: Container(
            width: 24,
            height: 24,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset('assets/images/$namePic', fit: BoxFit.cover),
            ),
          ),
        ),
      ),
    );

    Widget _buildDecoratedImage(String namePic) => Expanded(
      child: PhysicalModel(
        color: Colors.transparent,
        // elevation: 2,
        borderRadius: BorderRadius.circular(12),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 5, color: Colors.black12),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              margin: const EdgeInsets.all(4),
              child: Image.asset('assets/images/$namePic'),
            ),
            Positioned(
              bottom: 9.0,
              right: 9.0,
              child: Text(
                'Cat: 30USD',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                  backgroundColor: Colors.black45,
                  fontFamily: 'Courier',
                ),
              ),
            ),
          ],
        ),
      ),
    );

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
            flex: 2,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Expanded(
                  child: Image.asset(
                    'assets/images/lake.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaY: 2, sigmaX: 2),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Lake Burj Khalifa',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Column(
              children: [
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildIconImage('cat_three.jpg'),
                    _buildIconImage('cat_two.jpg'),
                    _buildIconImage('cat_one.jpg'),
                    _buildIconImage('cat_one.jpg'),
                    _buildIconImage('cat_one.jpg'),
                  ],
                ),

                GridView.count(
                  crossAxisCount: 3,
                  shrinkWrap: true, //height stretch
                  children: [
                    _buildDecoratedImage('cat_three.jpg'),
                    _buildDecoratedImage('cat_two.jpg'),
                    _buildDecoratedImage('cat_three.jpg'),
                    _buildDecoratedImage('cat_one.jpg'),
                    _buildDecoratedImage('cat_three.jpg'),
                    _buildDecoratedImage('cat_two.jpg'),
                    _buildDecoratedImage('cat_two.jpg'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
