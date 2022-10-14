import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

class ImageHouseRepository {
  // final _fireStore = FirebaseFirestore.instance;
  final _firebaseStorage = FirebaseStorage.instance;
  

  UploadTask upLoadImageFile(File image, String filename) {
    final reference = _firebaseStorage.ref().child(filename);
    final uploadTask = reference.putFile(image);
    return uploadTask;
  }

  Future<String> uploadImageFile(File imageFile) async {
    final filename = DateTime.now().millisecondsSinceEpoch.toString();
    final uploadTask = upLoadImageFile(imageFile, filename);
    try {
      final snapshot = await uploadTask;
      final imageUrl = await snapshot.ref.getDownloadURL();
      return imageUrl;
    } on FirebaseException catch (e) {
      debugPrint(e.message);
    }
    return 'blank';
  }
}
