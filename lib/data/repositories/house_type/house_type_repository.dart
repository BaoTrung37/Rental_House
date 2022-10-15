import 'package:batru_house_rental/data/models/house_type/house_type_response.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HouseTypeRepository {
  final _firestore = FirebaseFirestore.instance;

  Future<void> addHouseType(HouseTypeResponse houseTypeResponse) async {
    await _firestore.collection('houseType').add(houseTypeResponse.toJson());
  }

  Future<void> updateHouseType(HouseTypeResponse houseTypeResponse) async {
    await _firestore
        .collection('houseType')
        .doc(houseTypeResponse.id)
        .update(houseTypeResponse.toJson());
  }

  Future<void> deleteHouseType(String id) async {
    await _firestore.collection('houseType').doc(id).delete();
  }

  Future<List<HouseTypeResponse>> getHouseType() async {
    final snapshot = await _firestore.collection('houseType').get();
    return snapshot.docs
        .map((doc) => HouseTypeResponse.fromJson(doc.data()))
        .toList();
  }

  Future<HouseTypeResponse> getHouseTypeById(String id) async {
    final snapshot = await _firestore.collection('houseType').doc(id).get();
    return HouseTypeResponse.fromJson(snapshot.data()!);
  }
}
