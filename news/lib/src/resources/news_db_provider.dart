import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'dart:async';
import 'repository.dart';
import '../models/item_model.dart';

class NewsDbProvider implements Source{
  Database db;
  
  void init() async{
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
    Future<ItemModel> fetchItem(int id) async{
      final maps = await db.query(
        "Items",
        columns: null,
        where: "id = ?",
        whereArgs: [id],
      );
      if (maps.length > 0){
        return ItemModel.fromDb(maps.first);
      }
      return null;
    }

  Future<int> addItem(ItemModel item) {
    return db.insert("Items", item.toMapForDb());
  }

  // Todo -- Store and fetch top ids
  Future<List<int>> fetchTopIds(){
    return null;
  }

}