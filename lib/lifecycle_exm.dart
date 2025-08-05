import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LifeCycleExm extends StatefulWidget {
  const LifeCycleExm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LifeCycleExmState createState() => _LifeCycleExmState();
}

class _LifeCycleExmState extends State<LifeCycleExm>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _incrementCounter();
    print('initState'); // dễ thấy hơn

  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (kDebugMode) {
      print('AppLifecycleState: $state');
    }
  }

  @override
  void dispose() {
    if (kDebugMode) {
      print('❎ dispose');
    }
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void deactivate() {
    if (kDebugMode) {
      print("🗑️ deactivate");
    }
    super.deactivate();
  }

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print("build");
    }
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Widget Lifecycle")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times:'),

            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 8.0),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
