import 'dart:io';

import 'package:egram/service/databese_service.dart';
import 'package:egram/service/newsservice.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';

class AddNewsPage extends StatefulWidget {
  const AddNewsPage({Key? key}) : super(key: key);

  @override
  State<AddNewsPage> createState() => _AddNewsPageState();
}

class _AddNewsPageState extends State<AddNewsPage> {
  final _formKey = GlobalKey<FormState>();
  String? newsHeading;
  String? newsContent;
  File? newsImage;  // Image file for the news
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add News')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Enter News Details",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                
                // News Heading
                TextFormField(
                  decoration: const InputDecoration(labelText: 'News Heading'),
                  onChanged: (value) {
                    setState(() {
                      newsHeading = value;
                    });
                  },
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Enter a valid heading' : null,
                ),
                const SizedBox(height: 16),
                
                // News Content
                TextFormField(
                  decoration: const InputDecoration(labelText: 'News Content'),
                  maxLines: 5,
                  onChanged: (value) {
                    setState(() {
                      newsContent = value;
                    });
                  },
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Enter news content' : null,
                ),
                const SizedBox(height: 16),
                
                // Select Image Button
                Center(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.image),
                    label: const Text("Select Image"),
                    onPressed: () async {
                      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
                      if (pickedFile != null) {
                        setState(() {
                          newsImage = File(pickedFile.path);
                        });
                      }
                    },
                  ),
                ),
                const SizedBox(height: 16),

                // Show Selected Image
                newsImage != null
                    ? Center(
                        child: Image.file(
                          newsImage!,
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                      )
                    : const Center(child: Text("No image selected")),
                
                const SizedBox(height: 32),
                
                // Submit Button
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      backgroundColor: Colors.green,
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate() && newsImage != null) {
                        String id = randomAlphaNumeric(10);
                        
                        // Upload image to Firebase Storage and get the URL
                        String? imageUrl = await StorageService().uploadImage(newsImage!, id);
                        if (imageUrl != null) {
                          // Prepare news data
                          Map<String, dynamic> newsData = {
                            "id": id,
                            "heading": newsHeading,
                            "content": newsContent,
                            "imageUrl": imageUrl,
                            "createdAt": DateTime.now(),  // For tracking news creation date
                          };

                          // Add news data to Firestore
                          await DatabaseMethod().addNewsDetails(newsData, id);

                          // Show success message
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('News Added Successfully!'),
                              backgroundColor: Colors.green,
                            ),
                          );

                          // Optionally, navigate back after adding news
                          Navigator.pop(context);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Image upload failed!'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      }
                    },
                    child: const Text(
                      'Add News',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
