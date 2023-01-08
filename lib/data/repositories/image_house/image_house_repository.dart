import 'dart:io';

import 'package:batru_house_rental/data/models/image_house/image_house_response.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

class ImageHouseRepository {
  final _fireStore = FirebaseFirestore.instance;
  final _firebaseStorage = FirebaseStorage.instance;

  Future<void> postImageHouse(
      List<ImageHouseResponse> imageHouseResponseList) async {
    await Future.wait(
      imageHouseResponseList.map(
        (e) async {
          await _fireStore.collection('imageHouse').doc(e.id).set(e.toJson());
        },
      ),
    );
  }

  Future<List<String>> getImageUrlDowloadList(List<File> files) async {
    return Future.wait(
      files.map((e) async {
        return getImageUrlDownload(e);
      }).toList(),
    );
  }

  UploadTask upLoadImageFile(File image, String filename) {
    final reference = _firebaseStorage.ref('/post_images').child(filename);
    final uploadTask = reference.putFile(image);
    return uploadTask;
  }

  Future<String> getImageUrlDownload(File imageFile) async {
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
