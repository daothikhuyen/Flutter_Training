import 'package:flutter/material.dart';

class PassArgumentsScreen extends StatelessWidget {
  // static const routeName = '/passArguments';

  final String title;
  final String message;
  const PassArgumentsScreen({
    super.key,
    required this.title,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Column(
        children: [
          Center(child: Text('This is cat number $message')),
          SizedBox(height: 10,),
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 5, color: Colors.black12),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            margin: const EdgeInsets.all(4),
            child: Image.asset('assets/images/$message'),
          ),
          SizedBox(height: 10,),
          ElevatedButton(onPressed: (){
            Navigator.pop(context, 'Go Back Shop Cat');
          }, child: Text('Go back'))
        ],
      ),
    );
  }
}
