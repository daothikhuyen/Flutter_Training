import 'package:flutter/material.dart';
import 'package:flutter_practice/lifecycle_exm.dart';

class SwitchLifecycle extends StatefulWidget {
  const SwitchLifecycle({super.key});

  @override
  State<SwitchLifecycle> createState() => _SwitchLifecycleState();
}

class _SwitchLifecycleState extends State<SwitchLifecycle> {

  bool isShow = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if(isShow) Expanded(child: const LifeCycleExm()),
          SizedBox(height: 16,),
          ElevatedButton(onPressed: () {
           setState(() {
              isShow = !isShow;
           });
          }, child: Text(isShow ? 'Show LifeCyvleExam': 'Close LifeCycleExm'))
        ],
      ),
    );
  }
}