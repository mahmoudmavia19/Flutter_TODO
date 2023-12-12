import 'package:flutter/material.dart';

class CountAdd extends StatefulWidget {
   CountAdd({super.key,required this.count});

int count;
  @override
  State<CountAdd> createState() => _CountAddState();
}

class _CountAddState extends State<CountAdd> {
  @override
  Widget build(BuildContext context) {
    return   CircleAvatar(
      radius: 50.0,
      backgroundColor: Colors.green,
      // child: Icon(Icons.mic),
      child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(onPressed:() {
              widget.count++;
              setState(() {

              });
            },
              child:Text('${widget.count}',style: TextStyle(fontSize: 20.0 ,color: Colors.white),),

            )
          ]
      ) ,
    );
  }
}
