import 'dart:async';
import 'dart:convert';

import 'package:injectable/injectable.dart';

import '../../../../../domain/entities/stock.entity.dart';
import '../data_access_object.dart';
import '../sqlite_dao.dart';

@Singleton()
class StockDAO extends DAO {
  DataColumn get skuClm => DataColumn(name: 'sku', type: DataType.text);
  DataColumn get rawDataClm => DataColumn(
        name: 'raw_data',
        type: DataType.text,
      );

  final StreamController<List<Stock>> _devicesStreamController =
      StreamController.broadcast();

  Stream<List<Stock>> get devicesStream => _devicesStreamController.stream;

  @override
  String get tableName => SqliteTable.devicePart.name;

  @override
  List<DataColumn> get columns => [skuClm, rawDataClm];

  Future<List<Stock>> getDevices({String? sku}) {
    return execute<List<Stock>>(() async {
      final maps = await db.query(
        tableName,
        columns: columnsWhere,
        where: sku == null ? null : '${skuClm.name} = ?',
        whereArgs: sku == null ? null : [sku],
      );

      if (maps.isEmpty) {
        return [];
      }

      return maps.map(toObject).toList();
    });
  }

  Future<bool> insertOrUpdate(
    Stock device,
  ) async {
    return execute<bool>(() async {
      //This code block use for preventing from replacing existed data
      final listDevices = await getDevices();
      if (listDevices.any((element) => element.sku == device.sku)) {
        return false;
      }

      if (device.sku != null) {
        await delele(device.sku!);
      }

      final result = await db.insert(
        tableName,
        toMap(
          device,
        ),
      );

      _devicesStreamController.add(await getDevices());
      return result > 0;
    });
  }

  Future<bool> delele(String sku) {
    return execute<bool>(() async {
      final result = await db.delete(
        tableName,
        where: '${skuClm.name} = ?',
        whereArgs: [sku],
      );

      _devicesStreamController.sink.add(await getDevices());
      return result > 0;
    });
  }

  Future<bool> clear() {
    return execute<bool>(() async {
      final result = await db.delete(tableName);

      _devicesStreamController.sink.add(await getDevices());
      return result > 0;
    });
  }

  Map<String, Object?> toMap(
    Stock value,
  ) {
    return <String, Object?>{
      skuClm.name: value.sku,
      rawDataClm.name: jsonEncode(value.toJson()),
    };
  }

  Stock toObject(Map<String, Object?> data) {
    return Stock.fromJson(
      jsonDecode(data[rawDataClm.name]?.toString() ?? '{}'),
    );
  }
}
