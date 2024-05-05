import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddShopImages extends StatefulWidget {
  const AddShopImages({Key? key}) : super(key: key);

  @override
  _AddShopImagesState createState() => _AddShopImagesState();
}

class _AddShopImagesState extends State<AddShopImages> {
  List<File?> _images = List.generate(5, (_) => null);
  TextEditingController _descriptionController = TextEditingController();

  Future<void> _pickImage(int index) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _images[index] = File(pickedFile.path);
      });
    }
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              "Shop Images",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 30),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () => _pickImage(index),
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        width: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.grey),
                          color: _images[index] != null ? Colors.transparent : Colors.grey[200],
                        ),
                        child: _images[index] != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: AspectRatio(
                                  aspectRatio: 5/9,
                                  child: Image.file(
                                    _images[index]!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                            : Center(
                                child: Icon(
                                  Icons.add,
                                  size: 40,
                                  color: Colors.grey,
                                ),
                              ),
                      ),
                      if (_images[index] != null)
                        Positioned(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _images[index] = null;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(Icons.remove_circle, color: Colors.purple[200]),
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 50),
          Center(
            child: Text(
              "Shop Description",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 15),
          TextField(
            controller: _descriptionController,
            decoration: InputDecoration(
              hintText: "Enter Description",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            maxLines: 10,
          ),
        ],
      ),
    );
  }
}
