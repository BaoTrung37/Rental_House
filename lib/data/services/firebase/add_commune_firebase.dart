import 'package:cloud_firestore/cloud_firestore.dart';

class AddCommuneFirebase {
  static final _firestore = FirebaseFirestore.instance;

  static final list = [
    {
      'id': '00007',
      'name': 'Phường Cống Vị',
      'districtId': '001',
      'district': 'Quận Ba Đình',
    },
    {
      'id': '00019',
      'name': 'Phường Điện Biên',
      'districtId': '001',
      'district': 'Quận Ba Đình',
    },
    {
      'id': '00022',
      'name': 'Phường Đội Cấn',
      'districtId': '001',
      'district': 'Quận Ba Đình',
    },
    {
      'id': '00031',
      'name': 'Phường Giảng Võ',
      'districtId': '001',
      'district': 'Quận Ba Đình',
    },
    {
      'id': '00028',
      'name': 'Phường Kim Mã',
      'districtId': '001',
      'district': 'Quận Ba Đình',
    },
    {
      'id': '00008',
      'name': 'Phường Liễu Giai',
      'districtId': '001',
      'district': 'Quận Ba Đình',
    },
    {
      'id': '00016',
      'name': 'Phường Ngọc Hà',
      'districtId': '001',
      'district': 'Quận Ba Đình',
    },
    {
      'id': '00025',
      'name': 'Phường Ngọc Khánh',
      'districtId': '001',
      'district': 'Quận Ba Đình',
    },
    {
      'id': '00010',
      'name': 'Phường Nguyễn Trung Trực',
      'districtId': '001',
      'district': 'Quận Ba Đình',
    },
    {
      'id': '00001',
      'name': 'Phường Phúc Xá',
      'districtId': '001',
      'district': 'Quận Ba Đình',
    },
    {
      'id': '00013',
      'name': 'Phường Quán Thánh',
      'districtId': '001',
      'district': 'Quận Ba Đình',
    },
    {
      'id': '00034',
      'name': 'Phường Thành Công',
      'districtId': '001',
      'district': 'Quận Ba Đình',
    },
    {
      'id': '00004',
      'name': 'Phường Trúc Bạch',
      'districtId': '001',
      'district': 'Quận Ba Đình',
    },
    {
      'id': '00006',
      'name': 'Phường Vĩnh Phúc',
      'districtId': '001',
      'district': 'Quận Ba Đình',
    },
    // ------------------------------- //
    {
      'id': '00067',
      'name': 'Phường Chương Dương Độ',
      'districtId': '002',
      'district': 'Quận Hoàn Kiếm',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00055',
      'name': 'Phường Cửa Đông',
      'districtId': '002',
      'district': 'Quận Hoàn Kiếm',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00073',
      'name': 'Phường Cửa Nam',
      'districtId': '002',
      'district': 'Quận Hoàn Kiếm',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00040',
      'name': 'Phường Đồng Xuân',
      'districtId': '002',
      'district': 'Quận Hoàn Kiếm',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00061',
      'name': 'Phường Hàng Bạc',
      'districtId': '002',
      'district': 'Quận Hoàn Kiếm',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00088',
      'name': 'Phường Hàng Bài',
      'districtId': '002',
      'district': 'Quận Hoàn Kiếm',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00052',
      'name': 'Phường Hàng Bồ',
      'districtId': '002',
      'district': 'Quận Hoàn Kiếm',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00076',
      'name': 'Phường Hàng Bông',
      'districtId': '002',
      'district': 'Quận Hoàn Kiếm',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00046',
      'name': 'Phường Hàng Buồm',
      'districtId': '002',
      'district': 'Quận Hoàn Kiếm',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00049',
      'name': 'Phường Hàng Đào',
      'districtId': '002',
      'district': 'Quận Hoàn Kiếm',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00064',
      'name': 'Phường Hàng Gai',
      'districtId': '002',
      'district': 'Quận Hoàn Kiếm',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00043',
      'name': 'Phường Hàng Mã',
      'districtId': '002',
      'district': 'Quận Hoàn Kiếm',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00070',
      'name': 'Phường Hàng Trống',
      'districtId': '002',
      'district': 'Quận Hoàn Kiếm',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00058',
      'name': 'Phường Lý Thái Tổ',
      'districtId': '002',
      'district': 'Quận Hoàn Kiếm',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00085',
      'name': 'Phường Phan Chu Trinh',
      'districtId': '002',
      'district': 'Quận Hoàn Kiếm',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00037',
      'name': 'Phường Phúc Tân',
      'districtId': '002',
      'district': 'Quận Hoàn Kiếm',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00082',
      'name': 'Phường Trần Hưng Đạo',
      'districtId': '002',
      'district': 'Quận Hoàn Kiếm',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00079',
      'name': 'Phường Tràng Tiền',
      'districtId': '002',
      'district': 'Quận Hoàn Kiếm',
      'province': 'Thành phố Hà Nội'
    },
    // ----//
    {
      'id': '00109',
      'name': 'Phường Bưởi',
      'districtId': '003',
      'district': 'Quận Tây Hồ',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00094',
      'name': 'Phường Nhật Tân',
      'districtId': '003',
      'district': 'Quận Tây Hồ',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00091',
      'name': 'Phường Phú Thượng',
      'districtId': '003',
      'district': 'Quận Tây Hồ',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00100',
      'name': 'Phường Quảng An',
      'districtId': '003',
      'district': 'Quận Tây Hồ',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00112',
      'name': 'Phường Thụy Khuê',
      'districtId': '003',
      'district': 'Quận Tây Hồ',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00097',
      'name': 'Phường Tứ Liên',
      'districtId': '003',
      'district': 'Quận Tây Hồ',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00103',
      'name': 'Phường Xuân La',
      'districtId': '003',
      'district': 'Quận Tây Hồ',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00106',
      'name': 'Phường Yên Phụ',
      'districtId': '003',
      'district': 'Quận Tây Hồ',
      'province': 'Thành phố Hà Nội'
    },
    // ------//
    {
      'id': '00139',
      'name': 'Phường Bồ Đề',
      'districtId': '004',
      'district': 'Quận Long Biên',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00154',
      'name': 'Phường Cự Khối',
      'districtId': '004',
      'district': 'Quận Long Biên',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00124',
      'name': 'Phường Đức Giang',
      'districtId': '004',
      'district': 'Quận Long Biên',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00130',
      'name': 'Phường Gia Thụy',
      'districtId': '004',
      'district': 'Quận Long Biên',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00121',
      'name': 'Phường Giang Biên',
      'districtId': '004',
      'district': 'Quận Long Biên',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00145',
      'name': 'Phường Long Biên',
      'districtId': '004',
      'district': 'Quận Long Biên',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00133',
      'name': 'Phường Ngọc Lâm',
      'districtId': '004',
      'district': 'Quận Long Biên',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00118',
      'name': 'Phường Ngọc Thụy',
      'districtId': '004',
      'district': 'Quận Long Biên',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00151',
      'name': 'Phường Phúc Đồng',
      'districtId': '004',
      'district': 'Quận Long Biên',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00136',
      'name': 'Phường Phúc Lợi',
      'districtId': '004',
      'district': 'Quận Long Biên',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00142',
      'name': 'Phường Sài Đồng',
      'districtId': '004',
      'district': 'Quận Long Biên',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00148',
      'name': 'Phường Thạch Bàn',
      'districtId': '004',
      'district': 'Quận Long Biên',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00115',
      'name': 'Phường Thượng Thanh',
      'districtId': '004',
      'district': 'Quận Long Biên',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00127',
      'name': 'Phường Việt Hưng',
      'districtId': '004',
      'district': 'Quận Long Biên',
      'province': 'Thành phố Hà Nội'
    },
    // ---------//
    {
      'id': '00166',
      'name': 'Phường Dịch Vọng',
      'districtId': '005',
      'district': 'Quận Cầu Giấy',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00167',
      'name': 'Phường Dịch Vọng Hậu',
      'districtId': '005',
      'district': 'Quận Cầu Giấy',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00163',
      'name': 'Phường Mai Dịch',
      'districtId': '005',
      'district': 'Quận Cầu Giấy',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00157',
      'name': 'Phường Nghĩa Đô',
      'districtId': '005',
      'district': 'Quận Cầu Giấy',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00160',
      'name': 'Phường Nghĩa Tân',
      'districtId': '005',
      'district': 'Quận Cầu Giấy',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00169',
      'name': 'Phường Quan Hoa',
      'districtId': '005',
      'district': 'Quận Cầu Giấy',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00175',
      'name': 'Phường Trung Hoà',
      'districtId': '005',
      'district': 'Quận Cầu Giấy',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00172',
      'name': 'Phường Yên Hoà',
      'districtId': '005',
      'district': 'Quận Cầu Giấy',
      'province': 'Thành phố Hà Nội'
    },
    // -------  //

    {
      'id': '00178',
      'name': 'Phường Cát Linh',
      'districtId': '006',
      'district': 'Quận Đống Đa',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00196',
      'name': 'Phường Hàng Bột',
      'districtId': '006',
      'district': 'Quận Đống Đa',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00202',
      'name': 'Phường Khâm Thiên',
      'districtId': '006',
      'district': 'Quận Đống Đa',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00238',
      'name': 'Phường Khương Thượng',
      'districtId': '006',
      'district': 'Quận Đống Đa',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00229',
      'name': 'Phường Kim Liên',
      'districtId': '006',
      'district': 'Quận Đống Đa',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00199',
      'name': 'Phường Láng Hạ',
      'districtId': '006',
      'district': 'Quận Đống Đa',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00187',
      'name': 'Phường Láng Thượng',
      'districtId': '006',
      'district': 'Quận Đống Đa',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00208',
      'name': 'Phường Nam Đồng',
      'districtId': '006',
      'district': 'Quận Đống Đa',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00235',
      'name': 'Phường Ngã Tư Sở',
      'districtId': '006',
      'district': 'Quận Đống Đa',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00190',
      'name': 'Phường Ô Chợ Dừa',
      'districtId': '006',
      'district': 'Quận Đống Đa',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00220',
      'name': 'Phường Phương Liên',
      'districtId': '006',
      'district': 'Quận Đống Đa',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00232',
      'name': 'Phường Phương Mai',
      'districtId': '006',
      'district': 'Quận Đống Đa',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00214',
      'name': 'Phường Quang Trung',
      'districtId': '006',
      'district': 'Quận Đống Đa',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00184',
      'name': 'Phường Quốc Tử Giám',
      'districtId': '006',
      'district': 'Quận Đống Đa',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00223',
      'name': 'Phường Thịnh Quang',
      'districtId': '006',
      'district': 'Quận Đống Đa',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00205',
      'name': 'Phường Thổ Quan',
      'districtId': '006',
      'district': 'Quận Đống Đa',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00217',
      'name': 'Phường Trung Liệt',
      'districtId': '006',
      'district': 'Quận Đống Đa',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00211',
      'name': 'Phường Trung Phụng',
      'districtId': '006',
      'district': 'Quận Đống Đa',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00226',
      'name': 'Phường Trung Tự',
      'districtId': '006',
      'district': 'Quận Đống Đa',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00193',
      'name': 'Phường Văn Chương',
      'districtId': '006',
      'district': 'Quận Đống Đa',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00181',
      'name': 'Phường Văn Miếu',
      'districtId': '006',
      'district': 'Quận Đống Đa',
      'province': 'Thành phố Hà Nội'
    },
    // ----- 007
    {
      'id': '00244',
      'name': 'Phường Bạch Đằng',
      'districtId': '007',
      'district': 'Quận Hai Bà Trưng',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00277',
      'name': 'Phường Bách Khoa',
      'districtId': '007',
      'district': 'Quận Hai Bà Trưng',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00286',
      'name': 'Phường Bạch Mai',
      'districtId': '007',
      'district': 'Quận Hai Bà Trưng',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00250',
      'name': 'Phường Bùi Thị Xuân',
      'districtId': '007',
      'district': 'Quận Hai Bà Trưng',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00274',
      'name': 'Phường Cầu Dền',
      'districtId': '007',
      'district': 'Quận Hai Bà Trưng',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00265',
      'name': 'Phường Đống Mác',
      'districtId': '007',
      'district': 'Quận Hai Bà Trưng',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00259',
      'name': 'Phường Đồng Nhân',
      'districtId': '007',
      'district': 'Quận Hai Bà Trưng',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00280',
      'name': 'Phường Đồng Tâm',
      'districtId': '007',
      'district': 'Quận Hai Bà Trưng',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00256',
      'name': 'Phường Lê Đại Hành',
      'districtId': '007',
      'district': 'Quận Hai Bà Trưng',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00295',
      'name': 'Phường Minh Khai',
      'districtId': '007',
      'district': 'Quận Hai Bà Trưng',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00253',
      'name': 'Phường Ngô Thì Nhậm',
      'districtId': '007',
      'district': 'Quận Hai Bà Trưng',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00241',
      'name': 'Phường Nguyễn Du',
      'districtId': '007',
      'district': 'Quận Hai Bà Trưng',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00247',
      'name': 'Phường Phạm Đình Hổ',
      'districtId': '007',
      'district': 'Quận Hai Bà Trưng',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00262',
      'name': 'Phường Phố Huế',
      'districtId': '007',
      'district': 'Quận Hai Bà Trưng',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00292',
      'name': 'Phường Quỳnh Lôi',
      'districtId': '007',
      'district': 'Quận Hai Bà Trưng',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00289',
      'name': 'Phường Quỳnh Mai',
      'districtId': '007',
      'district': 'Quận Hai Bà Trưng',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00268',
      'name': 'Phường Thanh Lương',
      'districtId': '007',
      'district': 'Quận Hai Bà Trưng',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00271',
      'name': 'Phường Thanh Nhàn',
      'districtId': '007',
      'district': 'Quận Hai Bà Trưng',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00298',
      'name': 'Phường Trương Định',
      'districtId': '007',
      'district': 'Quận Hai Bà Trưng',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00283',
      'name': 'Phường Vĩnh Tuy',
      'districtId': '007',
      'district': 'Quận Hai Bà Trưng',
      'province': 'Thành phố Hà Nội'
    },
    // ---- 008
    {
      'id': '00316',
      'name': 'Phường Đại Kim',
      'districtId': '008',
      'district': 'Quận Hoàng Mai',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00307',
      'name': 'Phường Định Công',
      'districtId': '008',
      'district': 'Quận Hoàng Mai',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00325',
      'name': 'Phường Giáp Bát',
      'districtId': '008',
      'district': 'Quận Hoàng Mai',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00337',
      'name': 'Phường Hoàng Liệt',
      'districtId': '008',
      'district': 'Quận Hoàng Mai',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00322',
      'name': 'Phường Hoàng Văn Thụ',
      'districtId': '008',
      'district': 'Quận Hoàng Mai',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00328',
      'name': 'Phường Lĩnh Nam',
      'districtId': '008',
      'district': 'Quận Hoàng Mai',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00310',
      'name': 'Phường Mai Động',
      'districtId': '008',
      'district': 'Quận Hoàng Mai',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00319',
      'name': 'Phường Tân Mai',
      'districtId': '008',
      'district': 'Quận Hoàng Mai',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00301',
      'name': 'Phường Thanh Trì',
      'districtId': '008',
      'district': 'Quận Hoàng Mai',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00331',
      'name': 'Phường Thịnh Liệt',
      'districtId': '008',
      'district': 'Quận Hoàng Mai',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00334',
      'name': 'Phường Trần Phú',
      'districtId': '008',
      'district': 'Quận Hoàng Mai',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00313',
      'name': 'Phường Tương Mai',
      'districtId': '008',
      'district': 'Quận Hoàng Mai',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00304',
      'name': 'Phường Vĩnh Hưng',
      'districtId': '008',
      'district': 'Quận Hoàng Mai',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00340',
      'name': 'Phường Yên Sở',
      'districtId': '008',
      'district': 'Quận Hoàng Mai',
      'province': 'Thành phố Hà Nội'
    },
    // 009
    {
      'id': '00361',
      'name': 'Phường Hạ Đình',
      'districtId': '009',
      'district': 'Quận Thanh Xuân',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00364',
      'name': 'Phường Khương Đình',
      'districtId': '009',
      'district': 'Quận Thanh Xuân',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00352',
      'name': 'Phường Khương Mai',
      'districtId': '009',
      'district': 'Quận Thanh Xuân',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00349',
      'name': 'Phường Khương Trung',
      'districtId': '009',
      'district': 'Quận Thanh Xuân',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00373',
      'name': 'Phường Kim Giang',
      'districtId': '009',
      'district': 'Quận Thanh Xuân',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00343',
      'name': 'Phường Nhân Chính',
      'districtId': '009',
      'district': 'Quận Thanh Xuân',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00358',
      'name': 'Phường Phương Liệt',
      'districtId': '009',
      'district': 'Quận Thanh Xuân',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00367',
      'name': 'Phường Thanh Xuân Bắc',
      'districtId': '009',
      'district': 'Quận Thanh Xuân',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00370',
      'name': 'Phường Thanh Xuân Nam',
      'districtId': '009',
      'district': 'Quận Thanh Xuân',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00355',
      'name': 'Phường Thanh Xuân Trung',
      'districtId': '009',
      'district': 'Quận Thanh Xuân',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00346',
      'name': 'Phường Thượng Đình',
      'districtId': '009',
      'district': 'Quận Thanh Xuân',
      'province': 'Thành phố Hà Nội'
    },

    /// 016
    {
      'id': '00376',
      'name': 'Thị trấn Sóc Sơn',
      'districtId': '016',
      'district': 'Huyện Sóc Sơn',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00403',
      'name': 'Xã Bắc Phú',
      'districtId': '016',
      'district': 'Huyện Sóc Sơn',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00379',
      'name': 'Xã Bắc Sơn',
      'districtId': '016',
      'district': 'Huyện Sóc Sơn',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00436',
      'name': 'Xã Đông Xuân',
      'districtId': '016',
      'district': 'Huyện Sóc Sơn',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00430',
      'name': 'Xã Đức Hoà',
      'districtId': '016',
      'district': 'Huyện Sóc Sơn',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00412',
      'name': 'Xã Hiền Ninh',
      'districtId': '016',
      'district': 'Huyện Sóc Sơn',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00385',
      'name': 'Xã Hồng Kỳ',
      'districtId': '016',
      'district': 'Huyện Sóc Sơn',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00439',
      'name': 'Xã Kim Lũ',
      'districtId': '016',
      'district': 'Huyện Sóc Sơn',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00427',
      'name': 'Xã Mai Đình',
      'districtId': '016',
      'district': 'Huyện Sóc Sơn',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00397',
      'name': 'Xã Minh Phú',
      'districtId': '016',
      'district': 'Huyện Sóc Sơn',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00382',
      'name': 'Xã Minh Trí',
      'districtId': '016',
      'district': 'Huyện Sóc Sơn',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00388',
      'name': 'Xã Nam Sơn',
      'districtId': '016',
      'district': 'Huyện Sóc Sơn',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00442',
      'name': 'Xã Phú Cường',
      'districtId': '016',
      'district': 'Huyện Sóc Sơn',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00400',
      'name': 'Xã Phù Linh',
      'districtId': '016',
      'district': 'Huyện Sóc Sơn',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00448',
      'name': 'Xã Phù Lỗ',
      'districtId': '016',
      'district': 'Huyện Sóc Sơn',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00445',
      'name': 'Xã Phú Minh',
      'districtId': '016',
      'district': 'Huyện Sóc Sơn',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00409',
      'name': 'Xã Quang Tiến',
      'districtId': '016',
      'district': 'Huyện Sóc Sơn',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00415',
      'name': 'Xã Tân Dân',
      'districtId': '016',
      'district': 'Huyện Sóc Sơn',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00394',
      'name': 'Xã Tân Hưng',
      'districtId': '016',
      'district': 'Huyện Sóc Sơn',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00406',
      'name': 'Xã Tân Minh',
      'districtId': '016',
      'district': 'Huyện Sóc Sơn',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00433',
      'name': 'Xã Thanh Xuân',
      'districtId': '016',
      'district': 'Huyện Sóc Sơn',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00418',
      'name': 'Xã Tiên Dược',
      'districtId': '016',
      'district': 'Huyện Sóc Sơn',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00391',
      'name': 'Xã Trung Giã',
      'districtId': '016',
      'district': 'Huyện Sóc Sơn',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00421',
      'name': 'Xã Việt Long',
      'districtId': '016',
      'district': 'Huyện Sóc Sơn',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00424',
      'name': 'Xã Xuân Giang',
      'districtId': '016',
      'district': 'Huyện Sóc Sơn',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00451',
      'name': 'Xã Xuân Thu',
      'districtId': '016',
      'district': 'Huyện Sóc Sơn',
      'province': 'Thành phố Hà Nội'
    },
    // 017
    {
      'id': '00454',
      'name': 'Thị trấn Đông Anh',
      'districtId': '01',
      'district': 'Huyện Đông Anh',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00463',
      'name': 'Xã Bắc Hồng',
      'districtId': '01',
      'district': 'Huyện Đông Anh',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00505',
      'name': 'Xã Cổ Loa',
      'districtId': '01',
      'district': 'Huyện Đông Anh',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00496',
      'name': 'Xã Dục Tú',
      'districtId': '017',
      'district': 'Huyện Đông Anh',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00499',
      'name': 'Xã Đại Mạch',
      'districtId': '017',
      'district': 'Huyện Đông Anh',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00523',
      'name': 'Xã Đông Hội',
      'districtId': '017',
      'district': 'Huyện Đông Anh',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00508',
      'name': 'Xã Hải Bối',
      'districtId': '017',
      'district': 'Huyện Đông Anh',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00493',
      'name': 'Xã Kim Chung',
      'districtId': '017',
      'district': 'Huyện Đông Anh',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00490',
      'name': 'Xã Kim Nỗ',
      'districtId': '017',
      'district': 'Huyện Đông Anh',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00484',
      'name': 'Xã Liên Hà',
      'districtId': '017',
      'district': 'Huyện Đông Anh',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00520',
      'name': 'Xã Mai Lâm',
      'districtId': '017',
      'district': 'Huyện Đông Anh',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00469',
      'name': 'Xã Nam Hồng',
      'districtId': '017',
      'district': 'Huyện Đông Anh',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00466',
      'name': 'Xã Nguyên Khê',
      'districtId': '017',
      'district': 'Huyện Đông Anh',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00517',
      'name': 'Xã Tầm Xá',
      'districtId': '017',
      'district': 'Huyện Đông Anh',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00460',
      'name': 'Xã Thuỵ Lâm',
      'districtId': '017',
      'district': 'Huyện Đông Anh',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00472',
      'name': 'Xã Tiên Dương',
      'districtId': '017',
      'district': 'Huyện Đông Anh',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00478',
      'name': 'Xã Uy Nỗ',
      'districtId': '017',
      'district': 'Huyện Đông Anh',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00475',
      'name': 'Xã Vân Hà',
      'districtId': '017',
      'district': 'Huyện Đông Anh',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00481',
      'name': 'Xã Vân Nội',
      'districtId': '017',
      'district': 'Huyện Đông Anh',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00487',
      'name': 'Xã Việt Hùng',
      'districtId': '017',
      'district': 'Huyện Đông Anh',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00502',
      'name': 'Xã Vĩnh Ngọc',
      'districtId': '017',
      'district': 'Huyện Đông Anh',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00514',
      'name': 'Xã Võng La',
      'districtId': '017',
      'district': 'Huyện Đông Anh',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00511',
      'name': 'Xã Xuân Canh',
      'districtId': '017',
      'district': 'Huyện Đông Anh',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00457',
      'name': 'Xã Xuân Nộn',
      'districtId': '017',
      'district': 'Huyện Đông Anh',
      'province': 'Thành phố Hà Nội'
    },
    //
    {
      'id': '00565',
      'name': 'Thị trấn Trâu Quỳ',
      'districtId': '018',
      'district': 'Huyện Gia Lâm',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00526',
      'name': 'Thị trấn Yên Viên',
      'districtId': '018',
      'district': 'Huyện Gia Lâm',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00583',
      'name': 'Xã Bát Tràng',
      'districtId': '018',
      'district': 'Huyện Gia Lâm',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00553',
      'name': 'Xã Cổ Bi',
      'districtId': '018',
      'district': 'Huyện Gia Lâm',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00541',
      'name': 'Xã Dương Hà',
      'districtId': '018',
      'district': 'Huyện Gia Lâm',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00568',
      'name': 'Xã Dương Quang',
      'districtId': '018',
      'district': 'Huyện Gia Lâm',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00571',
      'name': 'Xã Dương Xá',
      'districtId': '018',
      'district': 'Huyện Gia Lâm',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00577',
      'name': 'Xã Đa Tốn',
      'districtId': '018',
      'district': 'Huyện Gia Lâm',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00556',
      'name': 'Xã Đặng Xá',
      'districtId': '018',
      'district': 'Huyện Gia Lâm',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00538',
      'name': 'Xã Đình Xuyên',
      'districtId': '018',
      'district': 'Huyện Gia Lâm',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00574',
      'name': 'Xã Đông Dư',
      'districtId': '018',
      'district': 'Huyện Gia Lâm',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00580',
      'name': 'Xã Kiêu Kỵ',
      'districtId': '018',
      'district': 'Huyện Gia Lâm',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00586',
      'name': 'Xã Kim Lan',
      'districtId': '018',
      'district': 'Huyện Gia Lâm',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00562',
      'name': 'Xã Kim Sơn',
      'districtId': '018',
      'district': 'Huyện Gia Lâm',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00550',
      'name': 'Xã Lệ Chi',
      'districtId': '018',
      'district': 'Huyện Gia Lâm',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00535',
      'name': 'Xã Ninh Hiệp',
      'districtId': '018',
      'district': 'Huyện Gia Lâm',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00544',
      'name': 'Xã Phù Đổng',
      'districtId': '018',
      'district': 'Huyện Gia Lâm',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00559',
      'name': 'Xã Phú Thị',
      'districtId': '018',
      'district': 'Huyện Gia Lâm',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00547',
      'name': 'Xã Trung Mầu',
      'districtId': '018',
      'district': 'Huyện Gia Lâm',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00589',
      'name': 'Xã Văn Đức',
      'districtId': '018',
      'district': 'Huyện Gia Lâm',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00529',
      'name': 'Xã Yên Thường',
      'districtId': '018',
      'district': 'Huyện Gia Lâm',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00532',
      'name': 'Xã Yên Viên',
      'districtId': '018',
      'district': 'Huyện Gia Lâm',
      'province': 'Thành phố Hà Nội'
    },
    // ----
    {
      'id': '00592',
      'name': 'Phường Cầu Diễn',
      'districtId': '019',
      'district': 'Quận Nam Từ Liêm',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00634',
      'name': 'Phường Đại Mỗ',
      'districtId': '019',
      'district': 'Quận Nam Từ Liêm',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00631',
      'name': 'Phường Mễ Trì',
      'districtId': '019',
      'district': 'Quận Nam Từ Liêm',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00625',
      'name': 'Phường Mỹ Đình 1',
      'districtId': '019',
      'district': 'Quận Nam Từ Liêm',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00626',
      'name': 'Phường Mỹ Đình 2',
      'districtId': '019',
      'district': 'Quận Nam Từ Liêm',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00632',
      'name': 'Phường Phú Đô',
      'districtId': '019',
      'district': 'Quận Nam Từ Liêm',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00623',
      'name': 'Phường Phương Canh',
      'districtId': '019',
      'district': 'Quận Nam Từ Liêm',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00628',
      'name': 'Phường Tây Mỗ',
      'districtId': '019',
      'district': 'Quận Nam Từ Liêm',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00637',
      'name': 'Phường Trung Văn',
      'districtId': '019',
      'district': 'Quận Nam Từ Liêm',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00622',
      'name': 'Phường Xuân Phương',
      'districtId': '019',
      'district': 'Quận Nam Từ Liêm',
      'province': 'Thành phố Hà Nội'
    },
    // 020
    {
      'id': '00640',
      'name': 'Thị trấn Văn Điển',
      'districtId': '020',
      'district': 'Huyện Thanh Trì',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00670',
      'name': 'Xã Duyên Hà',
      'districtId': '020',
      'district': 'Huyện Thanh Trì',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00679',
      'name': 'Xã Đại áng',
      'districtId': '020',
      'district': 'Huyện Thanh Trì',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00685',
      'name': 'Xã Đông Mỹ',
      'districtId': '020',
      'district': 'Huyện Thanh Trì',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00652',
      'name': 'Xã Hữu Hoà',
      'districtId': '020',
      'district': 'Huyện Thanh Trì',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00682',
      'name': 'Xã Liên Ninh',
      'districtId': '020',
      'district': 'Huyện Thanh Trì',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00673',
      'name': 'Xã Ngọc Hồi',
      'districtId': '020',
      'district': 'Huyện Thanh Trì',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00667',
      'name': 'Xã Ngũ Hiệp',
      'districtId': '020',
      'district': 'Huyện Thanh Trì',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00649',
      'name': 'Xã Tả Thanh Oai',
      'districtId': '020',
      'district': 'Huyện Thanh Trì',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00655',
      'name': 'Xã Tam Hiệp',
      'districtId': '020',
      'district': 'Huyện Thanh Trì',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00643',
      'name': 'Xã Tân Triều',
      'districtId': '020',
      'district': 'Huyện Thanh Trì',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00646',
      'name': 'Xã Thanh Liệt',
      'districtId': '020',
      'district': 'Huyện Thanh Trì',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00658',
      'name': 'Xã Tứ Hiệp',
      'districtId': '020',
      'district': 'Huyện Thanh Trì',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00676',
      'name': 'Xã Vạn Phúc',
      'districtId': '020',
      'district': 'Huyện Thanh Trì',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00664',
      'name': 'Xã Vĩnh Quỳnh',
      'districtId': '020',
      'district': 'Huyện Thanh Trì',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00661',
      'name': 'Xã Yên Mỹ',
      'districtId': '020',
      'district': 'Huyện Thanh Trì',
      'province': 'Thành phố Hà Nội'
    },
    // 021
    {
      'id': '00616',
      'name': 'Phường Cổ Nhuế 1',
      'districtId': '021',
      'district': 'Quận Bắc Từ Liêm',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00617',
      'name': 'Phường Cổ Nhuế 2',
      'districtId': '021',
      'district': 'Quận Bắc Từ Liêm',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00601',
      'name': 'Phường Đông Ngạc',
      'districtId': '021',
      'district': 'Quận Bắc Từ Liêm',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00602',
      'name': 'Phường Đức Thắng',
      'districtId': '021',
      'district': 'Quận Bắc Từ Liêm',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00598',
      'name': 'Phường Liên Mạc',
      'districtId': '021',
      'district': 'Quận Bắc Từ Liêm',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00613',
      'name': 'Phường Minh Khai',
      'districtId': '021',
      'district': 'Quận Bắc Từ Liêm',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00619',
      'name': 'Phường Phú Diễn',
      'districtId': '021',
      'district': 'Quận Bắc Từ Liêm',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00620',
      'name': 'Phường Phúc Diễn',
      'districtId': '021',
      'district': 'Quận Bắc Từ Liêm',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00607',
      'name': 'Phường Tây Tựu',
      'districtId': '021',
      'district': 'Quận Bắc Từ Liêm',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00595',
      'name': 'Phường Thượng Cát',
      'districtId': '021',
      'district': 'Quận Bắc Từ Liêm',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00604',
      'name': 'Phường Thụy Phương',
      'districtId': '021',
      'district': 'Quận Bắc Từ Liêm',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00610',
      'name': 'Phường Xuân Đỉnh',
      'districtId': '021',
      'district': 'Quận Bắc Từ Liêm',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '00611',
      'name': 'Phường Xuân Tảo',
      'districtId': '021',
      'district': 'Quận Bắc Từ Liêm',
      'province': 'Thành phố Hà Nội'
    },

    // 250
    {
      'id': '08973',
      'name': 'Thị trấn Chi Đông',
      'districtId': '250',
      'district': 'Huyện Mê Linh',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '08989',
      'name': 'Thị trấn Quang Minh',
      'districtId': '250',
      'district': 'Huyện Mê Linh',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09004',
      'name': 'Xã Chu Phan',
      'districtId': '250',
      'district': 'Huyện Mê Linh',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '08974',
      'name': 'Xã Đại Thịnh',
      'districtId': '250',
      'district': 'Huyện Mê Linh',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09016',
      'name': 'Xã Hoàng Kim',
      'districtId': '250',
      'district': 'Huyện Mê Linh',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '08977',
      'name': 'Xã Kim Hoa',
      'districtId': '250',
      'district': 'Huyện Mê Linh',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '08998',
      'name': 'Xã Liên Mạc',
      'districtId': '250',
      'district': 'Huyện Mê Linh',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09010',
      'name': 'Xã Mê Linh',
      'districtId': '250',
      'district': 'Huyện Mê Linh',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '08995',
      'name': 'Xã Tam Đồng',
      'districtId': '250',
      'district': 'Huyện Mê Linh',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '08980',
      'name': 'Xã Thạch Đà',
      'districtId': '250',
      'district': 'Huyện Mê Linh',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '08992',
      'name': 'Xã Thanh Lâm',
      'districtId': '250',
      'district': 'Huyện Mê Linh',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09019',
      'name': 'Xã Tiền Phong',
      'districtId': '250',
      'district': 'Huyện Mê Linh',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '08983',
      'name': 'Xã Tiến Thắng',
      'districtId': '250',
      'district': 'Huyện Mê Linh',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09007',
      'name': 'Xã Tiến Thịnh',
      'districtId': '250',
      'district': 'Huyện Mê Linh',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09022',
      'name': 'Xã Tráng Việt',
      'districtId': '250',
      'district': 'Huyện Mê Linh',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '08986',
      'name': 'Xã Tự Lập',
      'districtId': '250',
      'district': 'Huyện Mê Linh',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09013',
      'name': 'Xã Văn Khê',
      'districtId': '250',
      'district': 'Huyện Mê Linh',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09001',
      'name': 'Xã Vạn Yên',
      'districtId': '250',
      'district': 'Huyện Mê Linh',
      'province': 'Thành phố Hà Nội'
    },
    //
    {
      'id': '10123',
      'name': 'Phường Biên Giang',
      'districtId': '268',
      'district': 'Quận Hà Đông',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09886',
      'name': 'Phường Dương Nội',
      'districtId': '268',
      'district': 'Quận Hà Đông',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10117',
      'name': 'Phường Đồng Mai',
      'districtId': '268',
      'district': 'Quận Hà Đông',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09556',
      'name': 'Phường Hà Cầu',
      'districtId': '268',
      'district': 'Quận Hà Đông',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09565',
      'name': 'Phường Kiến Hưng',
      'districtId': '268',
      'district': 'Quận Hà Đông',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09551',
      'name': 'Phường La Khê',
      'districtId': '268',
      'district': 'Quận Hà Đông',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09541',
      'name': 'Phường Mộ Lao',
      'districtId': '268',
      'district': 'Quận Hà Đông',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09538',
      'name': 'Phường Nguyễn Trãi',
      'districtId': '268',
      'district': 'Quận Hà Đông',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09552',
      'name': 'Phường Phú La',
      'districtId': '268',
      'district': 'Quận Hà Đông',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09568',
      'name': 'Phường Phú Lãm',
      'districtId': '268',
      'district': 'Quận Hà Đông',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09571',
      'name': 'Phường Phú Lương',
      'districtId': '268',
      'district': 'Quận Hà Đông',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09553',
      'name': 'Phường Phúc La',
      'districtId': '268',
      'district': 'Quận Hà Đông',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09550',
      'name': 'Phường Quang Trung',
      'districtId': '268',
      'district': 'Quận Hà Đông',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09544',
      'name': 'Phường Vạn Phúc',
      'districtId': '268',
      'district': 'Quận Hà Đông',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09542',
      'name': 'Phường Văn Quán',
      'districtId': '268',
      'district': 'Quận Hà Đông',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09562',
      'name': 'Phường Yên Nghĩa',
      'districtId': '268',
      'district': 'Quận Hà Đông',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09547',
      'name': 'Phường Yết Kiêu',
      'districtId': '268',
      'district': 'Quận Hà Đông',
      'province': 'Thành phố Hà Nội'
    },
    //
    {
      'id': '09574',
      'name': 'Phường Lê Lợi',
      'districtId': '269',
      'district': 'Thị xã Sơn Tây',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09580',
      'name': 'Phường Ngô Quyền',
      'districtId': '269',
      'district': 'Thị xã Sơn Tây',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09577',
      'name': 'Phường Phú Thịnh',
      'districtId': '269',
      'district': 'Thị xã Sơn Tây',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09583',
      'name': 'Phường Quang Trung',
      'districtId': '269',
      'district': 'Thị xã Sơn Tây',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09586',
      'name': 'Phường Sơn Lộc',
      'districtId': '269',
      'district': 'Thị xã Sơn Tây',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09601',
      'name': 'Phường Trung Hưng',
      'districtId': '269',
      'district': 'Thị xã Sơn Tây',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09607',
      'name': 'Phường Trung Sơn Trầm',
      'districtId': '269',
      'district': 'Thị xã Sơn Tây',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09595',
      'name': 'Phường Viên Sơn',
      'districtId': '269',
      'district': 'Thị xã Sơn Tây',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09589',
      'name': 'Phường Xuân Khanh',
      'districtId': '269',
      'district': 'Thị xã Sơn Tây',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09616',
      'name': 'Xã Cổ Đông',
      'districtId': '269',
      'district': 'Thị xã Sơn Tây',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09592',
      'name': 'Xã Đường Lâm',
      'districtId': '269',
      'district': 'Thị xã Sơn Tây',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09610',
      'name': 'Xã Kim Sơn',
      'districtId': '269',
      'district': 'Thị xã Sơn Tây',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09613',
      'name': 'Xã Sơn Đông',
      'districtId': '269',
      'district': 'Thị xã Sơn Tây',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09604',
      'name': 'Xã Thanh Mỹ',
      'districtId': '269',
      'district': 'Thị xã Sơn Tây',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09598',
      'name': 'Xã Xuân Sơn',
      'districtId': '269',
      'district': 'Thị xã Sơn Tây',
      'province': 'Thành phố Hà Nội'
    },
    //
    {
      'id': '09619',
      'name': 'Thị trấn Tây Đằng',
      'districtId': '271',
      'district': 'Huyện Ba Vì',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09697',
      'name': 'Xã Ba Trại',
      'districtId': '271',
      'district': 'Huyện Ba Vì',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09703',
      'name': 'Xã Ba Vì',
      'districtId': '271',
      'district': 'Huyện Ba Vì',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09673',
      'name': 'Xã Cẩm Lĩnh',
      'districtId': '271',
      'district': 'Huyện Ba Vì',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09688',
      'name': 'Xã Cam Thượng',
      'districtId': '271',
      'district': 'Huyện Ba Vì',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09637',
      'name': 'Xã Châu Sơn',
      'districtId': '271',
      'district': 'Huyện Ba Vì',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09667',
      'name': 'Xã Chu Minh',
      'districtId': '271',
      'district': 'Huyện Ba Vì',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09628',
      'name': 'Xã Cổ Đô',
      'districtId': '271',
      'district': 'Huyện Ba Vì',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09679',
      'name': 'Xã Đông Quang',
      'districtId': '271',
      'district': 'Huyện Ba Vì',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09655',
      'name': 'Xã Đồng Thái',
      'districtId': '271',
      'district': 'Huyện Ba Vì',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09712',
      'name': 'Xã Khánh Thượng',
      'districtId': '271',
      'district': 'Huyện Ba Vì',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09661',
      'name': 'Xã Minh Châu',
      'districtId': '271',
      'district': 'Huyện Ba Vì',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09700',
      'name': 'Xã Minh Quang',
      'districtId': '271',
      'district': 'Huyện Ba Vì',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09640',
      'name': 'Xã Phong Vân',
      'districtId': '271',
      'district': 'Huyện Ba Vì',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09649',
      'name': 'Xã Phú Châu',
      'districtId': '271',
      'district': 'Huyện Ba Vì',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09625',
      'name': 'Xã Phú Cường',
      'districtId': '271',
      'district': 'Huyện Ba Vì',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09643',
      'name': 'Xã Phú Đông',
      'districtId': '271',
      'district': 'Huyện Ba Vì',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09646',
      'name': 'Xã Phú Phương',
      'districtId': '271',
      'district': 'Huyện Ba Vì',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09658',
      'name': 'Xã Phú Sơn',
      'districtId': '271',
      'district': 'Huyện Ba Vì',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09676',
      'name': 'Xã Sơn Đà',
      'districtId': '271',
      'district': 'Huyện Ba Vì',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09631',
      'name': 'Xã Tản Hồng',
      'districtId': '271',
      'district': 'Huyện Ba Vì',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09694',
      'name': 'Xã Tản Lĩnh',
      'districtId': '271',
      'district': 'Huyện Ba Vì',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09652',
      'name': 'Xã Thái Hòa',
      'districtId': '271',
      'district': 'Huyện Ba Vì',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09691',
      'name': 'Xã Thuần Mỹ',
      'districtId': '271',
      'district': 'Huyện Ba Vì',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09685',
      'name': 'Xã Thụy An',
      'districtId': '271',
      'district': 'Huyện Ba Vì',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09682',
      'name': 'Xã Tiên Phong',
      'districtId': '271',
      'district': 'Huyện Ba Vì',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09670',
      'name': 'Xã Tòng Bạt',
      'districtId': '271',
      'district': 'Huyện Ba Vì',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09706',
      'name': 'Xã Vân Hòa',
      'districtId': '271',
      'district': 'Huyện Ba Vì',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09634',
      'name': 'Xã Vạn Thắng',
      'districtId': '271',
      'district': 'Huyện Ba Vì',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09664',
      'name': 'Xã Vật Lại',
      'districtId': '271',
      'district': 'Huyện Ba Vì',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09709',
      'name': 'Xã Yên Bài',
      'districtId': '271',
      'district': 'Huyện Ba Vì',
      'province': 'Thành phố Hà Nội'
    },
    //
    {
      'id': '09715',
      'name': 'Thị trấn Phúc Thọ',
      'districtId': '272',
      'district': 'Huyện Phúc Thọ',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09736',
      'name': 'Xã Cẩm Đình',
      'districtId': '272',
      'district': 'Huyện Phúc Thọ',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09751',
      'name': 'Xã Hát Môn',
      'districtId': '272',
      'district': 'Huyện Phúc Thọ',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09778',
      'name': 'Xã Hiệp Thuận',
      'districtId': '272',
      'district': 'Huyện Phúc Thọ',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09781',
      'name': 'Xã Liên Hiệp',
      'districtId': '272',
      'district': 'Huyện Phúc Thọ',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09745',
      'name': 'Xã Long Xuyên',
      'districtId': '272',
      'district': 'Huyện Phúc Thọ',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09766',
      'name': 'Xã Ngọc Tảo',
      'districtId': '272',
      'district': 'Huyện Phúc Thọ',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09763',
      'name': 'Xã Phúc Hòa',
      'districtId': '272',
      'district': 'Huyện Phúc Thọ',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09769',
      'name': 'Xã Phụng Thượng',
      'districtId': '272',
      'district': 'Huyện Phúc Thọ',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09730',
      'name': 'Xã Phương Độ',
      'districtId': '272',
      'district': 'Huyện Phúc Thọ',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09733',
      'name': 'Xã Sen Phương',
      'districtId': '272',
      'district': 'Huyện Phúc Thọ',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09775',
      'name': 'Xã Tam Hiệp',
      'districtId': '272',
      'district': 'Huyện Phúc Thọ',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09772',
      'name': 'Xã Tam Thuấn',
      'districtId': '272',
      'district': 'Huyện Phúc Thọ',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09757',
      'name': 'Xã Thanh Đa',
      'districtId': '272',
      'district': 'Huyện Phúc Thọ',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09742',
      'name': 'Xã Thọ Lộc',
      'districtId': '272',
      'district': 'Huyện Phúc Thọ',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09748',
      'name': 'Xã Thượng Cốc',
      'districtId': '272',
      'district': 'Huyện Phúc Thọ',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09754',
      'name': 'Xã Tích Giang',
      'districtId': '272',
      'district': 'Huyện Phúc Thọ',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09760',
      'name': 'Xã Trạch Mỹ Lộc',
      'districtId': '272',
      'district': 'Huyện Phúc Thọ',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09718',
      'name': 'Xã Vân Hà',
      'districtId': '272',
      'district': 'Huyện Phúc Thọ',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09724',
      'name': 'Xã Vân Nam',
      'districtId': '272',
      'district': 'Huyện Phúc Thọ',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09721',
      'name': 'Xã Vân Phúc',
      'districtId': '272',
      'district': 'Huyện Phúc Thọ',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09739',
      'name': 'Xã Võng Xuyên',
      'districtId': '272',
      'district': 'Huyện Phúc Thọ',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09727',
      'name': 'Xã Xuân Đình',
      'districtId': '272',
      'district': 'Huyện Phúc Thọ',
      'province': 'Thành phố Hà Nội'
    },
    //
    {
      'id': '09784',
      'name': 'Thị trấn Phùng',
      'districtId': '273',
      'district': 'Huyện Đan Phượng',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09823',
      'name': 'Xã Đan Phượng',
      'districtId': '273',
      'district': 'Huyện Đan Phượng',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09826',
      'name': 'Xã Đồng Tháp',
      'districtId': '273',
      'district': 'Huyện Đan Phượng',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09805',
      'name': 'Xã Hạ Mỗ',
      'districtId': '273',
      'district': 'Huyện Đan Phượng',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09796',
      'name': 'Xã Hồng Hà',
      'districtId': '273',
      'district': 'Huyện Đan Phượng',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09802',
      'name': 'Xã Liên Hà',
      'districtId': '273',
      'district': 'Huyện Đan Phượng',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09799',
      'name': 'Xã Liên Hồng',
      'districtId': '273',
      'district': 'Huyện Đan Phượng',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09808',
      'name': 'Xã Liên Trung',
      'districtId': '273',
      'district': 'Huyện Đan Phượng',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09811',
      'name': 'Xã Phương Đình',
      'districtId': '273',
      'district': 'Huyện Đan Phượng',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09829',
      'name': 'Xã Song Phượng',
      'districtId': '273',
      'district': 'Huyện Đan Phượng',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09817',
      'name': 'Xã Tân Hội',
      'districtId': '273',
      'district': 'Huyện Đan Phượng',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09820',
      'name': 'Xã Tân Lập',
      'districtId': '273',
      'district': 'Huyện Đan Phượng',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09790',
      'name': 'Xã Thọ An',
      'districtId': '273',
      'district': 'Huyện Đan Phượng',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09793',
      'name': 'Xã Thọ Xuân',
      'districtId': '273',
      'district': 'Huyện Đan Phượng',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09814',
      'name': 'Xã Thượng Mỗ',
      'districtId': '273',
      'district': 'Huyện Đan Phượng',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09787',
      'name': 'Xã Trung Châu',
      'districtId': '273',
      'district': 'Huyện Đan Phượng',
      'province': 'Thành phố Hà Nội'
    },
    //
    {
      'id': '09832',
      'name': 'Thị trấn Trạm Trôi',
      'districtId': '274',
      'district': 'Huyện Hoài Đức',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09877',
      'name': 'Xã An Khánh',
      'districtId': '274',
      'district': 'Huyện Hoài Đức',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09880',
      'name': 'Xã An Thượng',
      'districtId': '274',
      'district': 'Huyện Hoài Đức',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09850',
      'name': 'Xã Cát Quế',
      'districtId': '274',
      'district': 'Huyện Hoài Đức',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09844',
      'name': 'Xã Di Trạch',
      'districtId': '274',
      'district': 'Huyện Hoài Đức',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09841',
      'name': 'Xã Dương Liễu',
      'districtId': '274',
      'district': 'Huyện Hoài Đức',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09865',
      'name': 'Xã Đắc Sở',
      'districtId': '274',
      'district': 'Huyện Hoài Đức',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09892',
      'name': 'Xã Đông La',
      'districtId': '274',
      'district': 'Huyện Hoài Đức',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09847',
      'name': 'Xã Đức Giang',
      'districtId': '274',
      'district': 'Huyện Hoài Đức',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09835',
      'name': 'Xã Đức Thượng',
      'districtId': '274',
      'district': 'Huyện Hoài Đức',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09853',
      'name': 'Xã Kim Chung',
      'districtId': '274',
      'district': 'Huyện Hoài Đức',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09889',
      'name': 'Xã La Phù',
      'districtId': '274',
      'district': 'Huyện Hoài Đức',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09868',
      'name': 'Xã Lại Yên',
      'districtId': '274',
      'district': 'Huyện Hoài Đức',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09838',
      'name': 'Xã Minh Khai',
      'districtId': '274',
      'district': 'Huyện Hoài Đức',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09859',
      'name': 'Xã Sơn Đồng',
      'districtId': '274',
      'district': 'Huyện Hoài Đức',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09874',
      'name': 'Xã Song Phương',
      'districtId': '274',
      'district': 'Huyện Hoài Đức',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09871',
      'name': 'Xã Tiền Yên',
      'districtId': '274',
      'district': 'Huyện Hoài Đức',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09862',
      'name': 'Xã Vân Canh',
      'districtId': '274',
      'district': 'Huyện Hoài Đức',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09883',
      'name': 'Xã Vân Côn',
      'districtId': '274',
      'district': 'Huyện Hoài Đức',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09856',
      'name': 'Xã Yên Sở',
      'districtId': '274',
      'district': 'Huyện Hoài Đức',
      'province': 'Thành phố Hà Nội'
    },
    //---
    {
      'id': '09895',
      'name': 'Thị trấn Quốc Oai',
      'districtId': '275',
      'district': 'Huyện Quốc Oai',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09943',
      'name': 'Xã Cấn Hữu',
      'districtId': '275',
      'district': 'Huyện Quốc Oai',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09931',
      'name': 'Xã Cộng Hòa',
      'districtId': '275',
      'district': 'Huyện Quốc Oai',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09937',
      'name': 'Xã Đại Thành',
      'districtId': '275',
      'district': 'Huyện Quốc Oai',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09919',
      'name': 'Xã Đồng Quang',
      'districtId': '275',
      'district': 'Huyện Quốc Oai',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '04939',
      'name': 'Xã Đông Xuân',
      'districtId': '275',
      'district': 'Huyện Quốc Oai',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09952',
      'name': 'Xã Đông Yên',
      'districtId': '275',
      'district': 'Huyện Quốc Oai',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09949',
      'name': 'Xã Hòa Thạch',
      'districtId': '275',
      'district': 'Huyện Quốc Oai',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09913',
      'name': 'Xã Liệp Tuyết',
      'districtId': '275',
      'district': 'Huyện Quốc Oai',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09928',
      'name': 'Xã Nghĩa Hương',
      'districtId': '275',
      'district': 'Huyện Quốc Oai',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09907',
      'name': 'Xã Ngọc Liệp',
      'districtId': '275',
      'district': 'Huyện Quốc Oai',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09910',
      'name': 'Xã Ngọc Mỹ',
      'districtId': '275',
      'district': 'Huyện Quốc Oai',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09922',
      'name': 'Xã Phú Cát',
      'districtId': '275',
      'district': 'Huyện Quốc Oai',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09940',
      'name': 'Xã Phú Mãn',
      'districtId': '275',
      'district': 'Huyện Quốc Oai',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09901',
      'name': 'Xã Phượng Cách',
      'districtId': '275',
      'district': 'Huyện Quốc Oai',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09898',
      'name': 'Xã Sài Sơn',
      'districtId': '275',
      'district': 'Huyện Quốc Oai',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09946',
      'name': 'Xã Tân Hòa',
      'districtId': '275',
      'district': 'Huyện Quốc Oai',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09934',
      'name': 'Xã Tân Phú',
      'districtId': '275',
      'district': 'Huyện Quốc Oai',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09916',
      'name': 'Xã Thạch Thán',
      'districtId': '275',
      'district': 'Huyện Quốc Oai',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09925',
      'name': 'Xã Tuyết Nghĩa',
      'districtId': '275',
      'district': 'Huyện Quốc Oai',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09904',
      'name': 'Xã Yên Sơn',
      'districtId': '275',
      'district': 'Huyện Quốc Oai',
      'province': 'Thành phố Hà Nội'
    },
    // --
    {
      'id': '09955',
      'name': 'Thị trấn Liên Quan',
      'districtId': '276',
      'district': 'Huyện Thạch Thất',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10006',
      'name': 'Xã Bình Phú',
      'districtId': '276',
      'district': 'Huyện Thạch Thất',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09982',
      'name': 'Xã Bình Yên',
      'districtId': '276',
      'district': 'Huyện Thạch Thất',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09961',
      'name': 'Xã Cẩm Yên',
      'districtId': '276',
      'district': 'Huyện Thạch Thất',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09991',
      'name': 'Xã Cần Kiệm',
      'districtId': '276',
      'district': 'Huyện Thạch Thất',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09973',
      'name': 'Xã Canh Nậu',
      'districtId': '276',
      'district': 'Huyện Thạch Thất',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09985',
      'name': 'Xã Chàng Sơn',
      'districtId': '276',
      'district': 'Huyện Thạch Thất',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09979',
      'name': 'Xã Dị Nậu',
      'districtId': '276',
      'district': 'Huyện Thạch Thất',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09958',
      'name': 'Xã Đại Đồng',
      'districtId': '276',
      'district': 'Huyện Thạch Thất',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10012',
      'name': 'Xã Đồng Trúc',
      'districtId': '276',
      'district': 'Huyện Thạch Thất',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10009',
      'name': 'Xã Hạ Bằng',
      'districtId': '276',
      'district': 'Huyện Thạch Thất',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09970',
      'name': 'Xã Hương Ngải',
      'districtId': '276',
      'district': 'Huyện Thạch Thất',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09994',
      'name': 'Xã Hữu Bằng',
      'districtId': '276',
      'district': 'Huyện Thạch Thất',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09976',
      'name': 'Xã Kim Quan',
      'districtId': '276',
      'district': 'Huyện Thạch Thất',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09964',
      'name': 'Xã Lại Thượng',
      'districtId': '276',
      'district': 'Huyện Thạch Thất',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09967',
      'name': 'Xã Phú Kim',
      'districtId': '276',
      'district': 'Huyện Thạch Thất',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09997',
      'name': 'Xã Phùng Xá',
      'districtId': '276',
      'district': 'Huyện Thạch Thất',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10000',
      'name': 'Xã Tân Xã',
      'districtId': '276',
      'district': 'Huyện Thạch Thất',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '09988',
      'name': 'Xã Thạch Hoà',
      'districtId': '276',
      'district': 'Huyện Thạch Thất',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10003',
      'name': 'Xã Thạch Xá',
      'districtId': '276',
      'district': 'Huyện Thạch Thất',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '04936',
      'name': 'Xã Tiến Xuân',
      'districtId': '276',
      'district': 'Huyện Thạch Thất',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '04930',
      'name': 'Xã Yên Bình',
      'districtId': '276',
      'district': 'Huyện Thạch Thất',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '04927',
      'name': 'Xã Yên Trung',
      'districtId': '276',
      'district': 'Huyện Thạch Thất',
      'province': 'Thành phố Hà Nội'
    },

    ///
    {
      'id': '10015',
      'name': 'Thị trấn Chúc Sơn',
      'districtId': '277',
      'district': 'Huyện Chương Mỹ',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10018',
      'name': 'Thị trấn Xuân Mai',
      'districtId': '277',
      'district': 'Huyện Chương Mỹ',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10054',
      'name': 'Xã Đại Yên',
      'districtId': '277',
      'district': 'Huyện Chương Mỹ',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10105',
      'name': 'Xã Đồng Lạc',
      'districtId': '277',
      'district': 'Huyện Chương Mỹ',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10096',
      'name': 'Xã Đồng Phú',
      'districtId': '277',
      'district': 'Huyện Chương Mỹ',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10030',
      'name': 'Xã Đông Phương Yên',
      'districtId': '277',
      'district': 'Huyện Chương Mỹ',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10027',
      'name': 'Xã Đông Sơn',
      'districtId': '277',
      'district': 'Huyện Chương Mỹ',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10108',
      'name': 'Xã Hòa Chính',
      'districtId': '277',
      'district': 'Huyện Chương Mỹ',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10078',
      'name': 'Xã Hoàng Diệu',
      'districtId': '277',
      'district': 'Huyện Chương Mỹ',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10075',
      'name': 'Xã Hoàng Văn Thụ',
      'districtId': '277',
      'district': 'Huyện Chương Mỹ',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10093',
      'name': 'Xã Hồng Phong',
      'districtId': '277',
      'district': 'Huyện Chương Mỹ',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10072',
      'name': 'Xã Hợp Đồng',
      'districtId': '277',
      'district': 'Huyện Chương Mỹ',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10081',
      'name': 'Xã Hữu Văn',
      'districtId': '277',
      'district': 'Huyện Chương Mỹ',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10063',
      'name': 'Xã Lam Điền',
      'districtId': '277',
      'district': 'Huyện Chương Mỹ',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10087',
      'name': 'Xã Mỹ Lương',
      'districtId': '277',
      'district': 'Huyện Chương Mỹ',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10069',
      'name': 'Xã Nam Phương Tiến',
      'districtId': '277',
      'district': 'Huyện Chương Mỹ',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10042',
      'name': 'Xã Ngọc Hòa',
      'districtId': '277',
      'district': 'Huyện Chương Mỹ',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10111',
      'name': 'Xã Phú Nam An',
      'districtId': '277',
      'district': 'Huyện Chương Mỹ',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10033',
      'name': 'Xã Phú Nghĩa',
      'districtId': '277',
      'district': 'Huyện Chương Mỹ',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10021',
      'name': 'Xã Phụng Châu',
      'districtId': '277',
      'district': 'Huyện Chương Mỹ',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10084',
      'name': 'Xã Quảng Bị',
      'districtId': '277',
      'district': 'Huyện Chương Mỹ',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10066',
      'name': 'Xã Tân Tiến',
      'districtId': '277',
      'district': 'Huyện Chương Mỹ',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10048',
      'name': 'Xã Thanh Bình',
      'districtId': '277',
      'district': 'Huyện Chương Mỹ',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10090',
      'name': 'Xã Thượng Vực',
      'districtId': '277',
      'district': 'Huyện Chương Mỹ',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10057',
      'name': 'Xã Thụy Hương',
      'districtId': '277',
      'district': 'Huyện Chương Mỹ',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10045',
      'name': 'Xã Thủy Xuân Tiên',
      'districtId': '277',
      'district': 'Huyện Chương Mỹ',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10024',
      'name': 'Xã Tiên Phương',
      'districtId': '277',
      'district': 'Huyện Chương Mỹ',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10060',
      'name': 'Xã Tốt Động',
      'districtId': '277',
      'district': 'Huyện Chương Mỹ',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10099',
      'name': 'Xã Trần Phú',
      'districtId': '277',
      'district': 'Huyện Chương Mỹ',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10051',
      'name': 'Xã Trung Hòa',
      'districtId': '277',
      'district': 'Huyện Chương Mỹ',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10039',
      'name': 'Xã Trường Yên',
      'districtId': '277',
      'district': 'Huyện Chương Mỹ',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10102',
      'name': 'Xã Văn Võ',
      'districtId': '277',
      'district': 'Huyện Chương Mỹ',
      'province': 'Thành phố Hà Nội'
    },
    //
    {
      'id': '10114',
      'name': 'Thị trấn Kim Bài',
      'districtId': '278',
      'district': 'Huyện Thanh Oai',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10126',
      'name': 'Xã Bích Hòa',
      'districtId': '278',
      'district': 'Huyện Thanh Oai',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10135',
      'name': 'Xã Bình Minh',
      'districtId': '278',
      'district': 'Huyện Thanh Oai',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10174',
      'name': 'Xã Cao Dương',
      'districtId': '278',
      'district': 'Huyện Thanh Oai',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10132',
      'name': 'Xã Cao Viên',
      'districtId': '278',
      'district': 'Huyện Thanh Oai',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10120',
      'name': 'Xã Cự Khê',
      'districtId': '278',
      'district': 'Huyện Thanh Oai',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10168',
      'name': 'Xã Dân Hòa',
      'districtId': '278',
      'district': 'Huyện Thanh Oai',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10153',
      'name': 'Xã Đỗ Động',
      'districtId': '278',
      'district': 'Huyện Thanh Oai',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10180',
      'name': 'Xã Hồng Dương',
      'districtId': '278',
      'district': 'Huyện Thanh Oai',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10156',
      'name': 'Xã Kim An',
      'districtId': '278',
      'district': 'Huyện Thanh Oai',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10159',
      'name': 'Xã Kim Thư',
      'districtId': '278',
      'district': 'Huyện Thanh Oai',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10171',
      'name': 'Xã Liên Châu',
      'districtId': '278',
      'district': 'Huyện Thanh Oai',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10129',
      'name': 'Xã Mỹ Hưng',
      'districtId': '278',
      'district': 'Huyện Thanh Oai',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10162',
      'name': 'Xã Phương Trung',
      'districtId': '278',
      'district': 'Huyện Thanh Oai',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10138',
      'name': 'Xã Tam Hưng',
      'districtId': '278',
      'district': 'Huyện Thanh Oai',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10165',
      'name': 'Xã Tân Ước',
      'districtId': '278',
      'district': 'Huyện Thanh Oai',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10141',
      'name': 'Xã Thanh Cao',
      'districtId': '278',
      'district': 'Huyện Thanh Oai',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10147',
      'name': 'Xã Thanh Mai',
      'districtId': '278',
      'district': 'Huyện Thanh Oai',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10144',
      'name': 'Xã Thanh Thùy',
      'districtId': '278',
      'district': 'Huyện Thanh Oai',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10150',
      'name': 'Xã Thanh Văn',
      'districtId': '278',
      'district': 'Huyện Thanh Oai',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10177',
      'name': 'Xã Xuân Dương',
      'districtId': '278',
      'district': 'Huyện Thanh Oai',
      'province': 'Thành phố Hà Nội'
    },
    //
    {
      'id': '10183',
      'name': 'Thị trấn Thường Tín',
      'districtId': '279',
      'district': 'Huyện Thường Tín',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10237',
      'name': 'Xã Chương Dương',
      'districtId': '279',
      'district': 'Huyện Thường Tín',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10249',
      'name': 'Xã Dũng Tiến',
      'districtId': '279',
      'district': 'Huyện Thường Tín',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10192',
      'name': 'Xã Duyên Thái',
      'districtId': '279',
      'district': 'Huyện Thường Tín',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10225',
      'name': 'Xã Hà Hồi',
      'districtId': '279',
      'district': 'Huyện Thường Tín',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10204',
      'name': 'Xã Hiền Giang',
      'districtId': '279',
      'district': 'Huyện Thường Tín',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10198',
      'name': 'Xã Hòa Bình',
      'districtId': '279',
      'district': 'Huyện Thường Tín',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10207',
      'name': 'Xã Hồng Vân',
      'districtId': '279',
      'district': 'Huyện Thường Tín',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10195',
      'name': 'Xã Khánh Hà',
      'districtId': '279',
      'district': 'Huyện Thường Tín',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10243',
      'name': 'Xã Lê Lợi',
      'districtId': '279',
      'district': 'Huyện Thường Tín',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10213',
      'name': 'Xã Liên Phương',
      'districtId': '279',
      'district': 'Huyện Thường Tín',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10267',
      'name': 'Xã Minh Cường',
      'districtId': '279',
      'district': 'Huyện Thường Tín',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10255',
      'name': 'Xã Nghiêm Xuyên',
      'districtId': '279',
      'district': 'Huyện Thường Tín',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10231',
      'name': 'Xã Nguyễn Trãi',
      'districtId': '279',
      'district': 'Huyện Thường Tín',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10189',
      'name': 'Xã Nhị Khê',
      'districtId': '279',
      'district': 'Huyện Thường Tín',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10186',
      'name': 'Xã Ninh Sở',
      'districtId': '279',
      'district': 'Huyện Thường Tín',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10234',
      'name': 'Xã Quất Động',
      'districtId': '279',
      'district': 'Huyện Thường Tín',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10240',
      'name': 'Xã Tân Minh',
      'districtId': '279',
      'district': 'Huyện Thường Tín',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10246',
      'name': 'Xã Thắng Lợi',
      'districtId': '279',
      'district': 'Huyện Thường Tín',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10252',
      'name': 'Xã Thống Nhất',
      'districtId': '279',
      'district': 'Huyện Thường Tín',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10228',
      'name': 'Xã Thư Phú',
      'districtId': '279',
      'district': 'Huyện Thường Tín',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10222',
      'name': 'Xã Tiền Phong',
      'districtId': '279',
      'district': 'Huyện Thường Tín',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10258',
      'name': 'Xã Tô Hiệu',
      'districtId': '279',
      'district': 'Huyện Thường Tín',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10219',
      'name': 'Xã Tự Nhiên',
      'districtId': '279',
      'district': 'Huyện Thường Tín',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10201',
      'name': 'Xã Văn Bình',
      'districtId': '279',
      'district': 'Huyện Thường Tín',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10264',
      'name': 'Xã Vạn Điểm',
      'districtId': '279',
      'district': 'Huyện Thường Tín',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10216',
      'name': 'Xã Văn Phú',
      'districtId': '279',
      'district': 'Huyện Thường Tín',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10210',
      'name': 'Xã Vân Tảo',
      'districtId': '279',
      'district': 'Huyện Thường Tín',
      'province': 'Thành phố Hà Nội'
    },
    {
      'id': '10261',
      'name': 'Xã Văn Tự',
      'districtId': '279',
      'district': 'Huyện Thường Tín',
      'province': 'Thành phố Hà Nội'
    }
  ];

  static void addCommune() {
    for (final e in list) {
      _firestore.collection('commune').doc(e['id']).set(e);
    }
  }
}
