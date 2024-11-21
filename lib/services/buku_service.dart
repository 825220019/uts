import 'package:uts/model/book_model.dart';
import 'package:uts/repository/buku_repository.dart';

class BukuService {
  final BukuRepository _bukuRepository = BukuRepository();

// Insert Buku
  Future<int> insertBuku(Buku buku) async {
    return await _bukuRepository.insertBuku(buku);
  }

// Get all Buku
  Future<List<Buku>> getAllBuku() async {
    return await _bukuRepository.getAllBuku();
  }

// Get Buku by ID
  Future<Buku?> getBukuById(int id) async {
    return await _bukuRepository.getBukuById(id);
  }

// Update Buku
  Future<int> updateBuku(Buku buku) async {
    return await _bukuRepository.updateBuku(buku);
  }

// Delete Buku
  Future<int> deleteBuku(int id) async {
    return await _bukuRepository.deleteBuku(id);
  }

  Future<List<Buku>> getTrending() async {
    return await _bukuRepository.getBukuByTrendingBook(1);
  }

  Future<List<Buku>> getRecomended() async {
    return await _bukuRepository.getBukuByIsRecommended(1);
  }
}
