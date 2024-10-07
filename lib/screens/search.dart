import 'package:flutter/material.dart';
import 'package:uts/screens/home.dart';

class Book {
  final String title;
  final String author;
  final String category;
  final String imagePath;

  Book({
    required this.title,
    required this.author,
    required this.category,
    required this.imagePath,
  });
}

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String _selectedFilter = "Title";
  String _searchQuery = "";
  int _currentIndex = 1;

  List<Book> _allBooks = [
    Book(
      title: "Harry Potter and the Philosopher's Stone",
      author: "J. K. Rowling",
      category: "Fiction",
      imagePath: "assets/images/1.jpg",
    ),
    Book(
      title: "Atomic Habits",
      author: "James Clear",
      category: "Non Fiction",
      imagePath: "assets/images/2.jpg",
    ),
    Book(
      title: "Venus in the Blind Spot",
      author: "Junji Ito",
      category: "Horror",
      imagePath: "assets/images/3.jpg",
    ),
    Book(
      title: "Doraemon (6)",
      author: "Fujiko F. Fujio",
      category: "Comic",
      imagePath: "assets/images/4.jpg",
    ),
    Book(
      title: "IPA Kelas 8",
      author: "Kemdikbud",
      category: "Academic",
      imagePath: "assets/images/5.jpg",
    ),
  ];

  List<Book> _filteredBooks = [];

  @override
  void initState() {
    super.initState();
    _filteredBooks = _allBooks;
  }

  void _searchBooks() {
    setState(() {
      if (_searchQuery.isEmpty) {
        _filteredBooks = _allBooks;
      } else {
        _filteredBooks = _allBooks.where((book) {
          if (_selectedFilter == "Title") {
            return book.title.toLowerCase().contains(_searchQuery.toLowerCase());
          } else if (_selectedFilter == "Author") {
            return book.author.toLowerCase().contains(_searchQuery.toLowerCase());
          } else if (_selectedFilter == "Category") {
            return book.category.toLowerCase().contains(_searchQuery.toLowerCase());
          }
          return false;
        }).toList();
      }
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OurHome()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          _searchQuery = value;
                        });
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search',
                        hintStyle: TextStyle(
                          color: Colors.orange,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  IconButton(
                    icon: Icon(Icons.search, color: Colors.orange),
                    onPressed: _searchBooks,
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildFilterButton("Title"),
                _buildFilterButton("Author"),
                _buildFilterButton("Category"),
              ],
            ),
          ),

          SizedBox(height: 16),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: _filteredBooks.isNotEmpty
                  ? ListView.builder(
                itemCount: _filteredBooks.length,
                itemBuilder: (context, index) {
                  final book = _filteredBooks[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          child: Image.asset(
                            book.imagePath,
                            width: 100,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                book.title,
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 4),
                              Text("Author: ${book.author}"),
                              SizedBox(height: 4),
                              Text("Category: ${book.category}"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              )
                  : Center(
                child: Text('No books found'),
              ),
            ),
          ),

        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 28,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }

  Widget _buildFilterButton(String label) {
    bool isSelected = _selectedFilter == label;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.orange : Colors.white,
        side: isSelected ? BorderSide.none : BorderSide(color: Colors.grey),
        elevation: isSelected ? 5 : 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: () {
        setState(() {
          _selectedFilter = label;
          _searchBooks();
        });
      },
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
