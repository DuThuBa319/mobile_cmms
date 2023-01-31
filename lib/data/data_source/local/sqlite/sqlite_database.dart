import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

part 'impl/sqlite_database.impl.dart';

abstract class SQLiteDatabase {
  bool get isOpen;
  int get executingCount;
  Database get database;

  Future<Database?> create({OnDatabaseCreateFn? onCreate});

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
  });

  Future<int> insert(
    String table,
    Map<String, Object?> values, {
    String? nullColumnHack,
    ConflictAlgorithm? conflictAlgorithm,
  });

  Future<int> update(
    String table,
    Map<String, Object?> values, {
    String? where,
    List<Object?>? whereArgs,
    ConflictAlgorithm? conflictAlgorithm,
  });

  Future<int> delete(
    String table, {
    String? where,
    List<Object?>? whereArgs,
  });

  Future<T> execute<T>(
    Future<T> Function() executable, {
    Future<void> Function()? create,
  });

  Future<void> close();
}
