import 'package:cloud_firestore/cloud_firestore.dart';

class AddDistrictFirebase {
  static final _firestore = FirebaseFirestore.instance;

  static final list = [
    {
      'id': '001',
      'name': 'Quận Ba Đình',
      'provinceId': '01',
      'province': 'Hà Nội',
    },
    {
      'id': '005',
      'name': 'Quận Cầu Giấy',
      'provinceId': '01',
      'province': 'Hà Nội',
    },
    {
      'id': '006',
      'name': 'Quận Đống Đa',
      'provinceId': '01',
      'province': 'Hà Nội',
    },
    {
      'id': '007',
      'name': 'Quận Hai Bà Trưng',
      'provinceId': '01',
      'province': 'Hà Nội',
    },
    {
      'id': '002',
      'name': 'Quận Hoàn Kiếm',
      'provinceId': '01',
      'province': 'Hà Nội',
    },
    {
      'id': '008',
      'name': 'Quận Hoàng Mai',
      'provinceId': '01',
      'province': 'Hà Nội',
    },
    {
      'id': '003',
      'name': 'Quận Tây Hồ',
      'provinceId': '01',
      'province': 'Hà Nội',
    },
    {
      'id': '009',
      'name': 'Quận Thanh Xuân',
      'provinceId': '01',
      'province': 'Hà Nội',
    },
    {
      'id': '273',
      'name': 'Huyện Đan Phượng',
      'provinceId': '01',
      'province': 'Hà Nội',
    },
    {
      'id': '250',
      'name': 'Huyện Mê Linh',
      'provinceId': '01',
      'province': 'Hà Nội',
    },
    {
      'id': '272',
      'name': 'Huyện Phúc Thọ',
      'provinceId': '01',
      'province': 'Hà Nội',
    },
    {
      'id': '275',
      'name': 'Huyện Quốc Oai',
      'provinceId': '01',
      'province': 'Hà Nội',
    },
    {
      'id': '276',
      'name': 'Huyện Thạch Thất',
      'provinceId': '01',
      'province': 'Hà Nội',
    },
    {
      'id': '279',
      'name': 'Huyện Thường Tín',
      'provinceId': '01',
      'province': 'Hà Nội',
    },
    {
      'id': '271',
      'name': 'Huyện Ba Vì',
      'provinceId': '01',
      'province': 'Hà Nội',
    },
    {
      'id': '277',
      'name': 'Huyện Chương Mỹ',
      'provinceId': '01',
      'province': 'Hà Nội',
    },
    {
      'id': '017',
      'name': 'Huyện Đông Anh',
      'provinceId': '01',
      'province': 'Hà Nội',
    },
    {
      'id': '018',
      'name': 'Huyện Gia Lâm',
      'provinceId': '01',
      'province': 'Hà Nội',
    },
    {
      'id': '274',
      'name': 'Huyện Hoài Đức',
      'provinceId': '01',
      'province': 'Hà Nội',
    },
    {
      'id': '282',
      'name': 'Huyện Mỹ Đức',
      'provinceId': '01',
      'province': 'Hà Nội',
    },
    {
      'id': '280',
      'name': 'Huyện Phú Xuyên',
      'provinceId': '01',
      'province': 'Hà Nội',
    },
    {
      'id': '016',
      'name': 'Huyện Sóc Sơn',
      'provinceId': '01',
      'province': 'Hà Nội',
    },
    {
      'id': '278',
      'name': 'Huyện Thanh Oai',
      'provinceId': '01',
      'province': 'Hà Nội',
    },
    {
      'id': '020',
      'name': 'Huyện Thanh Trì',
      'provinceId': '01',
      'province': 'Hà Nội',
    },
    {
      'id': '281',
      'name': 'Huyện Ứng Hòa',
      'provinceId': '01',
      'province': 'Hà Nội',
    },
    {
      'id': '269',
      'name': 'Thị xã Sơn Tây',
      'provinceId': '01',
      'province': 'Hà Nội',
    },
    {
      'id': '021',
      'name': 'Quận Bắc Từ Liêm',
      'provinceId': '01',
      'province': 'Hà Nội',
    },
    {
      'id': '268',
      'name': 'Quận Hà Đông',
      'provinceId': '01',
      'province': 'Hà Nội',
    },
    {
      'id': '004',
      'name': 'Quận Long Biên',
      'provinceId': '01',
      'province': 'Hà Nội',
    },
    {
      'id': '019',
      'name': 'Quận Nam Từ Liêm',
      'provinceId': '01',
      'province': 'Hà Nội',
    }
  ];

  static void addDistrict() {
    for (final e in list) {
      _firestore.collection('district').doc(e['id']).set(e);
    }
  }
}
