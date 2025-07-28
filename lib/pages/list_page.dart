import 'dart:async';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> with TickerProviderStateMixin {
  List<int> items = List<int>.generate(10, (int index) => index);
  late AnimationController controller;
  bool determinate = true;
  double opacity = 0;

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 1), () {
      setState(() {
        determinate = false;
        opacity = 1;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Page'),
        backgroundColor: Color(0xFFf0eddc),
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
          icon: Icon(Icons.arrow_back),
        ),
        actions: [],
      ),
      body: Container(
        color: Color(0xFFfffcf3),
        child: Column(
          children: [
            // if (determinate)
            //   LinearProgressIndicator(
            //     value: determinate ? controller.value : null,
            //     semanticsLabel: 'Linear progress indicator',
            //   ),

            Expanded(
              child: AnimatedOpacity(
                duration: const Duration(seconds: 2),
                opacity: opacity,
                child: ListView.builder(
                  itemCount: items.length,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  itemBuilder: (BuildContext context, int index) {
                    return Dismissible(
                      background: Container(color: Colors.green),
                      key: ValueKey<int>(items[index]),
                      onDismissed: (DismissDirection direction) {
                        setState(() {
                          items.removeAt(index);
                        });
                      },
                      child: SizedBox(
                        height: 80.0,
                        child: Card(
                          child: ListTile(
                            leading: FlutterLogo(size: 72.0),
                            title: Text('Three-line ListTile ${index}'),
                            subtitle: Text(
                              'A sufficiently long subtitle warrants three lines.',
                            ),
                            trailing: Icon(Icons.more_vert),
                            isThreeLine: true,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
