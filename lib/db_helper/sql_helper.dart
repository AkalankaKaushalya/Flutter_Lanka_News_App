import 'package:global_news_app/model/news_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('news.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE news_tb (
        title TEXT PRIMARY KEY,
        description TEXT,
        urlToImage TEXT,
        author TEXT,
        publishedAt TEXT,
        content TEXT
      )
    ''');
  }

  Future<void> insertNote(News news) async {
    final db = await instance.database;
    await db.insert(
      'news_tb',
      news.toMapp(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<News>> getAllNews() async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query('news_tb');
    return List.generate(maps.length, (i) {
      return News.fromMapp(maps[i]);
    });
  }

  Future<void> deleteNews(String title) async {
    final db = await instance.database;
    await db.delete(
      'news_tb',
      where: 'title = ?',
      whereArgs: [title],
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
