class bookModel {
  String? book_gambar;
  String? book_judul;
  String? book_kategori;
  double? book_rating;
  String? book_author;

  bookModel(this.book_gambar, this.book_judul, this.book_kategori, this.book_rating, [this.book_author]);
}

class Buku {
  String? bookGambar;
  String? bookJudul;
  String? bookKategori;
  double? bookRating;
  String? bookAuthor;
  int? id;
  int? isRecommended;
  int? isTrending;
  String? sinopsis;

  Buku(
      this.bookGambar,
      this.bookJudul,
      this.bookKategori,
      this.bookRating,
      this.bookAuthor,
      this.id, [
        this.isRecommended = 0,
        this.isTrending = 0,
        this.sinopsis
      ]);

  // Convert Buku to JSON for saving/updating
  Map<String, dynamic> toJson() => {
    'gambar': bookGambar,
    'judul': bookJudul,
    'kategori': bookKategori,
    'rating': bookRating,
    'author': bookAuthor,
    'is_recommended': isRecommended,
    'trending_book': isTrending,
    'sinopsis' : sinopsis
  };

  // Parse JSON to Buku object
  factory Buku.fromJson(Map<String, dynamic> json) {
    return Buku(
      json['gambar'],
      json['judul'],
      json['kategori'],
      json['rating'],
      json['author'],
      json['id'],
      json['is_recommended'],
      json['trending_book'],
      json['sinopsis'],
    );
  }
}
