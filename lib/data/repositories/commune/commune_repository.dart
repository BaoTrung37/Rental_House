import 'package:batru_house_rental/data/models/commune/commune_response.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CommuneRepository {
  final _fireStore = FirebaseFirestore.instance;
  List<CommuneResponse> _items = [];
  List<CommuneResponse> get items {
    return [..._items];
  }

  Future<List<CommuneResponse>> getCommunes() async {
    final snapshot = await _fireStore.collection('commune').get();
    final list = snapshot.docs
        .map(
          (e) => CommuneResponse.fromJson(e.data()),
        )
        .toList();
    _items = list;
    return list;
  }

  Future<List<CommuneResponse>> getCommunetWithProvinceId(String id) async {
    final snapshot = await _fireStore.collection('commune').get();
    final list = snapshot.docs
        .map(
          (e) => CommuneResponse.fromJson(e.data()),
        )
        .toList()
        .where((element) => element.districtId == id)
        .toList();
    return list;
  }
}
