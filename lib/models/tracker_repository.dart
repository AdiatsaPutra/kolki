part of 'models.dart';

class Repository {
  DatabaseConnection _databaseConnection;

  Repository() {
    //inisialisasiDbconnection
    _databaseConnection = DatabaseConnection();
  }

  static Database _database;
  //cek kalau databasenya ada apa ngga
  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await _databaseConnection.setDatabase();
    return _database;
  }

  //memasukkan data pada table
  insertData(table, data) async {
    var connection = await database;
    return await connection.insert(table, data);
  }

  //read data from table
  readData(table) async {
    var connection = await database;
    return await connection.query(table);
  }

  //read data from table by id
  readDataById(table, itemId) async {
    var connection = await database;
    return await connection.query(table, where: 'id=?', whereArgs: [itemId]);
  }

  //update data dari tabel
  updateData(table, data) async {
    var connection = await database;
    return await connection
        .update(table, data, where: 'id=?', whereArgs: [data['id']]);
  }

  deleteData(table, itemId) async {
    var connection = await database;
    return await connection.rawDelete('DELETE FROM $table WHERE id=$itemId');
  }

  //baca data dari column name
  readDataByColumn(table, columnName, columnValue) async {
    var connection = await database;
    return await connection
        .query(table, where: '$columnName=?', whereArgs: [columnValue]);
  }
}
