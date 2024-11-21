import 'dart:io';

import 'package:flutter/material.dart';
import 'package:uts/database/database_connection.dart';
import 'package:uts/model/book_model.dart';
import 'package:uts/repository/buku_repository.dart';
import 'package:uts/screens/admin/add_book.dart';
import 'package:uts/screens/admin/edit_book.dart';
import 'package:uts/screens/admin_home.dart';
import 'package:uts/services/buku_service.dart';

class BookScreenAdmin extends StatefulWidget {
  BookScreenAdmin({super.key});

  @override
  State<BookScreenAdmin> createState() => _BookScreenAdminState();
}

class _BookScreenAdminState extends State<BookScreenAdmin> {
  // Example list of books (replace this with actual data fetching from your database)

  late BukuService bukuService;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bukuService = BukuService();
  }

  Future<List<Buku>> getBuku() {
    return bukuService.getAllBuku();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: IconButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AddBuku(),
          ));
        },
        icon: Icon(
          Icons.add,
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => AdminHome(),), (route) => false,);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFF7A900),
        title: const Text(
          'Book Management',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: getBuku(),
          builder: (context, snapshot) => snapshot.connectionState ==
              ConnectionState.waiting
              ? Center(
            child: CircularProgressIndicator(),
          )
              : GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 2 items per row
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.7, // Adjust the size of each card
            ),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              print(snapshot.data![index].toJson());

              return BookCard(
                imagePath: snapshot.data![index].bookGambar!,
                title: snapshot.data![index].bookJudul!,
                onDelete: () {
                  bukuService.deleteBuku(snapshot.data![index].id!);
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Berhasil menghapus buku')));

                  setState(() {});
                },
                onEdit: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        EditBuku(buku: snapshot.data![index]),
                  ));
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class BookCard extends StatelessWidget {
  final String imagePath; // imagePath is now a file path
  final String title;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const BookCard({
    Key? key,
    required this.imagePath, // Image path is passed
    required this.title,
    required this.onEdit,
    required this.onDelete,
  }) : super(key: key);

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
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: imagePath.isNotEmpty
                    ? Image.file(
                  File(
                      imagePath), // Displaying the image from the local file
                  width: 190,
                  height: 220, // Ensuring the image has a fixed height
                  fit: BoxFit.cover,
                )
                    : Container(
                  color: Colors
                      .grey[300], // Placeholder if no image is selected
                  width: 190,
                  height: 230,
                  child: Center(
                    child: Text('No Image',
                        style: TextStyle(color: Colors.black)),
                  ),
                ),
              ),
              // Buttons (positioned above the image)
              Positioned(
                top: 10,
                right: 10,
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit, color: Colors.blue),
                      onPressed: onEdit,
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: onDelete,
                    ),
                  ],
                ),
              ),
            ],
          ),
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
