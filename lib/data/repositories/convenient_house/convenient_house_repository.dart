import 'package:batru_house_rental/data/models/convenient_house/convenient_house_reponse.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ConvenientHouseRepository {
  final _fireStore = FirebaseFirestore.instance;

  Future<void> addConvenientHouse(
      List<ConvenientHouseResponse> convenients) async {
    await Future.wait(
      convenients.map(
        (element) async {
          debugPrint(element.id);
          await _fireStore
              .collection('convenientHouse')
              .doc(element.id)
              .set(element.toJson());
        },
      ),
    );
  }
}
