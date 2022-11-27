import 'package:batru_house_rental/data/models/convenient/convenient_response.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ConvenientRepository {
  final _fireStore = FirebaseFirestore.instance;
  List<ConvenientResponse> _items = [];
  List<ConvenientResponse> get items {
    return [..._items];
  }

  Future<List<ConvenientResponse>> getConvenients() async {
    final snapshot = await _fireStore.collection('convenient').get();
    final list = snapshot.docs
        .map(
          (e) => ConvenientResponse.fromJson(e.data()),
        )
        .toList();
    _items = list;
    return list;
  }
}
