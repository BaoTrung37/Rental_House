import 'package:batru_house_rental/data/models/address/address_reponse.dart';
import 'package:batru_house_rental/data/models/convenient/convenient_response.dart';
import 'package:batru_house_rental/data/models/convenient_house/convenient_house_reponse.dart';
import 'package:batru_house_rental/data/models/house/house_response.dart';
import 'package:batru_house_rental/data/models/house_type/house_type_response.dart';
import 'package:batru_house_rental/data/models/image_house/image_house_response.dart';
import 'package:batru_house_rental/data/models/type/type_response.dart';
import 'package:batru_house_rental/domain/entities/article/article_entity.dart';
import 'package:batru_house_rental/domain/entities/convenient/convenient_entity.dart';
import 'package:batru_house_rental/domain/entities/house/house_entity.dart';
import 'package:batru_house_rental/domain/entities/image_house/image_house_entity.dart';
import 'package:batru_house_rental/domain/entities/type/type_entity.dart';
import 'package:batru_house_rental/domain/use_case/article/get_article_filter_list_use_case.dart';
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

  Future<ArticleEntity> getArticeById(String houseId) async {
    final houseSnapshot =
        await _fireStore.collection('house').doc(houseId).get();

    final imageHouseSnapshot = await _fireStore
        .collection('imageHouse')
        .where('houseId', isEqualTo: houseId)
        .get();
    final convenientHouseSnapshot = await _fireStore
        .collection('convenientHouse')
        .where('houseId', isEqualTo: houseId)
        .get();
    final houseTypeSnapshot = await _fireStore
        .collection('houseType')
        .where('houseId', isEqualTo: houseId)
        .limit(1)
        .get();
    final houseEntity =
        HouseResponse.fromJson(houseSnapshot.data()!).toEntity();
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
      id: houseEntity.id,
      house: houseEntity,
      imageList: imageList,
      convenientList: convenientList,
      type: type,
    );
  }

  Future<void> removeArticleById(String houseId) async {
    await _fireStore.collection('house').doc(houseId).delete().then(
        (value) => debugPrint('Remove house: $houseId'),
        onError: (e) => debugPrint('Error updating document $e'));
    await _fireStore
        .collection('imageHouse')
        .where('houseId', isEqualTo: houseId)
        .get()
        .then(
          (value) => value.docs.map(
            (e) => _fireStore.collection('imageHouse').doc(e.id).delete(),
          ),
          onError: (e) => debugPrint('Error updating document $e'),
        );
    await _fireStore
        .collection('convenientHouse')
        .where('houseId', isEqualTo: houseId)
        .get()
        .then(
          (value) => value.docs.map(
            (e) => _fireStore.collection('convenientHouse').doc(e.id).delete(),
          ),
          onError: (e) => debugPrint('Error updating document $e'),
        );
    await _fireStore
        .collection('houseType')
        .where('houseId', isEqualTo: houseId)
        .get()
        .then(
          (value) => value.docs.map(
            (e) => _fireStore.collection('houseType').doc(e.id).delete(),
          ),
          onError: (e) => debugPrint('Error updating document $e'),
        );
  }

  Future<List<ArticleEntity>> getArticles(int limit) async {
    final houseSnapshot = await _fireStore
        .collection('house')
        .orderBy('createdAt', descending: true)
        .limit(limit)
        .get();

    final articles = <ArticleEntity>[];
    try {
      for (final house in houseSnapshot.docs) {
        HouseEntity houseEntity;
        TypeEntity type;
        List<ImageHouseEntity> imageList;
        List<ConvenientEntity> convenientList;
        try {
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
              .limit(1)
              .get();
          houseEntity = HouseResponse.fromJson(house.data()).toEntity();
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
          id: houseEntity.id,
          house: houseEntity,
          imageList: imageList,
          convenientList: convenientList,
          type: type,
        ));
      }
    } catch (e) {
      debugPrint(e.toString());
    }

    return articles;
  }

  Future<List<ArticleEntity>> getArticlesByUserId(String userId) async {
    final houseSnapshot = await _fireStore
        .collection('house')
        .where('userId', isEqualTo: userId)
        .get();

    final articles = <ArticleEntity>[];
    try {
      for (final house in houseSnapshot.docs) {
        HouseEntity houseEntity;
        TypeEntity type;
        List<ImageHouseEntity> imageList;
        List<ConvenientEntity> convenientList;
        try {
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
              .limit(1)
              .get();
          houseEntity = HouseResponse.fromJson(house.data()).toEntity();
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
          id: houseEntity.id,
          house: houseEntity,
          imageList: imageList,
          convenientList: convenientList,
          type: type,
        ));
      }
    } catch (e) {
      debugPrint(e.toString());
    }

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
    final articles = <ArticleEntity>[];
    for (final address in addressResponse) {
      final house = await getArticeById(address.houseId);
      articles.add(house);
    }
    return articles;
  }
}
