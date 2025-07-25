import 'package:flutter/material.dart';
import 'package:flutter_practice/screem/pass_arguments_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class Navigation_Routing extends StatefulWidget {
  const Navigation_Routing({super.key});

  @override
  State<Navigation_Routing> createState() => _Navigation_RoutingState();
}

class _Navigation_RoutingState extends State<Navigation_Routing> {
  Widget _buildDecoratedImage(String namePic) => Expanded(
    child: GestureDetector(
      onTap: () async {
        final result = await Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) =>
                    PassArgumentsScreen(title: 'Shop Cat', message: namePic),
          ),
        );

        if (result != null) {
          ScaffoldMessenger.of(context)
            ..removeCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text('$result')));
        }
      },

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF060606),
        toolbarHeight: 76,
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              'Navigation _ Routing',
              style: GoogleFonts.grandHotel().copyWith(
                fontSize: 40,
                fontWeight: FontWeight.w600,
                color: Colors.redAccent,
              ),
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
