part of '../sqlite_database.dart';

@Singleton(as: SQLiteDatabase)
class SQLiteDatabaseImpl extends SQLiteDatabase {
  //Version shouble be updated when database structure changed
  int get version => 1;
  String get name => 'daikin_warehouse.db';

  late Database _db;

  SQLiteDatabaseImpl();

  @override
  Future<Database?> create({OnDatabaseCreateFn? onCreate}) async {
    if (!_isOpen) {
      final databasesPath = await getDatabasesPath();
      final path = '$databasesPath/$name';
      return _db = await openDatabase(
        path,
        version: version,
        onCreate: (Database db, int version) async {
          _isOpen = true;
          await onCreate?.call(db, version);
        },
        onConfigure: (Database db) async {
          await db.execute('PRAGMA foreign_keys = ON');
        },
        onUpgrade: (db, oldVersion, newVersion) async {
          //TODO: handle upgrade database version
          // await db.execute(
          //   'DROP TABLE IF EXISTS ${SqliteTable.scanModel.name}',
          // );
        },
        onDowngrade: (db, oldVersion, newVersion) async {
          //TODO: handle downgrade database version
          // await db.execute(
          //   'DROP TABLE IF EXISTS ${SqliteTable.scanModel.name}',
          // );
        },
      );
    }
    return _db;
  }

  @override
  Future<void> close() async {
    if (isOpen && executingCount == 0) {
      _isOpen = false;
      await _db.close();
    }
  }

  @override
  Database get database => _db;

  @override
  bool get isOpen => _isOpen;

  var _isOpen = false;

  @override
  int get executingCount => _executingCount;

  var _executingCount = 0;

  @override
  Future<T> execute<T>(
    Future<T> Function() executable, {
    Future<void> Function()? create,
  }) async {
    await create?.call();

    _executingCount++;
    final result = await executable();
    _executingCount--;

    await close();

    return result;
  }

  @override
  Future<List<Map<String, Object?>>> query(
    String table, {
    bool? distinct,
    List<String>? columns,
    String? where,
    List<Object?>? whereArgs,
    String? groupBy,
    String? having,
    String? orderBy,
    int? limit,
    int? offset,
  }) {
    return database.query(
      table,
      distinct: distinct,
      columns: columns,
      where: where,
      whereArgs: whereArgs,
      groupBy: groupBy,
      having: having,
      orderBy: orderBy,
      limit: limit,
      offset: offset,
    );
  }

  @override
  Future<int> delete(String table, {String? where, List<Object?>? whereArgs}) {
    return database.delete(table, where: where, whereArgs: whereArgs);
  }

  @override
  Future<int> insert(
    String table,
    Map<String, Object?> values, {
    String? nullColumnHack,
    ConflictAlgorithm? conflictAlgorithm,
  }) {
    return database.insert(
      table,
      values,
      nullColumnHack: nullColumnHack,
      conflictAlgorithm: conflictAlgorithm,
    );
  }

  @override
  Future<int> update(
    String table,
    Map<String, Object?> values, {
    String? where,
    List<Object?>? whereArgs,
    ConflictAlgorithm? conflictAlgorithm,
  }) {
    return database.update(
      table,
      values,
      where: where,
      whereArgs: whereArgs,
      conflictAlgorithm: conflictAlgorithm,
    );
  }
}
