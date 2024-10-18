import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  Future<String?> uploadImage(File imageFile, String id) async {
    try {
      // Create a reference to the location in Firebase Storage
      final storageRef = FirebaseStorage.instance.ref().child('newsImages/$id.jpg');
      
      // Upload the file
      final uploadTask = await storageRef.putFile(imageFile);

      // Get and return the download URL
      return await uploadTask.ref.getDownloadURL();
    } catch (e) {
      print("Image upload error: $e");
      return null;  // Return null if there's an error
    }
  }
}


class NewsService {
  // Function to fetch news
  Stream<QuerySnapshot> getNewsStream() {
    return FirebaseFirestore.instance.collection('News').snapshots();
  }
}

