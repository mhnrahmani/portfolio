import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ImageFromFirebase extends StatefulWidget {
  const ImageFromFirebase({super.key, required this.filePath});
  final String filePath; // File path in Firebase Storage

  @override
  _ImageFromFirebaseState createState() => _ImageFromFirebaseState();
}

class _ImageFromFirebaseState extends State<ImageFromFirebase> {
  String? imageUrl;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  // Function to get the download URL
  Future<void> _loadImage() async {
    try {
      // Replace "img/profile.jpg" with your actual path in Firebase Storage
      String downloadURL = await FirebaseStorage.instance
          .ref(widget.filePath) // File path in Firebase Storage
          .getDownloadURL();

      setState(() {
        imageUrl = downloadURL;
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred while fetching the image: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: imageUrl != null
          ? Image.network(imageUrl!) // Display the image using the download URL
          : const CircularProgressIndicator(), // Show a loading indicator while fetching
    );
  }
}
