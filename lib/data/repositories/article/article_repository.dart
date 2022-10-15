import 'package:batru_house_rental/data/models/article/article_response.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ArticleRepository {
  final _fireStore = FirebaseFirestore.instance;

  Future<List<ArticleResponse>> getArticles() async {
    final snapshot = await _fireStore.collection('article').get();
    final list = snapshot.docs
        .map(
          (e) => ArticleResponse.fromJson(e.data()),
        )
        .toList();
    return list;
  }

  Future<void> addArticle(ArticleResponse articleResponse) async {
    await _fireStore
        .collection('article')
        .doc(articleResponse.id)
        .set(articleResponse.toJson());
  }
}
