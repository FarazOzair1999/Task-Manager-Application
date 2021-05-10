import 'package:taskmanagerapp/repositories/database_connection.dart';
import 'package:sqflite/sqflite.dart';
class Repository{
  DatabaseConnection _databaseConnection;

  Repository(){
    //initialize database connection
    _databaseConnection = DatabaseConnection();
  }

  static Database _database;
  Future<Database> get database async{
    if(_database!=null) return _database;
    _database=await _databaseConnection.setDatabase();
    return _database;
  }
  //insert data to Table
  insertData(table,data) async{
    var connection=await database;
    return await connection.insert(table, data);
  }
  readData(table) async{
    var connection=await database;
    return await connection.query(table);
  }

  readDataById(table,itemId) async {
  var connection=await database;
  return await connection.query(table,where: 'id=?',whereArgs: [itemId]);
  }

  updateData(table, data) async {
  var connection=await database;
  return await connection.update(table, data,where: "id=?", whereArgs: [data['id']]);
  }

}