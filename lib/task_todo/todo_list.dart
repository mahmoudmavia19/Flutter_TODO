import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:mycourse/components/add_dialog.dart';
import 'package:mycourse/components/dialog_confrim.dart';
import 'package:mycourse/models/user.dart';
import 'package:mycourse/utils/app_assets.dart';
import 'package:mycourse/utils/notifi_service.dart';
import '../date/local_date_source/local_data_source.dart';
import '../models/task.dart';

class ToDoList extends StatefulWidget {
    ToDoList({super.key,required this.user});
    User? user;
  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  List<Task> _todoList = [];
  final LocalDataSource _dataSource = ImplLocalDataBase();
  bool _loading = true;
  _bind() async {
    _loading= true;
    setState(() {

    });
    await _dataSource.initLocalDataBase();
    _todoList = await _dataSource.getTask();
    _loading= false;
    setState(() {
    });
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Center(
            child: Text(
          'Todo  ${widget.user!.name}',
          style: const TextStyle(color: Colors.blue),
        )),
      ),
      body:_loading? _loadingBuilder():_todoList.isEmpty?_emptyBuilder()  : _todoBuilder() ,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
                 return TaskDialog(onPressed: (Task? newTask) {
                   _todoList.add(newTask!);
                   _dataSource.insertTask(newTask);
                   NotificationService().scheduleNotification(
                       id: newTask.id!,
                       title:newTask.title ,
                       body: newTask.subtitle,
                       scheduledNotificationDateTime: newTask.date!) ;
                   _todoList.sort((a, b) => a.date!.compareTo(b.date!),);
                   setState(() {});
                   Navigator.pop(context);
                 },task: Task(title: null, date: null , subtitle: null, isChecked: false),);
            },
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
  _loadingBuilder()=>Center(child: Lottie.asset(AppAssets.loading));
  _emptyBuilder()=>Center(child: Lottie.asset(AppAssets.emptyList));
  _todoBuilder()=>RefreshIndicator(
    onRefresh: () async{
      _bind();
    },
    child: SingleChildScrollView(
       child: Column(
        children: [
          DefaultTextStyle(
            style: const TextStyle(color: Colors.white,fontSize: 18.0),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.blueAccent,
              ),
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.person),const SizedBox(width: 10.0,),
                      const Text('Name : '), const SizedBox(width: 10.0,),
                      Text(widget.user!.name.toString()),
                    ],
                  ),
                  const SizedBox(height: 10.0,),
                  Row(
                    children: [
                      const Icon(Icons.email),const SizedBox(width: 10.0,),
                      const Text('Email : '), const SizedBox(width: 10.0,),
                      Expanded(child: Text('${widget.user!.email}asdasd',)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      color: Colors.black26,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 250.0,
                                child: ListTile(
                                  title: Text(
                                    _todoList[index].title!,
                                    style: const TextStyle(
                                        color: Colors.blueAccent, fontSize: 20.0),
                                  ),
                                  subtitle: Row(
                                    children: [
                                      Text(DateFormat.yMMMd()
                                          .format(_todoList[index].date!)),
                                      const SizedBox(width: 10.0,),
                                      Text('${_todoList[index].date!.hour}:${_todoList[index].date!.minute}')
                                    ],
                                  ),
                                  trailing:
                                  //----------------------------------------------
                                  IconButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return DialogConfirm(
                                              message:  'Are You Sure  ?',
                                              btnName: 'delete',
                                              onPressed:  () {
                                                _dataSource.deleteTask(
                                                    _todoList[index]
                                                        .id);
                                                _todoList
                                                    .removeAt(index);
                                                NotificationService().showNotification(id: 1,title: 'Note',body: 'Item is Deleted');
                                                Navigator.pop(context);
                                                setState(() {});
                                              });
                                        },
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.remove_circle,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return  TaskDialog(onPressed: (Task? newTask) {
                                          newTask!.id =_todoList[index].id;
                                          _todoList[index] = newTask;
                                          _dataSource.editTask(
                                              _todoList[index]);
                                          NotificationService().scheduleNotification(
                                              id: newTask.id!,
                                              title:newTask.title ,
                                              body: newTask.subtitle,
                                              scheduledNotificationDateTime: newTask.date!) ;                                  _todoList.sort((a, b) => a.date!.compareTo(b.date!),);
                                          setState(() {});
                                          Navigator.pop(context);
                                        }, task: _todoList[index],);
                                      },
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.edit_square,
                                    color: Colors.blue,
                                  )),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                value: _todoList[index].isChecked,
                                onChanged: (value) {
                                  setState(() {
                                    _todoList[index].isChecked = value!;
                                    _dataSource.editTask(_todoList[index]);
                                    //print(_todoList[index].isChecked);
                                  });
                                },
                              ),
                              Text(
                                _todoList[index].subtitle!,
                                style: const TextStyle(
                                    color: Colors.blueAccent, fontSize: 20.0),
                              ),
                            ],
                          )
                        ],
                      ),
                    ));
              },
              itemCount: _todoList.length),
        ],
           ),
    ),
  ) ;
}
