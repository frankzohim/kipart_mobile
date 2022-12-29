import 'package:ki_part/data/models/users.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// ignore_for_file: no_leading_underscores_for_local_identifiers, prefer_conditional_assignment, unnecessary_null_comparison

class DataBaseHelper {
  Future<Database> database() async {
    return openDatabase(
      join(await getDatabasesPath(), 'ki_part.db'),
      onCreate: (db, version) async {
        // Run the CREATE TABLE statement on the database.
        await db.execute(
            '''CREATE TABLE users_info(id INTEGER PRIMARY KEY , name TEXT, email TEXT phone_number TEXT, password TEXT , token TEXT )''');
      },
      version: 1,
    );
  }

// Define a function that inserts Todo into the database
  Future<void> insertUser(UserModel user) async {
    Database _db = await database();

    await _db.insert(
      'users_info',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<String> getTheName() async {
    Database _db = await database();
    List<Map<String, dynamic>> value =
        await _db.rawQuery("SELECT name FROM users_info WHERE id=1");
    Map<String, dynamic> theNew = value[0];

    return theNew[1].toString();
  }

  Future<List<UserModel>> getUserInfo() async {
    Database _db = await database();
    List<Map<String, dynamic>> userMap = await _db.query('users_info');

    return List.generate(userMap.length, (index) {
      return UserModel(
          name: userMap[index]['name'],
          email: userMap[index]['email'],
          phoneNumber: userMap[index]['phone_number'],
          password: userMap[index]['password'],
          token: userMap[index]['token']);
    });
  }

  Future<List<UserModel>> getStudent() async {
    Database _db = await database();
    List<Map> maps = await _db
        .query('users_info', columns: ['id', 'name', 'email', 'token']);
    List<UserModel> usersInfo = [];
    for (int i = 0; i < maps.length; i++) {
      usersInfo.add(UserModel.fromMap(maps[i]));
    }
    return usersInfo;
  }

// Future<List<Task>> getTaskArchive() async{
//   Database _db  = await database();

//   List<Map<String,dynamic>> taskMap = await _db.query('tasks',where: "status=1");
//   return List.generate(taskMap.length, (index) {
//     return Task( id: taskMap[index]['id'], title:taskMap[index]['title'] , total: taskMap[index]['total'],status: taskMap[index]['status']);
//   });
// }

// Future<void> updateTaskTitle(int id , String title) async{
//   Database _db = await database() ;
//   print("Le nouveau title: $title");
//   await _db.rawUpdate("UPDATE tasks SET title='$title 'where id = '$id'");

// }

// Future<void> deleteTask(int id ) async{
//   Database _db = await database() ;
//   await _db.rawDelete("DELETE FROM  tasks  WHERE id = '$id'");
//   await _db.rawDelete("DELETE FROM  todo  WHERE taskId = '$id'");
// }

}
