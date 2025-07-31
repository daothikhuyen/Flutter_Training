import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  // static const routeName = '/passArguments';

  final String title;
  final String? image;

  const DetailPage({super.key, required this.title, this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Picture $title'),
        backgroundColor: Color(0xFFf0eddc),
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
          icon: Icon(Icons.arrow_back),
        ),
        actions: [],
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 5, color: Colors.black12),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              margin: const EdgeInsets.all(4),
              child: Image.asset(
                image ?? 'assets/images/lake.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context, 'Go Back Shop Cat');
            },
            child: Text('Go back'),
          ),
        ],
      ),
    );
  }
}
