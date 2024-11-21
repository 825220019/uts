import 'dart:io';

import 'package:flutter/material.dart';
import 'package:uts/screens/search.dart';
import 'package:uts/screens/book.dart';
import 'package:uts/services/buku_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _OurHomeState();
}

class _OurHomeState extends State<HomeScreen> {
  BukuService bukuService = BukuService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
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
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search ...',
                          hintStyle: TextStyle(
                            color: Colors.orange,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Search()),
                        );
                      },
                      child: Icon(Icons.search, color: Colors.orange),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text('Category',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CategoryItem(
                      label: 'Fiction', imagePath: 'assets/images/fiksi.jpg'),
                  CategoryItem(
                      label: 'Non-Fiction',
                      imagePath: 'assets/images/nonfiksi.jpg'),
                  CategoryItem(
                      label: 'Poetry', imagePath: 'assets/images/puisi.jpg'),
                  CategoryItem(
                      label: 'Academic',
                      imagePath: 'assets/images/akademik.jpg'),
                ],
              ),
              SizedBox(height: 20),
              Text('Recommended',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              SizedBox(height: 10),
              Container(
                height: 290,
                child: FutureBuilder(
                    future: bukuService.getRecomended(),
                    builder: (context, snapshot) {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OurBook(
                                  buku: snapshot.data![index],
                                ),
                              ),
                            );
                          },
                          child: BookCard(
                            imagePath: snapshot.data![index].bookGambar!,
                            title: snapshot.data![index].bookJudul!,
                          ),
                        ),
                        scrollDirection: Axis.horizontal,
                      );
                    }),
              ),
              SizedBox(height: 20),
              Text('Trending Book',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              SizedBox(height: 10),
              FutureBuilder(
                  future: bukuService.getTrending(),
                  builder: (context, snapshot) => ListView.builder(
                    itemCount: snapshot.data!.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => OurBook(buku: snapshot.data![index]),)),
                      child: Container(
                        child: Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(color: Colors.grey, blurRadius: 10)
                            ],
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.file(
                                File(snapshot.data![index].bookGambar!),
                                width: 130,
                                height: 185,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: Colors.blue[100],
                                        borderRadius:
                                        BorderRadius.circular(12),
                                      ),
                                      child: Text(
                                        snapshot.data![index].bookKategori!,
                                        style: TextStyle(
                                            color: Colors.blue[900]),
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      "${snapshot.data![index].bookJudul}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                        'by ${snapshot.data![index].bookAuthor}',
                                        style: TextStyle(color: Colors.grey)),
                                    SizedBox(height: 8),
                                    Text(
                                      '${snapshot.data![index].sinopsis}',
                                      style: TextStyle(color: Colors.black54),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String label;
  final String imagePath;

  const CategoryItem({Key? key, required this.label, required this.imagePath})
      : super(key: key);

  //Category
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.grey,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          padding: EdgeInsets.all(5),
          child: ClipOval(
            child: Image.asset(
              imagePath,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 5),
        Text(label),
      ],
    );
  }
}

//Recommended
class BookCard extends StatelessWidget {
  final String imagePath;
  final String title;

  const BookCard({Key? key, required this.imagePath, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Color(0xFFFFE09B),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(3, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.file(
                File(imagePath), // Displaying the image from the local file
                width: 190,
                height: 230, // Ensuring the image has a fixed height
                fit: BoxFit.cover,
              )),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 17,
              shadows: [
                Shadow(
                  offset: Offset(1.0, 1.0),
                  blurRadius: 3.0,
                  color: Colors.grey.withOpacity(0.5),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
