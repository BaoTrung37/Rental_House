import 'package:batru_house_rental/data/models/address/address_reponse.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddressRepository {
  final _fireStore = FirebaseFirestore.instance;

  Future<List<AddressResponse>> getAddress() async {
    final address = await _fireStore.collection('address').get();
    return address.docs.map((e) => AddressResponse.fromJson(e.data())).toList();
  }

  Future<AddressResponse> getAddressById(String id) async {
    final address = await _fireStore.collection('address').doc(id).get();
    return AddressResponse.fromJson(address.data()!);
  }

  Future<void> postAddress(AddressResponse addressResponse) async {
    await _fireStore
        .collection('address')
        .doc(addressResponse.id)
        .set(addressResponse.toJson());
  }
}
