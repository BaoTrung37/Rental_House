import 'package:batru_house_rental/data/models/house/house_response.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HouseRepository {
  final _fireStore = FirebaseFirestore.instance;

  Future<void> addHouse(HouseResponse houseResponse) async {
    await _fireStore
        .collection('house')
        .doc(houseResponse.id)
        .set(houseResponse.toJson());
  }

  Future<void> updateHouse(HouseResponse houseResponse) async {
    await _fireStore
        .collection('house')
        .doc(houseResponse.id)
        .update(houseResponse.toJson());
  }

  Future<void> deleteHouse(String id) async {
    await _fireStore.collection('house').doc(id).delete();
  }

  Stream<List<HouseResponse>> getHouse() {
    return _fireStore.collection('house').snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => HouseResponse.fromJson(doc.data()))
          .toList();
    });
  }

  Stream<HouseResponse> getHouseById(String id) {
    return _fireStore.collection('house').doc(id).snapshots().map((snapshot) {
      return HouseResponse.fromJson(snapshot.data()!);
    });
  }
}
