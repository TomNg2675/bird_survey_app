import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../model/survey.dart';

class SurveyListDb {
  static final SurveyListDb instance = SurveyListDb._init();

  static Database? _database;

  SurveyListDb._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('survey.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const integerType = 'INTEGER NOT NULL';
    const blob = 'BLOB';

    await db.execute('''
CREATE TABLE $tableSurveys ( 
  ${SurveyFields.id} $idType, 
  ${SurveyFields.birdID} $integerType,
  ${SurveyFields.long} $textType,
  ${SurveyFields.lat} $textType,
  ${SurveyFields.recordTime} $textType,
  ${SurveyFields.image} $blob,
  ${SurveyFields.video} $blob,
  ${SurveyFields.birdStatus} $textType,
  ${SurveyFields.birdActivity} $textType,
  ${SurveyFields.count} $integerType
  )
''');
  }

  Future<Survey> create(Survey survey) async {
    final db = await instance.database;

    // final json = note.toJson();
    // final columns =
    //     '${NoteFields.title}, ${NoteFields.description}, ${NoteFields.time}';
    // final values =
    //     '${json[NoteFields.title]}, ${json[NoteFields.description]}, ${json[NoteFields.time]}';
    // final id = await db
    //     .rawInsert('INSERT INTO table_name ($columns) VALUES ($values)');

    final id = await db.insert(tableSurveys, survey.toJson());
    return survey.copy(id: id);
  }

  Future<Survey> readSurvey(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableSurveys,
      columns: SurveyFields.values,
      where: '${SurveyFields.id} = ?', //prevent SQL injection
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Survey.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Survey>> readAllSurveys() async {
    final db = await instance.database;

    const orderBy = '${SurveyFields.recordTime} ASC';
    // final result =
    //     await db.rawQuery('SELECT * FROM $tableNotes ORDER BY $orderBy');

    final result = await db.query(tableSurveys, orderBy: orderBy);

    return result.map((json) => Survey.fromJson(json)).toList();
  }

  Future<int> update(Survey survey) async {
    final db = await instance.database;

    return db.update(
      tableSurveys,
      survey.toJson(),
      where: '${SurveyFields.id} = ?',
      whereArgs: [survey.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableSurveys,
      where: '${SurveyFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
