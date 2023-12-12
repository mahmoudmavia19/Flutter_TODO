import 'package:flutter/material.dart';
import 'package:mycourse/models/task.dart';

class TaskDialog extends StatelessWidget {
    TaskDialog({super.key ,required this.task ,required this.onPressed});
    Task task ;
    ValueChanged<Task?>? onPressed;
    final GlobalKey<FormState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _key,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                initialValue: task.title,
                validator: (value) {
                  if(value!.isEmpty){
                    return 'Please enter title';
                  }
                  else if(task.date==null){
                    return 'Please Select Date';
                  }
                },
                decoration: InputDecoration(
                    prefixIcon: IconButton(
                        onPressed: () {
                          showDatePicker(
                            context: context,
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2024),
                            currentDate:task.date?? DateTime.now()
                                .add(const Duration(days: 1)),
                          ).then((value) {
                             task.date =  value;
                            showTimePicker(context: context, initialTime: TimeOfDay.now()).then((value){
                               task.date = task.date?.add(Duration(hours:value!.hour , minutes:value.minute)) ;
                            });
                          });
                        },
                        icon: const Icon(Icons.date_range)),
                    hintText: 'Enter New Task'),
                onChanged: (value) {
                  task.title = value;
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextFormField(
                initialValue: task.subtitle,
                validator: (value) {
                  if(value!.isEmpty){
                    return 'Please enter subtitle';
                  }
                },
                decoration:
                const InputDecoration(hintText: 'Enter SubTask'),
                onChanged: (value) {
                  task.subtitle = value;
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed:(){
                        if(_key.currentState!.validate()){
                          onPressed!.call(task);
                        }
                      },
                      child: const Text('Add')),
                  const SizedBox(
                    width: 10.0,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('cancel')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


