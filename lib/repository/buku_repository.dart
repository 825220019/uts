import 'package:sqflite/sqflite.dart';
import 'package:uts/database/database_connection.dart';
import 'package:uts/model/book_model.dart';

class BukuRepository {
  late DatabaseConnection _databaseConnection;

  BukuRepository() {
    _databaseConnection = DatabaseConnection.instance;
    print(_databaseConnection);
  }

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await _databaseConnection.setDatabase();
      return _database;
    }
  }

  // Insert Buku
  Future<int> insertBuku(Buku buku) async {
    var connection = await database;
    print(buku.toJson());
    return await connection!.insert('buku', buku.toJson());
  }

  // Get all Buku
  Future<List<Buku>> getAllBuku() async {
    var connection = await database;
    final List<Map<String, dynamic>> result = await connection!.query('buku');
    print(result);
    return result.map((json) => Buku.fromJson(json)).toList();
  }

  // Get Buku by ID
  Future<Buku?> getBukuById(int id) async {
    var connection = await database;
    final List<Map<String, dynamic>> result = await connection!.query(
      'buku',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (result.isNotEmpty) {
      return Buku.fromJson(result.first);
    } else {
      return null;
    }
  }

  // Update Buku
  Future<int> updateBuku(Buku buku) async {
    var connection = await database;
    print("id buku : " + buku.id.toString());
    print(buku.toJson());
    return await connection!.update(
      'buku',
      buku.toJson(),
      where: 'id = ?',
      whereArgs: [buku.id],
    );
  }

  Future<List<Buku>> getBukuByIsRecommended(int isRecommended) async {
    var connection = await database;
    final List<Map<String, dynamic>> result = await connection!.query(
      'buku',
      where: 'is_recommended = ?',
      whereArgs: [isRecommended],
    );
    print("Buku dengan is_recommended = $isRecommended: $result");
    return result.map((json) => Buku.fromJson(json)).toList();
  }

// Get Buku by trendingBook
  Future<List<Buku>> getBukuByTrendingBook(int trendingBook) async {
    var connection = await database;
    final List<Map<String, dynamic>> result = await connection!.query(
      'buku',
      where: 'trending_book = ?',
      whereArgs: [trendingBook],
    );
    print("Buku dengan trending_book = $trendingBook: $result");
    return result.map((json) => Buku.fromJson(json)).toList();
  }

  Future<List<Buku>> searchBooks(String query, String key) async {
    var connection = await database;
    final List<Map<String, dynamic>> result = await connection!.query(
      'buku',
      where: '${key} LIKE ?',
      whereArgs: ['%$query%'],
    );
    print("Buku yang ditemukan dengan query '$query': $result");
    return result.map((json) => Buku.fromJson(json)).toList();
  }

  // Delete Buku
  Future<int> deleteBuku(int id) async {
    var connection = await database;
    print(id);
    return await connection!.delete(
      'buku',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
