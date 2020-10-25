import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart';

class DBProvider {
    DBProvider._();

    static DBProvider instance = DBProvider._();
    
    static final dbName = "fruits.db";
    static final tableName = "Fruits";

    static Database _db;
    Future<Database> get database async {
    if (_db != null) {
      print("Opening Database");
      return _db;}

    _db = await initDb();
    print("Starting intDB()");
    return _db;
    }

    initDb() async {
      Directory databasesPath = await getApplicationDocumentsDirectory();
      var path = join(databasesPath.path,dbName);

      //await deleteDatabase(path);

    // Create the writable database file from the bundled demo database file:
    ByteData data = await rootBundle.load(join("assets", "fruits.db"));
    List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    await new File(path).writeAsBytes(bytes, flush: true);
      
      return await openDatabase(path, readOnly: true);
    }

    Future<List<Map<String, dynamic>>> queryAll() async {
      Database db = await instance.database;
      List listResults =  await db.query(tableName);
      return listResults.toList();
    }
}
 



