import 'package:flutter/material.dart';

import '../components/counter1.dart';

class VideoScreen extends StatelessWidget {
  VideoScreen({super.key});

  int count = 0;

  int count2 = 0;

  @override
  Widget build(BuildContext context) {
    print('refresh');
    return Scaffold(
      body: Center(
          child: DefaultTextStyle(
        style: const TextStyle(fontSize: 25.0, color: Colors.black),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Counter(count: count,number: 1),
          Counter(count: count,number: 2),
          Counter(count: count,number: 3),
          ],
        ),
      )),
    );
  }
}
