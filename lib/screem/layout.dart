import 'package:flutter/material.dart';

class Layouts extends StatefulWidget {
  const Layouts({super.key});

  @override
  State<Layouts> createState() => _LayoutsState();
}

class _LayoutsState extends State<Layouts> {
  Widget _buildDecoratedImage(String namePic) => Expanded(
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
              fontFamily: 'Courier'
            ),
          ),
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: const Color(0xFF060606),
        toolbarHeight: 76,
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              'MeMe Cat',
              style: TextTheme.of(context).displaySmall?.copyWith(
                color: Color(0xFFE95555),
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
                height: 1.0,
                letterSpacing: 0,
              )
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        // color: Colors.grey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: Image.asset('assets/images/cat_one.jpg')),
                Expanded(
                  flex: 2,
                  child: Image.asset('assets/images/cat_three.jpg'),
                ),
                Expanded(child: Image.asset('assets/images/cat_two.jpg')),
              ],
            ),
            Row(
              mainAxisSize:
                  MainAxisSize
                      .min, // take up just enough space to contain or call it combined
              children: [
                Icon(Icons.star, color: Colors.yellow[500]),
                Icon(Icons.star, color: Colors.yellow[500]),
                Icon(Icons.star, color: Colors.yellow[500]),
                const Icon(Icons.star, color: Colors.white),
                const Icon(Icons.star, color: Colors.white),
              ],
            ),

            SizedBox(height: 10.0),
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
    );
  }
}
