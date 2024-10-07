import 'package:flutter/material.dart';
import 'package:uts/model/book_model.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  static List<bookModel> main_book_list = [
    bookModel('assets/images/1.jpg', "Harry Potter and the Sorcerers Stone",
        "Fantasy,Adventure,Supranatural", 4.8, "J.K. Rowling"),
    bookModel(
        'assets/images/2.jpg',
        "Atomic Habits: An Easy & Proven Way to Build Good Habits & Break Bad Ones",
        "Self-help",
        3.9,
        "James Clear"),
    bookModel(
        'assets/images/3.jpg',
        "Ito Junji: Best Of Best Short Story Collection",
        "Horror",
        4.9,
        "Junji Ito"),
    bookModel('assets/images/4.jpg', "Doraemon Vol. 6", "Manga", 4.4,
        "Fujiko F. Fujio"),
    bookModel('assets/images/5.jpg', "Buku Paket IPA Kelas 8", "Education", 4.0,
        "Various Authors"),
  ];

  List<bookModel> display_list = List.from(main_book_list);
  String filterType = "Title";

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

  Widget _buildFilterButton(String type) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            filterType = type;
            display_list = List.from(main_book_list);
          });
        },
        child: Text(
          type,
          style: TextStyle(color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: filterType == type ? Colors.blue : Colors.grey,
          padding: EdgeInsets.symmetric(vertical: 15),
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
              child: ListView.builder(
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
                        '${display_list[index].book_author!}',
                        style: TextStyle(
                          color: Colors.black,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      Text(
                        '${display_list[index].book_kategori!}',
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
                  leading: Image.asset(display_list[index].book_gambar!),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
