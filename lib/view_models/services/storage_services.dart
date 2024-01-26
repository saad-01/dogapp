import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class StorageMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // adding image to firebase storage
  Future<String> uploadImageToStorage(
      String childName, XFile file, bool isPost) async {
    try {
      // Creating location to Firebase Storage
      Reference ref =
          _storage.ref().child(childName).child(_auth.currentUser!.uid);
      File newFile = File(file.path);
      // Read the file content as bytes

      // Uploading the file to Firebase Storage
      UploadTask uploadTask = ref.putFile(newFile);

      // Wait for the upload to complete
      await uploadTask;

      // Get the download URL
      String downloadUrl = await ref.getDownloadURL();

      return downloadUrl;
    } catch (e) {
      print('Error uploading image to Firebase Storage: $e');
      // Handle the error, e.g., show a message to the user
      return '';
    }
  }
}
