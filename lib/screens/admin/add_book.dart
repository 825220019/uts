import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uts/model/book_model.dart';
import 'package:uts/screens/admin/book.dart';
import 'dart:io';

import 'package:uts/services/buku_service.dart';

class AddBuku extends StatefulWidget {
  AddBuku({super.key});

  @override
  _AddBukuState createState() => _AddBukuState();
}

class _AddBukuState extends State<AddBuku> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for form fields
  final TextEditingController _judulController = TextEditingController();
  final TextEditingController _kategoriController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();
  final TextEditingController _ratingController = TextEditingController();
  final TextEditingController _sinopsisController = TextEditingController();

  // Image path to store selected image from gallery
  File? _selectedImage;

  // Switch states for Recommended and Trending
  int _isRecommended = 0;
  int _isTrending = 0;

  // Function to pick an image from gallery and save to local storage
  bool _isImagePickerActive = false;

  Future<void> _pickImage() async {
    if (_isImagePickerActive) return; // Cegah pemanggilan ganda
    _isImagePickerActive = true;

    try {
      final picker = ImagePicker();
      final XFile? pickedFile =
      await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        final directory = await getApplicationDocumentsDirectory();
        final path = '${directory.path}/images';
        final imageDirectory = Directory(path);

        if (!await imageDirectory.exists()) {
          await imageDirectory.create(recursive: true);
        }

        final newImagePath = File('$path/${pickedFile.name}');
        await File(pickedFile.path).copy(newImagePath.path);

        setState(() {
          _selectedImage = newImagePath;
        });
      }
    } catch (e) {
      // _showSnackBar('Gagal memilih gambar: ${e.toString()}', Colors.red);
    } finally {
      _isImagePickerActive = false; // Reset setelah selesai
    }
  }

  addBook(Buku buku) async {
    BukuService bukuService = BukuService();
    await bukuService.insertBuku(buku);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFF7A900),
        title: const Text(
          'Tambah Buku',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Book title input
                TextFormField(
                  controller: _judulController,
                  decoration: const InputDecoration(
                    labelText: 'Judul Buku',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Book category input
                TextFormField(
                  controller: _kategoriController,
                  decoration: const InputDecoration(
                    labelText: 'Kategori Buku',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),

                // Author input
                TextFormField(
                  controller: _authorController,
                  decoration: const InputDecoration(
                    labelText: 'Penulis Buku',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),

                // Rating input
                TextFormField(
                  controller: _ratingController,
                  decoration: const InputDecoration(
                    labelText: 'Rating Buku',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),

                TextFormField(
                  controller: _sinopsisController,
                  maxLines: 2,
                  decoration: const InputDecoration(
                    labelText: 'Sinopsis Buku',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 16),

                // Image picker
                GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: _selectedImage == null
                        ? const Center(
                      child: Text(
                        'Pilih Gambar Buku',
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                        : ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.file(
                        _selectedImage!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Switch for Recommended
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Rekomendasi Buku'),
                    Switch(
                      value: _isRecommended == 1 ? true : false,
                      onChanged: (value) {
                        setState(() {
                          _isRecommended = value ? 1 : 0;
                        });
                      },
                    ),
                  ],
                ),

                // Switch for Trending
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Buku Trending'),
                    Switch(
                      value: _isTrending == 1 ? true : false,
                      onChanged: (value) {
                        setState(() {
                          _isTrending = value ? 1 : 0;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Save Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (_selectedImage != null) {
                          Buku buku = Buku(
                              _selectedImage!.path,
                              _judulController.text,
                              _kategoriController.text,
                              double.parse(_ratingController.text),
                              _authorController.text,
                              1,
                              _isRecommended,
                              _isTrending, // Setting trendingBook
                              _sinopsisController.text);
                          addBook(buku);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Buku berhasil ditambahkan')),
                          );
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) => BookScreenAdmin(),
                            ),
                                (route) => false,
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Ops, masukan image terlebih dahulu'),
                            backgroundColor: Colors.red,
                          ));
                        }
                      }
                    },
                    child: const Text(
                      'Simpan',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
