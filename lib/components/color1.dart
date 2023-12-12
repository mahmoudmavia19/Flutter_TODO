import 'package:flutter/material.dart';

class ColorAdd extends StatefulWidget {
  ColorAdd({super.key, required this.isRed});
  var isRed;

  @override
  State<ColorAdd> createState() => _ColorAddState();
}

class _ColorAddState extends State<ColorAdd> {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: 50.0,
        backgroundColor: widget.isRed == 'red' ? Colors.red : Colors.blue,
        // child: Icon(Icons.mic),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          MaterialButton(
            onPressed: () {
              widget.isRed=='red' ? widget.isRed='blue' : widget.isRed='red';
              setState(() {});
            },
            child: Text(
              '${widget.isRed}', style: const TextStyle(fontSize: 20.0, color: Colors.white),
            ),

            // Text('red',style: TextStyle(fontSize: 20.0 ,color: Colors.white),),
          )
        ]));

    //InkWell
  }
}
