import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class StorageMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // adding image to firebase storage
  Future<String> uploadImageToStorage(
      String childName, XFile file, bool isDog) async {
    try {
      // Creating location to Firebase Storage
      Reference ref = _storage.ref().child(childName);
      File newFile = File(file.path);
      // Read the file content as bytes
      if (isDog) {
        String id = const Uuid().v1();
        ref = ref.child(id);
      } else {
        ref = _storage.ref().child(_auth.currentUser!.uid);
      }
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

  Future<List<String>> uploadPhotos(List<XFile> photos,String uId, String name) async {
    List<String> photoPaths = [];
    for (var photo in photos) {
      String id = const Uuid().v1();
      Reference ref = _storage.ref().child(name).child(uId).child(id);
      UploadTask uploadTask = ref.putFile(File(photo.path));

      TaskSnapshot snapshot =
          await uploadTask.whenComplete(() => print('Upload complete'));

      if (snapshot.state == TaskState.success) {
        print('Upload successful');
        String downloadUrl = await snapshot.ref.getDownloadURL();
        print('Download URL: $downloadUrl');
        photoPaths.add(downloadUrl); // Add the download URL to the list
      } else {
        print('Upload failed');
      }
    }
    print("this is $photoPaths");

    return photoPaths;
  }
}
