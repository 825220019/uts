import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:uts/model/book_model.dart';
import 'package:uts/screens/admin/book.dart';
import 'package:uts/services/buku_service.dart';

class EditBuku extends StatefulWidget {
  final Buku buku;

  EditBuku({required this.buku});

  @override
  _EditBukuState createState() => _EditBukuState();
}

class _EditBukuState extends State<EditBuku> {
  final _formKey = GlobalKey<FormState>();

  int is_recommended = 0;
  int is_trending = 0;

  // Controllers for form fields
  final TextEditingController _judulController = TextEditingController();
  final TextEditingController _kategoriController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();
  final TextEditingController _ratingController = TextEditingController();
  final TextEditingController _sinopsisController = TextEditingController();

  // Image path to store selected image from gallery
  File? _selectedImage;

  @override
  void initState() {
    super.initState();
    // Initialize controllers with the current book data
    _judulController.text = widget.buku.bookJudul ?? '';
    _kategoriController.text = widget.buku.bookKategori ?? '';
    _authorController.text = widget.buku.bookAuthor ?? '';
    _ratingController.text = widget.buku.bookRating?.toString() ?? '';
    _sinopsisController.text = widget.buku.sinopsis?.toString() ?? '';

    print("Recomended" + widget.buku.isRecommended.toString());

    setState(() {
      is_recommended = widget.buku.isRecommended ?? 0;
      is_trending = widget.buku.isTrending ?? 0;
    });

    if (widget.buku.bookGambar != null) {
      _selectedImage = File(widget.buku.bookGambar!);
    }
  }

  // Function to pick an image from gallery and save to local storage
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final XFile? pickedFile =
    await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // Get the directory for storing the image
      final directory = await getApplicationDocumentsDirectory();
      final path = '${directory.path}/images';
      final imagePath = File(pickedFile.path);

      // Create the 'images' directory if it doesn't exist
      final imageDirectory = Directory(path);
      if (!await imageDirectory.exists()) {
        await imageDirectory.create(recursive: true);
      }

      // Move the picked file to the new directory
      final newImagePath = File('$path/${pickedFile.name}');
      await imagePath.copy(newImagePath.path);

      setState(() {
        _selectedImage = newImagePath;
      });
    }
  }

  // Function to update book data
  Future<void> updateBook(Buku buku) async {
    BukuService bukuService = BukuService();
    print(buku.toJson());
    await bukuService.updateBuku(buku);
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
          'Edit Buku',
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
                    labelText: 'harga Buku',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),

                TextFormField(
                  controller: _sinopsisController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    labelText: 'Sinopsis Buku',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
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

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Rekomendasi Buku'),
                    Switch(
                      value: is_recommended == 1 ? true : false,
                      onChanged: (value) {
                        setState(() {
                          is_recommended = value ? 1 : 0;
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
                      value: is_trending == 1 ? true : false,
                      onChanged: (value) {
                        setState(() {
                          is_trending = value ? 1 : 0;
                        });
                      },
                    ),
                  ],
                ),

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
                            widget.buku.id,
                            is_recommended,
                            is_trending,
                          );
                          updateBook(buku);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Buku berhasil diperbarui')),
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
                      'Perbarui',
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
