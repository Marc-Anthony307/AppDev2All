import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'person.dart';

class DatabaseHelper {
  static final _databaseName = "myDatabase.db";
  static final _databaseVersion = 1;

  static final table = 'person_table';

  static final columnId = 'id';
  static final columnFirstName = 'firstName';
  static final columnLastName = 'lastName';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table (
        $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnFirstName TEXT NOT NULL,
        $columnLastName TEXT NOT NULL
      )
    ''');
  }

  Future<int> insert(Person person) async {
    Database db = await database;
    return await db.insert(table, person.toMap());
  }

  Future<List<Person>> queryAll() async {
    Database db = await database;
    var res = await db.query(table);
    List<Person> list =
    res.isNotEmpty ? res.map((c) => Person.fromMap(c)).toList() : [];
    return list;
  }

  Future<int> update(Person person) async {
    Database db = await database;
    return await db.update(table, person.toMap(),
        where: '$columnId = ?', whereArgs: [person.id]);
  }

  Future<int> delete(int id) async {
    Database db = await database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }
}
