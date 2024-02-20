import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FileService {
  FirebaseStorage storage = FirebaseStorage.instance;

  Future<String> uploadImageToFirebase(File imageFile, String imageName) async {
    Reference ref = storage.ref().child(imageName);
    UploadTask uploadTask = ref.putFile(imageFile);
    TaskSnapshot snapshot = await uploadTask.whenComplete(() => null);
    String downloadURL = await snapshot.ref.getDownloadURL();
    return downloadURL;
  }
}
