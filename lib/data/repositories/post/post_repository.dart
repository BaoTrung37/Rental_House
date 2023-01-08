import 'package:batru_house_rental/data/models/post/post_response.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PostRepository {
  final _fireStore = FirebaseFirestore.instance;

  Future<void> addPost(PostResponse postResponse) async {
    await _fireStore
        .collection('post')
        .doc(postResponse.id)
        .set(postResponse.toJson());
  }

  Future<void> updatePost(PostResponse postResponse) async {
    await _fireStore
        .collection('post')
        .doc(postResponse.id)
        .update(postResponse.toJson());
  }

  Future<void> deletePost(String id) async {
    await _fireStore.collection('post').doc(id).delete();
  }

  Stream<List<PostResponse>> getPost() {
    return _fireStore.collection('post').snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => PostResponse.fromJson(doc.data()))
          .toList();
    });
  }

  Stream<PostResponse> getPostById(String id) {
    return _fireStore.collection('post').doc(id).snapshots().map((snapshot) {
      return PostResponse.fromJson(snapshot.data()!);
    });
  }

  Future<void> postAvailablePost(String id) async {
    await _fireStore
        .collection('post')
        .doc(id)
        .update({'isAvailablePost': true});
  }

  Future<void> unPostAvailablePost(String id) async {
    await _fireStore
        .collection('post')
        .doc(id)
        .update({'isAvailablePost': false});
  }
}
