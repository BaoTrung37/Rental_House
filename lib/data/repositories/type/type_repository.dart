import 'package:batru_house_rental/data/models/type/type_response.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TypeRepository {
  final _fireStore = FirebaseFirestore.instance;

  Future<List<TypeResponse>> getTypes() async {
    final snapshot = await _fireStore.collection('type').get();
    return snapshot.docs
        .map(
          (e) => TypeResponse.fromJson(e.data()),
        )
        .toList();
  }
}
