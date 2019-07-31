import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'dart:async';
import '../models/item_model.dart';

class NewsDbProvider {
  Database db;
  
  init() async{
    Directory documentsDirectory = await getApplicationDocumentsDirectory(); // creates new directory type variable
    final path = join(documentsDirectory.path,"items.db");
    db = await openDatabase(
      path, 
      version: 1,
      onCreate: (Database newDb, int version){//creates a new database if it doesn't exists already,if exists then path is passed
        newDb.execute("""          
        CREATE TABLE Items
        (
          id INTEGER PRIMARY KEY,
          type TEXT,
          by TEXT,
          time INTEGER,
          text TEXT,
          parent INTEGER,
          kids BLOB,
          dead INTEGER,
          deleted INTEGER,
          url TEXT,
          score INTEGER,
          title TEXT,
          descendants INTEGER 
        )
        """);
      }
    ); // initial setup for when user installs the app for the first time or restarts 
  }
}