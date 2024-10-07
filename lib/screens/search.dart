import 'package:flutter/material.dart';
import 'package:uts/model/book_model.dart';

class search extends StatefulWidget {
  const search({super.key});

  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {


  static List<bookModel> main_book_list = [
    bookModel('assets/images/1.jpg', "Harry Potter and the Sorcerers Stone", "Fantasy,Adventure,Supranatural", 4.8),
    bookModel('assets/images/2.jpg', "Atomic Habits: An Easy & Proven Way to Build Good Habits & Break Bad Ones", "Fantasy,Adventure,Supranatural", 3.9),
    bookModel('assets/images/3.jpg', "Ito Junji: Best Of Best Short Story Collection", "Fantasy,Adventure,Supranatural", 4.9),
    bookModel('assets/images/4.jpg', "Doraemon Vol. 6", "Fantasy,Adventure,Supranatural", 4.4),
    bookModel('assets/images/5.jpg', "Buku Paket IPA Kelas 8", "Education,Adventure,Supranatural", 4.0),
  ];

List<bookModel> display_list = List.from(main_book_list);

  void updatelist(String value){
  setState(() {
    display_list = main_book_list
        .where((element) =>
          element.book_judul!.toLowerCase().contains(value.toLowerCase()))
        .toList();
    display_list = main_book_list
        .where((element) =>
        element.book_kategori!.toLowerCase().contains(value.toLowerCase()))
        .toList();
  });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        elevation: 0.0,
      ),
      body: Padding(padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Search for a book",
            style: TextStyle(color: Colors.blue,
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
            )
            ,),
          SizedBox(
            height: 20.0,
          ),
          TextField(
          onChanged: (value) => updatelist(value),
            style: TextStyle(color: Colors.red),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.green,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none
                ),
                hintText: "Search...",
              prefixIcon: Icon(Icons.search),
              prefixIconColor: Colors.orangeAccent,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: display_list.length,
              itemBuilder: (context,index) => ListTile(
                contentPadding: EdgeInsets.all(10.0) ,

                title: Text(
                  display_list[index].book_judul!,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  ),
                ),
                subtitle: Text(
                  '${display_list[index].book_kategori!}',
                  style: TextStyle(
                      color: Colors.black, fontStyle: FontStyle.italic,
                  ),
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
