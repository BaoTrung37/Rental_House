import 'package:batru_house_rental/domain/entities/article/article_entity.dart';
import 'package:batru_house_rental/domain/entities/image_house/image_house_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ArticleRepository {
  final _fireStore = FirebaseFirestore.instance;
  final List<ArticleEntity> _items = [];

  List<ArticleEntity> get items {
    return [..._items];
  }

  Future<List<ArticleEntity>> getArticles(int limit) async {
    final houseSnapshot =
        await _fireStore.collection('house').limit(limit).get();
    late ArticleEntity articleEntity;
    for (final house in houseSnapshot.docs) {
      final addressSnapshot = await _fireStore
          .collection('address')
          .where('houseId', isEqualTo: house.id)
          .get();
      final imageHouseSnapshot = await _fireStore
          .collection('imageHouse')
          .where('houseId', isEqualTo: house.id)
          .get();
      final convenientHouseSnapshot = await _fireStore
          .collection('convenientHouse')
          .where('houseId', isEqualTo: house.id)
          .get();
      final houseTypeSnapshot = await _fireStore
          .collection('houseType')
          .where('houseId', isEqualTo: house.id)
          .get();

      final imageList = imageHouseSnapshot.docs
          .map(
            (e) => ImageHouseEntity(
              id: e.id,
              url: e.data()['url'],
              houseId: e.data()['houseId'],
            ),
          )
          .toList();
      print(imageList.length);
    }

    // final list = snapshot.docs
    //     .map(
    //       (e) => ArticleResponse.fromJson(e.data()),
    //     )
    //     .toList();
    return [];
  }

  // Future<void> addArticle(ArticleResponse articleResponse) async {
  //   await _fireStore
  //       .collection('article')
  //       .doc(articleResponse.id)
  //       .set(articleResponse.toJson());
  // }
}
