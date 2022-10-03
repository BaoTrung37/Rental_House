import 'package:batru_house_rental/data/models/district/district_response.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DistrictRepository {
  final _fireStore = FirebaseFirestore.instance;

  Future<List<DistrictResponse>> getDistricts() async {
    final snapshot = await _fireStore.collection('district').get();
    return snapshot.docs
        .map(
          (e) => DistrictResponse.fromJson(e.data()),
        )
        .toList();
  }

  Future<List<DistrictResponse>> getDistrictWithProvince(String id) async {
    final snapshot = await _fireStore.collection('district').get();
    return snapshot.docs
        .map(
          (e) => DistrictResponse.fromJson(e.data()),
        )
        .toList()
        .where((element) => element.provinceId == id)
        .toList();
  }
}
