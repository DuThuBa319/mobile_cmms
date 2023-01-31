enum SqliteTable {
  devicePart,
}

extension SqliteTableExt on SqliteTable {
  String get name {
    switch (this) {
      case SqliteTable.devicePart:
        return 'DevicePart';
    }
  }
}
