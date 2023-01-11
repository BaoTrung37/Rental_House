import 'dart:io';

import 'package:batru_house_rental/data/models/address/address_reponse.dart';
import 'package:batru_house_rental/data/models/convenient_house/convenient_house_reponse.dart';
import 'package:batru_house_rental/data/models/house_type/house_type_response.dart';
import 'package:batru_house_rental/data/models/image_house/image_house_response.dart';
import 'package:batru_house_rental/data/models/post/post_response.dart';
import 'package:batru_house_rental/domain/entities/convenient_house/convenient_house_entity.dart';
import 'package:batru_house_rental/domain/entities/post/post_entity.dart';
import 'package:batru_house_rental/domain/use_case/address/post_address_use_case.dart';
import 'package:batru_house_rental/domain/use_case/auth/get_current_user_information_use_case.dart';
import 'package:batru_house_rental/domain/use_case/commune/get_commune_list_use_case.dart';
import 'package:batru_house_rental/domain/use_case/convenient/get_convenient_list_use_case.dart';
import 'package:batru_house_rental/domain/use_case/convenient_house/post_convenient_house_list_use_case.dart';
import 'package:batru_house_rental/domain/use_case/district/get_district_list_use_case.dart';
import 'package:batru_house_rental/domain/use_case/house_type/post_house_type_use_case.dart';
import 'package:batru_house_rental/domain/use_case/image_house/post_image_house_list_use_case.dart';
import 'package:batru_house_rental/domain/use_case/image_house/post_image_to_storage_use_case.dart';
import 'package:batru_house_rental/domain/use_case/post/post_the_post_use_case.dart';
import 'package:batru_house_rental/domain/use_case/province/get_province_list_use_case.dart';
import 'package:batru_house_rental/domain/use_case/type/get_type_list_use_case.dart';
import 'package:batru_house_rental/presentation/pages/post_article/post_article_state.dart';
import 'package:batru_house_rental/presentation/utilities/enums/loading_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class PostArticleViewModel extends StateNotifier<PostArticleState> {
  PostArticleViewModel(
    this._getProvinceListUseCase,
    this._getTypeListUseCase,
    this._getDistrictListUseCase,
    this._getCommuneListUseCase,
    this._getConvenientListUseCase,
    this._postHouseUseCase,
    this._postConvenientHouseListUseCase,
    this._postImageHouseListUseCase,
    this._postImageToStorageUseCase,
    this._getCurrentUserInformationUseCase,
    this._postHouseTypeUseCase,
    this._postAddressUseCase,
  ) : super(PostArticleState());

  final GetTypeListUseCase _getTypeListUseCase;
  final GetProvinceListUseCase _getProvinceListUseCase;
  final GetDistrictListUseCase _getDistrictListUseCase;
  final GetCommuneListUseCase _getCommuneListUseCase;
  final GetConvenientListUseCase _getConvenientListUseCase;
  final PostThePostUseCase _postHouseUseCase;
  final PostConvenientHouseListUseCase _postConvenientHouseListUseCase;
  final PostImageHouseListUseCase _postImageHouseListUseCase;
  final PostImageToStorageUseCase _postImageToStorageUseCase;
  final GetCurrentUserInformationUseCase _getCurrentUserInformationUseCase;
  final PostHouseTypeUseCase _postHouseTypeUseCase;
  final PostAddressUseCase _postAddressUseCase;
  Future<void> initData() async {
    try {
      state = state.copyWith(
        status: LoadingStatus.initial,
      );
      await getHouseInitial();
      final provinces = await _getProvinceListUseCase.run();
      final convenients = await _getConvenientListUseCase.run();
      final types = await _getTypeListUseCase.run();
      final districts = await _getDistrictListUseCase.run('01');
      final communes = await _getCommuneListUseCase.run('001');
      state = state.copyWith(
        provinces: provinces,
        types: types,
        districts: districts,
        communes: communes,
        convenients: convenients,
        status: LoadingStatus.success,
      );
    } catch (e) {
      state = state.copyWith(
        status: LoadingStatus.error,
      );
      debugPrint(e.toString());
    }
  }

  Future<void> getHouseInitial() async {
    state = state.copyWith(
      post: PostEntity(
        houseNumber: '',
        id: '',
        streetName: '',
        area: 0,
        capacity: 0,
        depositMonth: 0,
        electricPrice: 0,
        waterPrice: 0,
        internetPrice: 0,
        parkingPrice: 0,
        rentalPrice: 0,
        title: '',
        description: '',
        userId: '',
        isAvailableParking: false,
        address: '',
        phoneNumber: '',
        createdAt: DateTime.now(),
        updatedAt: null,
      ),
    );
  }

  String _getAddress() {
    var houseNumber = state.post?.houseNumber;
    if (houseNumber != null && houseNumber.isNotEmpty) {
      houseNumber = '$houseNumber, ';
    } else {
      houseNumber = '';
    }
    var streetName = state.post?.streetName;
    if (streetName != null && streetName.isNotEmpty) {
      streetName = '$streetName, ';
    } else {
      streetName = '';
    }
    final communeName = '${state.currentCommune?.name}, ';
    final districtName = '${state.currentDistrict!.name}, ';
    const provinceName = 'Hà Nội';

    return houseNumber + streetName + communeName + districtName + provinceName;
  }

  Future<String?> postArticle() async {
    try {
      state = state.copyWith(
        postButtonStatus: LoadingStatus.inProgress,
      );
      final postId = DateTime.now().millisecondsSinceEpoch.toString();
      final addressId = DateTime.now()
          .add(const Duration(milliseconds: 1))
          .millisecondsSinceEpoch
          .toString();

      final currentUser = await _getCurrentUserInformationUseCase.run();
      await _postHouseUseCase.run(
        PostResponse(
          id: postId,
          area: state.post?.area ?? 0,
          capacity: state.post?.capacity ?? 0,
          streetName: state.post?.streetName ?? '',
          houseNumber: state.post?.houseNumber ?? '',
          depositMonth: state.post?.depositMonth ?? 0,
          waterPrice: state.post?.waterPrice ?? 0,
          electricPrice: state.post?.electricPrice ?? 0,
          internetPrice: state.post?.internetPrice ?? 0,
          isAvailableParking: state.isParkingSpaceAvailable,
          parkingPrice:
              state.isParkingSpaceAvailable ? state.post?.parkingPrice ?? 0 : 0,
          rentalPrice: state.post!.rentalPrice,
          createdAt: DateTime.now(),
          description: state.post?.description ?? '',
          title: state.post?.title ?? '',
          userId: currentUser.id,
          phoneNumber: state.post?.phoneNumber ?? '',
          updatedAt: state.post?.updatedAt,
          address: _getAddress(),
        ),
      );

      await _postHouseTypeUseCase.run(
        HouseTypeResponse(
          id: DateTime.now()
              .add(const Duration(milliseconds: 2))
              .millisecondsSinceEpoch
              .toString(),
          postId: postId,
          typeId: state.currentType!.id,
        ),
      );

      await _postAddressUseCase.run(
        AddressResponse(
          id: addressId,
          provinceId: state.currentProvince?.id ?? '01',
          districtId: state.currentDistrict!.id,
          communeId: state.currentCommune!.id,
          postId: postId,
        ),
      );

      await _postConvenientHouseListUseCase
          .run(state.convenientSelected.map((e) {
        return ConvenientHouseResponse(
          id: e.convenientId + postId,
          postId: postId,
          convenientId: e.convenientId,
        );
      }).toList());

      final screenshotUrlList =
          await _postImageToStorageUseCase.run(state.screenshotList);
      await _postImageHouseListUseCase.run(
        screenshotUrlList.map(
          (e) {
            final imageId = DateTime.now()
                .add(const Duration(microseconds: 1))
                .microsecondsSinceEpoch
                .toString();
            debugPrint('imageId: $imageId');
            return ImageHouseResponse(id: imageId, postId: postId, url: e);
          },
        ).toList(),
      );

      state = state.copyWith(
        postButtonStatus: LoadingStatus.success,
      );
      return postId;
    } catch (e) {
      state = state.copyWith(
        status: LoadingStatus.error,
      );
      debugPrint(e.toString());
    }
    return null;
  }

  void setHouseCapacity(String capacity) {
    try {
      state = state.copyWith(
        post: state.post?.copyWith(
          capacity: int.parse(capacity.replaceAll(',', '')),
        ),
      );
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  void setHouseArea(String area) {
    try {
      state = state.copyWith(
        post: state.post?.copyWith(
          area: int.parse(area.replaceAll(',', '')),
        ),
      );
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  void setRentalPrice(String rentalPrice) {
    try {
      state = state.copyWith(
        post: state.post?.copyWith(
          rentalPrice: int.parse(rentalPrice.replaceAll(',', '')),
        ),
      );
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  void setDipositPrice(String depositPrice) {
    try {
      state = state.copyWith(
        post: state.post?.copyWith(
          depositMonth: int.parse(depositPrice.replaceAll(',', '')),
        ),
      );
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  void setElectricPrice(String electricPrice) {
    try {
      state = state.copyWith(
        post: state.post?.copyWith(
          electricPrice: int.parse(electricPrice.replaceAll(',', '')),
        ),
      );
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  void setWaterPrice(String waterPrice) {
    try {
      state = state.copyWith(
        post: state.post?.copyWith(
          waterPrice: int.parse(waterPrice.replaceAll(',', '')),
        ),
      );
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  void setInternetPrice(String internetPrice) {
    try {
      state = state.copyWith(
        post: state.post?.copyWith(
          internetPrice: int.parse(internetPrice.replaceAll(',', '')),
        ),
      );
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  void setParkingPrice(String parkingPrice) {
    try {
      state = state.copyWith(
        post: state.post?.copyWith(
          parkingPrice: int.parse(parkingPrice.replaceAll(',', '')),
        ),
      );
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  void setStreetName(String streetName) {
    state = state.copyWith(
      post: state.post?.copyWith(
        streetName: streetName,
      ),
    );
  }

  void setHouseNumber(String houseNumber) {
    state = state.copyWith(
      post: state.post?.copyWith(
        houseNumber: houseNumber,
      ),
    );
  }

  void setPhoneNumber(String numberPhone) {
    state = state.copyWith(
      post: state.post?.copyWith(
        phoneNumber: numberPhone,
      ),
    );
  }

  void setDescription(String description) {
    state = state.copyWith(
      post: state.post?.copyWith(
        description: description,
      ),
    );
  }

  void setTitle(String title) {
    state = state.copyWith(
      post: state.post?.copyWith(
        title: title,
      ),
    );
  }

  void onConvenientTap(String convenientId) {
    state = state.copyWith(
      convenients: state.convenients.map((e) {
        if (e.id == convenientId) {
          return e.copyWith(isSelected: !e.isSelected);
        }
        return e;
      }).toList(),
    );
    state = state.copyWith(
      convenientSelected: state.convenients
          .where((element) => element.isSelected == true)
          .toList()
          .map((e) => ConvenientHouseEntity(
                convenientId: e.id,
              ))
          .toList(),
    );
  }

  Future<void> onDistrictChanged(String districtName) async {
    state = state.copyWith(
      currentDistrict: state.districts.firstWhere(
        (e) => e.name == districtName,
      ),
      currentCommune: null,
    );
    final communes =
        await _getCommuneListUseCase.run(state.currentDistrict!.id);
    state = state.copyWith(
      communes: communes,
    );
  }

  Future<void> onTypeChanged(String type) async {
    state = state.copyWith(
      currentType: state.types.firstWhere(
        (e) => e.name == type,
      ),
    );
  }

  void onCommuneChanged(String communeName) {
    state = state.copyWith(
      currentCommune: state.communes.firstWhere(
        (e) => e.name == communeName,
      ),
    );
  }

  void setStep(int step) {
    state = state.copyWith(currentStep: step);
  }

  void nextStep() {
    state = state.copyWith(
        currentStep:
            state.currentStep < 3 ? state.currentStep + 1 : state.currentStep);
  }

  void previousStep() {
    state = state.copyWith(
        currentStep:
            state.currentStep > 0 ? state.currentStep - 1 : state.currentStep);
  }

  void setIsParkingSpace(bool value) {
    state = state.copyWith(isParkingSpaceAvailable: value);
  }

  Future<void> openImagePicker(BuildContext context) async {
    try {
      File? image;
      final picker = ImagePicker();
      final pickedImage = await picker.pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        image = File(pickedImage.path);
        addImage(image);
      }
    } on PlatformException {
      // showErrorSnackBar(
      //   context: context,
      //   errorMessage: error.message ?? '',
      // );
    }
  }

  void addImage(File image) {
    final screenshotList = state.screenshotList.toList();
    screenshotList.add(image);
    state = state.copyWith(screenshotList: screenshotList);
  }

  void removeImage(int position) {
    final screenshotList = state.screenshotList.toList();
    screenshotList.removeAt(position);
    state = state.copyWith(screenshotList: screenshotList);
  }
}
