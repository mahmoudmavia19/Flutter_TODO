import 'package:flutter/material.dart';

class DialogConfirm extends StatelessWidget {
    DialogConfirm({super.key,required this.message,required this.btnName,required this.onPressed});
  String message ;
  String btnName ;
   void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return  Dialog(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment:
          MainAxisAlignment.center,
          children: [
              Center(
                child: Text(
                  message,
                  style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight:
                      FontWeight.bold),
                )),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment:
              MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed:onPressed,
                    child:
                      Text(btnName)),
                const SizedBox(
                  width: 30.0,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pop();
                    },
                    child:
                    const Text('cancel'))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
