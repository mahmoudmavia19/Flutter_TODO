import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
    Counter({super.key,required this.count, required this.number});
  int count ;
  int number ;
  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  Widget build(BuildContext context) {
    print('refresh ${widget.number}');
     return Column(
      children: [
        Text('counter ${widget.number} '),
        Text('${widget.count}'),
        MaterialButton(onPressed: (){
          widget.count++ ;
          setState(() {

          });
        },
        child:  Text('Add ${widget.number}',style: const TextStyle(fontSize: 20.0,color: Colors.red),),)
      ],
    );
  }

}
