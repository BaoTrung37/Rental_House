import 'package:batru_house_rental/data/models/favorite/favorite_response.dart';
import 'package:batru_house_rental/domain/entities/favorite/favorite_entity.dart';
import 'package:batru_house_rental/domain/use_case/favorite/check_favorite_use_case.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FavoriteRepository {
  final _fireStore = FirebaseFirestore.instance;
  List<FavoriteEntity> _items = [];

  List<FavoriteEntity> get items {
    return [..._items];
  }

  Future<List<FavoriteEntity>> getFavoriteList(String userId) async {
    final snapshot = await _fireStore
        .collection('favorite')
        .where('userId', isEqualTo: userId)
        .get();

    final list = snapshot.docs
        .map(
          (e) => FavoriteResponse.fromJson(e.data()).toEntity(),
        )
        .toList();
    _items = list;
    return list;
  }

  Future<String?> checkFavorite(GetFavoriteInput input) async {
    final userId = input.userId;
    final houseId = input.postId;

    final snapshot = await _fireStore
        .collection('favorite')
        .where('userId', isEqualTo: userId)
        .where('postId', isEqualTo: houseId)
        .get();
    if (snapshot.docs.isEmpty) {
      return null;
    }
    final list = snapshot.docs
        .map(
          (e) => FavoriteResponse.fromJson(e.data()).toEntity(),
        )
        .toList();
    return list.first.id;
  }

  Future<void> removeFavorite(String id) async {
    await _fireStore.collection('favorite').doc(id).delete();
  }

  Future<void> addFavorite(FavoriteResponse response) async {
    await _fireStore
        .collection('favorite')
        .doc(response.id)
        .set(response.toJson());
  }
}
