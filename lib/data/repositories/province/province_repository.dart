import 'package:batru_house_rental/data/models/province/province_response.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProvinceRepository {
  final _fireStore = FirebaseFirestore.instance;

  Future<List<ProvinceResponse>> getProvinces() async {
    final snapshot = await _fireStore.collection('province').get();
    return snapshot.docs
        .map(
          (e) => ProvinceResponse.fromJson(e.data()),
        )
        .toList();
  }
  Future<String> getProvinceName(String id) async {
    final snapshot = await _fireStore.collection('province').get();
    return snapshot.docs
        .map(
          (e) => ProvinceResponse.fromJson(e.data()),
        )
        .toList()
        .where((element) => element.id == id)
        .toList()[0].name;
  }
}
