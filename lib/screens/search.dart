//kodingan seacrh menggunakan logika dari yt How to Filter List AB Nation Programmers
//Data API diambil dari Open Library API.
//kodingan mengikuti tutorial yt Flutter REST API tutorial with HTTP package code HQ

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:uts/model/book_model.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<bookModel> display_list = [];
  List<bookModel> main_book_list = [];
  String filterType = "Title";

  @override
  void initState() {
    super.initState();
    fetchBooks();
  }

  // Fungsi untuk mengambil data buku dari API
  Future<void> fetchBooks() async {
    final response = await http.get(Uri.parse('https://openlibrary.org/subjects/love.json?limit=10'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        main_book_list = data['works']
            .map<bookModel>((item) => bookModel(
          'https://covers.openlibrary.org/b/id/${item['cover_id']}-L.jpg',
          item['title'],
          item['subject']?.join(", ") ?? '',
          item['rating']?.toDouble() ?? 0.0,
          item['authors']?.first['name'] ?? 'Unknown',
        ))
            .toList();
        display_list = List.from(main_book_list);
      });
    } else {
      throw Exception('Failed to load books');
    }
  }

  // Fungsi untuk memperbarui daftar buku berdasarkan pencarian
  void updateList(String value) {
    setState(() {
      display_list = main_book_list.where((element) {
        switch (filterType) {
          case "Author":
            return element.book_author!
                .toLowerCase()
                .contains(value.toLowerCase());
          case "Category":
            return element.book_kategori!
                .toLowerCase()
                .contains(value.toLowerCase());
          default:
            return element.book_judul!
                .toLowerCase()
                .contains(value.toLowerCase());
        }
      }).toList();
    });
  }

  // Widget untuk tombol filter
  Widget _buildFilterButton(String type) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            filterType = type;
            display_list = List.from(main_book_list);
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: filterType == type ? Colors.blue : Colors.grey,
          padding: EdgeInsets.symmetric(vertical: 15),
        ),
        child: Text(
          type,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'PustakaKu',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 25),
            ),
            Icon(Icons.notifications, color: Colors.black),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Search for a Book",
              style: TextStyle(
                color: Colors.black,
                fontSize: 27.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              onChanged: (value) => updateList(value),
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                hintText: "Search...",
                hintStyle: TextStyle(color: Colors.white),
                prefixIcon: Icon(Icons.search, color: Colors.white),
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              child: Row(
                children: [
                  _buildFilterButton("Title"),
                  SizedBox(width: 10),
                  _buildFilterButton("Author"),
                  SizedBox(width: 10),
                  _buildFilterButton("Category"),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: display_list.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                itemCount: display_list.length,
                itemBuilder: (context, index) => ListTile(
                  contentPadding: EdgeInsets.all(10.0),
                  title: Text(
                    display_list[index].book_judul!,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        display_list[index].book_author!,
                        style: TextStyle(
                          color: Colors.black,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      Text(
                        display_list[index].book_kategori!,
                        style: TextStyle(
                          color: Colors.black,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                  trailing: Text(
                    "${display_list[index].book_rating}",
                    style: TextStyle(color: Colors.red),
                  ),
                  leading: Image.network(display_list[index].book_gambar!),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
