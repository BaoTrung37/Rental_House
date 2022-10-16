import 'package:batru_house_rental/data/models/type/type_response.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TypeRepository {
  final _fireStore = FirebaseFirestore.instance;
  static List<TypeResponse> _items = [];

  static List<TypeResponse> get items {
    return [..._items];
  }

  Future<List<TypeResponse>> getTypes() async {
    final snapshot = await _fireStore.collection('type').get();
    final list = snapshot.docs
        .map(
          (e) => TypeResponse.fromJson(e.data()),
        )
        .toList();
    _items = list;
    return list;
  }

  static Future<TypeResponse> getType(String id) async {
    // final snapshot = await _fireStore.collection('type').doc(id).get();
    // return TypeResponse.fromJson(snapshot.data()!);
    return _items.firstWhere((element) => element.id == id);
  }
}
