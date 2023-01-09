import 'package:batru_house_rental/data/models/address/address_reponse.dart';
import 'package:batru_house_rental/data/models/convenient/convenient_response.dart';
import 'package:batru_house_rental/data/models/convenient_house/convenient_house_reponse.dart';
import 'package:batru_house_rental/data/models/house_type/house_type_response.dart';
import 'package:batru_house_rental/data/models/image_house/image_house_response.dart';
import 'package:batru_house_rental/data/models/post/post_response.dart';
import 'package:batru_house_rental/data/models/type/type_response.dart';
import 'package:batru_house_rental/domain/entities/article/article_entity.dart';
import 'package:batru_house_rental/domain/entities/convenient/convenient_entity.dart';
import 'package:batru_house_rental/domain/entities/image_house/image_house_entity.dart';
import 'package:batru_house_rental/domain/entities/post/post_entity.dart';
import 'package:batru_house_rental/domain/entities/type/type_entity.dart';
import 'package:batru_house_rental/domain/use_case/article/get_article_filter_list_use_case.dart';
import 'package:batru_house_rental/domain/use_case/article/set_approve_article_use_case.dart';
import 'package:batru_house_rental/domain/use_case/post/remove_post_use_case.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ArticleRepository {
  final _fireStore = FirebaseFirestore.instance;

  // final List<ArticleEntity> _items = [];
  List<TypeResponse> _types = [];
  List<ConvenientResponse> _convenients = [];
  // List<ConvenientHouseResponse> _convenientHouses = [];
  // final List<ImageHouseResponse> _imageHouses = [];
  // final List<HouseResponse> _houses = [];

  Future<void> initData() async {
    await getTypes();
    await getConvenients();
    // await getConvenientHouses();
    // await getImageHouses();
    // await getHouses();
  }

  Future<void> getTypes() async {
    final types = await _fireStore.collection('type').get();
    _types = types.docs.map((e) => TypeResponse.fromJson(e.data())).toList();
  }

  // Future<void> getHouses() async {
  //   final houses = await _fireStore.collection('house').get();
  //   _houses = houses.docs.map((e) => HouseResponse.fromJson(e.data())).toList();
  // }

  Future<void> getConvenients() async {
    final convenients = await _fireStore.collection('convenient').get();
    _convenients = convenients.docs
        .map((e) => ConvenientResponse.fromJson(e.data()))
        .toList();
  }

  // Future<void> getConvenientHouses() async {
  //   final convenientHouses =
  //       await _fireStore.collection('convenientHouse').get();
  //   _convenientHouses = convenientHouses.docs
  //       .map((e) => ConvenientHouseResponse.fromJson(e.data()))
  //       .toList();
  // }

  // Future<void> getImageHouses() async {
  //   final imageHouses = await _fireStore.collection('imageHouse').get();
  //   _imageHouses = imageHouses.docs
  //       .map((e) => ImageHouseResponse.fromJson(e.data()))
  //       .toList();
  // }

  Future<ArticleEntity> getArticeById(String postId) async {
    final postSnapshot = await _fireStore.collection('post').doc(postId).get();

    final imageHouseSnapshot = await _fireStore
        .collection('imageHouse')
        .where('postId', isEqualTo: postId)
        .get();
    final convenientHouseSnapshot = await _fireStore
        .collection('convenientHouse')
        .where('postId', isEqualTo: postId)
        .get();
    final houseTypeSnapshot = await _fireStore
        .collection('houseType')
        .where('postId', isEqualTo: postId)
        .limit(1)
        .get();
    final postEntity = PostResponse.fromJson(postSnapshot.data()!).toEntity();
    final houseTypeResponse = houseTypeSnapshot.docs.map((e) {
      return HouseTypeResponse.fromJson(e.data());
    });

    final type = _types
        .firstWhere((element) => element.id == houseTypeResponse.first.typeId)
        .toEntity();

    final imageList = imageHouseSnapshot.docs
        .map(
          (e) => ImageHouseResponse.fromJson(e.data()).toEntity(),
        )
        .toList();
    //
    final convenienHouseResponse = convenientHouseSnapshot.docs
        .map(
          (e) => ConvenientHouseResponse.fromJson(e.data()),
        )
        .toList();

    final convenientList = convenienHouseResponse
        .map(
          (e) => _convenients
              .firstWhere((element) => element.id == e.convenientId)
              .toEntity(),
        )
        .toList();
    return ArticleEntity(
      id: postEntity.id,
      post: postEntity,
      imageList: imageList,
      convenientList: convenientList,
      type: type,
    );
  }

  Future<void> removeArticleById(RemovePostInput removePostInput) async {
    final postId = removePostInput.postId;
    final imageIdList = removePostInput.imageIdList;
    final convenientIdList = removePostInput.convenientIdList;
    final houseTypeId = removePostInput.houseTypeId;
    await _fireStore.collection('post').doc(postId).delete().then(
        (value) => debugPrint('Remove post: $postId'),
        onError: (e) => debugPrint('Error updating document $e'));

    await _fireStore.collection('houseType').doc(houseTypeId).delete().then(
        (value) => debugPrint('Remove houseType: $houseTypeId'),
        onError: (e) => debugPrint('Error updating document $e'));

    final addressList = await _fireStore
        .collection('address')
        .where('postId', isEqualTo: postId)
        .get();
    await Future.wait(addressList.docs.map((e) async {
      await _fireStore.collection('address').doc(e.id).delete().then(
          (value) => debugPrint('Remove address: ${e.id}'),
          onError: (e) => debugPrint('Error updating document $e'));
    }));

    await Future.wait(
      imageIdList.map((e) async {
        await _fireStore
            .collection('imageHouse')
            .doc(e)
            .delete()
            .then((value) => debugPrint('Remove image: $e'));
      }),
    );
    await Future.wait(
      convenientIdList.map((e) async {
        await _fireStore
            .collection('convenientHouse')
            .doc(e)
            .delete()
            .then((value) => debugPrint('Remove convenient: $e'));
      }),
    );
  }

  Future<void> approveArticleById(SetApprovedArticleInput input) async {
    final postId = input.postId;
    final adminId = input.adminId;

    await _fireStore.collection('post').doc(postId).update({
      'isApproved': true,
      'adminId': adminId,
    }).then(
      (value) => debugPrint('Approve post: $postId'),
      onError: (e) => debugPrint('Error updating document $e'),
    );
  }

  Future<void> rejectArticleById(String postId) async {
    await _fireStore.collection('post').doc(postId).update({
      'isApproved': false,
      'adminId': null,
    }).then(
      (value) => debugPrint('Reject post: $postId'),
      onError: (e) => debugPrint('Error updating document $e'),
    );
  }

  Future<List<ArticleEntity>> getApprovedArticles(int limit) async {
    final postSnapshot = await _fireStore
        .collection('post')
        .where('isApproved', isEqualTo: true)
        .limit(limit)
        .get();

    final articles = <ArticleEntity>[];
    try {
      for (final post in postSnapshot.docs) {
        PostEntity postEntity;
        TypeEntity type;
        List<ImageHouseEntity> imageList;
        List<ConvenientEntity> convenientList;
        try {
          final imageHouseSnapshot = await _fireStore
              .collection('imageHouse')
              .where('postId', isEqualTo: post.id)
              .get();
          final convenientHouseSnapshot = await _fireStore
              .collection('convenientHouse')
              .where('postId', isEqualTo: post.id)
              .get();
          final houseTypeSnapshot = await _fireStore
              .collection('houseType')
              .where('postId', isEqualTo: post.id)
              .limit(1)
              .get();
          postEntity = PostResponse.fromJson(post.data()).toEntity();
          final houseTypeResponse = houseTypeSnapshot.docs.map((e) {
            return HouseTypeResponse.fromJson(e.data());
          });

          type = _types
              .firstWhere(
                  (element) => element.id == houseTypeResponse.first.typeId)
              .toEntity();

          imageList = imageHouseSnapshot.docs
              .map(
                (e) => ImageHouseResponse.fromJson(e.data()).toEntity(),
              )
              .toList();
          //
          final convenienHouseResponse = convenientHouseSnapshot.docs
              .map(
                (e) => ConvenientHouseResponse.fromJson(e.data()),
              )
              .toList();

          convenientList = convenienHouseResponse
              .map(
                (e) => _convenients
                    .firstWhere((element) => element.id == e.convenientId)
                    .toEntity(),
              )
              .toList();
        } catch (e) {
          debugPrint(e.toString());
          continue;
        }

        articles.add(ArticleEntity(
          id: postEntity.id,
          post: postEntity,
          imageList: imageList,
          convenientList: convenientList,
          type: type,
        ));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    articles.sort((a, b) => b.id.compareTo(a.id));
    return articles;
  }

  Future<List<ArticleEntity>> getPenddingArticles(int limit) async {
    final postSnapshot = await _fireStore
        .collection('post')
        .where('isApproved', isEqualTo: false)
        .limit(limit)
        .get();

    final articles = <ArticleEntity>[];
    try {
      for (final post in postSnapshot.docs) {
        PostEntity postEntity;
        TypeEntity type;
        List<ImageHouseEntity> imageList;
        List<ConvenientEntity> convenientList;
        try {
          final imageHouseSnapshot = await _fireStore
              .collection('imageHouse')
              .where('postId', isEqualTo: post.id)
              .get();
          final convenientHouseSnapshot = await _fireStore
              .collection('convenientHouse')
              .where('postId', isEqualTo: post.id)
              .get();
          final houseTypeSnapshot = await _fireStore
              .collection('houseType')
              .where('postId', isEqualTo: post.id)
              .limit(1)
              .get();
          postEntity = PostResponse.fromJson(post.data()).toEntity();
          final houseTypeResponse = houseTypeSnapshot.docs.map((e) {
            return HouseTypeResponse.fromJson(e.data());
          });

          type = _types
              .firstWhere(
                  (element) => element.id == houseTypeResponse.first.typeId)
              .toEntity();

          imageList = imageHouseSnapshot.docs
              .map(
                (e) => ImageHouseResponse.fromJson(e.data()).toEntity(),
              )
              .toList();
          //
          final convenienHouseResponse = convenientHouseSnapshot.docs
              .map(
                (e) => ConvenientHouseResponse.fromJson(e.data()),
              )
              .toList();

          convenientList = convenienHouseResponse
              .map(
                (e) => _convenients
                    .firstWhere((element) => element.id == e.convenientId)
                    .toEntity(),
              )
              .toList();
        } catch (e) {
          debugPrint(e.toString());
          continue;
        }

        articles.add(ArticleEntity(
          id: postEntity.id,
          post: postEntity,
          imageList: imageList,
          convenientList: convenientList,
          type: type,
        ));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    articles.sort((a, b) => b.id.compareTo(a.id));
    return articles;
  }

  Future<List<ArticleEntity>> getArticlesByUserId(
    String userId, [
    bool isApproved = false,
  ]) async {
    final postSnapshot = await _fireStore
        .collection('post')
        .where('userId', isEqualTo: userId)
        .where('isApproved', isEqualTo: isApproved)
        .get();

    final articles = <ArticleEntity>[];
    try {
      for (final post in postSnapshot.docs) {
        PostEntity postEntity;
        TypeEntity type;
        List<ImageHouseEntity> imageList;
        List<ConvenientEntity> convenientList;
        try {
          final imageHouseSnapshot = await _fireStore
              .collection('imageHouse')
              .where('postId', isEqualTo: post.id)
              .get();
          final convenientHouseSnapshot = await _fireStore
              .collection('convenientHouse')
              .where('postId', isEqualTo: post.id)
              .get();
          final houseTypeSnapshot = await _fireStore
              .collection('houseType')
              .where('postId', isEqualTo: post.id)
              .limit(1)
              .get();
          postEntity = PostResponse.fromJson(post.data()).toEntity();
          final houseTypeResponse = houseTypeSnapshot.docs.map((e) {
            return HouseTypeResponse.fromJson(e.data());
          });

          type = _types
              .firstWhere(
                  (element) => element.id == houseTypeResponse.first.typeId)
              .toEntity();

          imageList = imageHouseSnapshot.docs
              .map(
                (e) => ImageHouseResponse.fromJson(e.data()).toEntity(),
              )
              .toList();
          //
          final convenienHouseResponse = convenientHouseSnapshot.docs
              .map(
                (e) => ConvenientHouseResponse.fromJson(e.data()),
              )
              .toList();

          convenientList = convenienHouseResponse
              .map(
                (e) => _convenients
                    .firstWhere((element) => element.id == e.convenientId)
                    .toEntity(),
              )
              .toList();
        } catch (e) {
          debugPrint(e.toString());
          continue;
        }

        articles.add(ArticleEntity(
          id: postEntity.id,
          post: postEntity,
          imageList: imageList,
          convenientList: convenientList,
          type: type,
        ));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    articles.sort((a, b) => b.id.compareTo(a.id));
    return articles;
  }

  Future<List<ArticleEntity>> getOwnerArticlesByUserId(String userId) async {
    final postSnapshot = await _fireStore
        .collection('post')
        .where('userId', isEqualTo: userId)
        .get();

    final articles = <ArticleEntity>[];
    try {
      for (final post in postSnapshot.docs) {
        PostEntity postEntity;
        TypeEntity type;
        List<ImageHouseEntity> imageList;
        List<ConvenientEntity> convenientList;
        try {
          final imageHouseSnapshot = await _fireStore
              .collection('imageHouse')
              .where('postId', isEqualTo: post.id)
              .get();
          final convenientHouseSnapshot = await _fireStore
              .collection('convenientHouse')
              .where('postId', isEqualTo: post.id)
              .get();
          final houseTypeSnapshot = await _fireStore
              .collection('houseType')
              .where('postId', isEqualTo: post.id)
              .limit(1)
              .get();
          postEntity = PostResponse.fromJson(post.data()).toEntity();
          final houseTypeResponse = houseTypeSnapshot.docs.map((e) {
            return HouseTypeResponse.fromJson(e.data());
          });

          type = _types
              .firstWhere(
                  (element) => element.id == houseTypeResponse.first.typeId)
              .toEntity();

          imageList = imageHouseSnapshot.docs
              .map(
                (e) => ImageHouseResponse.fromJson(e.data()).toEntity(),
              )
              .toList();
          //
          final convenienHouseResponse = convenientHouseSnapshot.docs
              .map(
                (e) => ConvenientHouseResponse.fromJson(e.data()),
              )
              .toList();

          convenientList = convenienHouseResponse
              .map(
                (e) => _convenients
                    .firstWhere((element) => element.id == e.convenientId)
                    .toEntity(),
              )
              .toList();
        } catch (e) {
          debugPrint(e.toString());
          continue;
        }

        articles.add(ArticleEntity(
          id: postEntity.id,
          post: postEntity,
          imageList: imageList,
          convenientList: convenientList,
          type: type,
        ));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    articles.sort((a, b) => b.id.compareTo(a.id));
    return articles;
  }

  Future<List<ArticleEntity>> getArticlesByFiled(
      ArticleFilterInput input) async {
    final addressSnapshot = await _fireStore
        .collection('address')
        .where('districtId', isEqualTo: input.districtId)
        .where('communeId', isEqualTo: input.communeId)
        .get();
    final addressResponse = addressSnapshot.docs.map((e) {
      return AddressResponse.fromJson(e.data());
    });
    final typeHouseSnapshot = await _fireStore
        .collection('houseType')
        .where('typeId', isEqualTo: input.typeId)
        .get();

    final typeHouseResponse = typeHouseSnapshot.docs.map((e) {
      return HouseTypeResponse.fromJson(e.data());
    });

    final articles = <ArticleEntity>[];
    for (final type in typeHouseResponse) {
      for (final address in addressResponse) {
        if (type.postId == address.postId) {
          final article = await getArticeById(address.postId);
          final rentalPrice = article.post?.rentalPrice ?? 0;
          final minPrice = input.minPrice ?? 0;
          final maxPrice = input.maxPrice ?? 1000000000;

          if (rentalPrice >= minPrice &&
              rentalPrice <= maxPrice &&
              article.post?.isApproved == true) {
            articles.add(article);
          }
        }
      }
    }
    articles.sort((a, b) => b.id.compareTo(a.id));
    return articles;
  }
}
