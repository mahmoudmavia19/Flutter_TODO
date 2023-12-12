import 'dart:async';
import 'package:sqflite/sqflite.dart';

import '../../models/task.dart';
import '../../utils/endpoints.dart';

abstract class LocalDataSource {
  Future<Database>  initLocalDataBase();
  Future<void> insertTask(Task task);
  Future<void> editTask(Task task);
  deleteTask(taskId);
 Future<List<Task>> getTask();
}

class ImplLocalDataBase implements LocalDataSource {

   Database? _database ;

  @override
  Future<Database> initLocalDataBase() async{
    if(_database !=null) return _database!;
    _database = await openDatabase('${await getDatabasesPath()}/todo.db',version: 1,onCreate: _onCreate);
    return _database! ;
  }


   FutureOr<void> _onCreate(Database db, int version) async{
     await db.execute('''
      CREATE TABLE Task (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        subTitle TEXT,
        isChecked BOOLEAN,
        dateTime TEXT
      )
    ''');
   }
  @override
    deleteTask(taskId) async{
     await _database?.delete(TableEndpoints.tTask,where:'id= $taskId',);
  }

  @override
  Future<void> editTask(Task task) async{
    await _database?.update(
    TableEndpoints.tTask,
    task.toJson(),
    where: 'id = ?',
    whereArgs: [task.id],
    );
  }


  @override
  Future<void> insertTask(Task task) async{
     await _database?.insert(TableEndpoints.tTask,task.toJson());
  }

  @override
  Future<List<Task>> getTask() async{
 /*   List<Task> _tasks = [];
     var response =  await _database?.query(TableEndpoints.tTask,orderBy: 'dateTime');
     for(var item in response!){
       _tasks.add(Task.fromJson(item));
     }
     return _tasks; */

     return (await _database?.query(TableEndpoints.tTask,orderBy: 'dateTime'))
         !.map((e) => Task.fromJson(e)).toList();

  }


}