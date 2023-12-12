import 'package:flutter/material.dart';

class RecordScreen extends StatelessWidget {
  const RecordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('refresh');
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Vocalis'),
            Text(' Health',style: TextStyle(color: Colors.blue),)
          ],
        ) ,
      ),
      body: const SizedBox(
        width: double.infinity,
        child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('click The Button to',style: TextStyle(fontSize: 25.0),),
              Text('record your Voice',style: TextStyle(fontSize: 25.0),),
              Text('Count from 50 to 70',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0),),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.video_call,color: Colors.blue,size: 25.0,),
                    Text('Play example',style: TextStyle(color: Colors.blue,fontSize: 25.0),)
                  ]
              ),
              SizedBox(height: 20.0,),
              CircleAvatar(
                radius: 50.0,
                backgroundColor: Colors.blue,
                // child: Icon(Icons.mic),
                child:  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.mic,color: Colors.white,),
                      Text('Record',style: TextStyle(fontSize: 20.0 ,color: Colors.white),),
                    ]
                ) ,
              ),
              SizedBox(height: 20.0,),

              Text('Press button record and Press',style: TextStyle(fontSize: 20.0),),
              Text('again when You ara Done',style: TextStyle(fontSize: 20.0),),
            ]
        ),
      ),
    );
  }
}
