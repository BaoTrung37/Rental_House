import 'package:batru_house_rental/data/models/province/province_response.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProvinceRepository {
  final _fireStore = FirebaseFirestore.instance;

  List<ProvinceResponse> _items = [];
  List<ProvinceResponse> get items {
    return [..._items];
  }

  Future<List<ProvinceResponse>> getProvinces() async {
    final snapshot = await _fireStore.collection('province').get();
    final list = snapshot.docs
        .map(
          (e) => ProvinceResponse.fromJson(e.data()),
        )
        .toList();
    _items = list;
    return list;
  }

  // Future<String> getProvinceName(String id) async {
  //   return _items.firstWhere((element) => element.id == id).name;
  // }
}
