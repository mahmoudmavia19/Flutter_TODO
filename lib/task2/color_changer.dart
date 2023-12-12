import 'package:flutter/material.dart';

import '../components/color1.dart';
import '../components/counter.dart';

class ColorChanger extends StatelessWidget {
   ColorChanger({super.key});
   int count=0;
   var isRed='red';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Icon(Icons.arrow_back,color: Colors.green,),
        actions: const [
          Icon(Icons.list_outlined,color:Colors.green,)
        ],
        title: const Center(child: Text('task2',style: TextStyle(fontSize: 23.0,color: Colors.green),)),
      ),
      body:  SizedBox(
        width: double.infinity,
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ColorAdd(isRed:isRed),
            const SizedBox(height: 120.0,),
            CountAdd(count: count,)

            //InkWell
          ],
        ), //
      ),
    );
  }
}


