import 'dart:io';

import 'package:batru_house_rental/domain/entities/house/house_entity.dart';
import 'package:batru_house_rental/domain/use_case/commune/get_commune_list_use_case.dart';
import 'package:batru_house_rental/domain/use_case/convenient/get_convenient_list_use_case.dart';
import 'package:batru_house_rental/domain/use_case/district/get_district_list_use_case.dart';
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
  ) : super(PostArticleState());

  final GetTypeListUseCase _getTypeListUseCase;
  final GetProvinceListUseCase _getProvinceListUseCase;
  final GetDistrictListUseCase _getDistrictListUseCase;
  final GetCommuneListUseCase _getCommuneListUseCase;
  final GetConvenientListUseCase _getConvenientListUseCase;

  Future<void> initData() async {
    try {
      state = state.copyWith(
        status: LoadingStatus.inProgress,
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
      house: const HouseEntity(
        houseNumber: '',
        id: '',
        streetName: '',
        area: 0,
        capacity: 1,
        depositPrice: 0,
        electricPrice: 0,
        waterPrice: 0,
        internetPrice: 0,
        parkingPrice: 0,
        rentalPrice: 0,
      ),
    );
  }

  // void setHouseAmount(int amount) {
  //   state = state.house.;
  // }

  Future<void> postArticle() async{
    
  }

  void setHouseCapacity(String capacity) {
    try {
      state = state.copyWith(
        house: state.house?.copyWith(
          capacity: int.parse(capacity),
        ),
      );
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  void setHouseArea(String area) {
    try {
      state = state.copyWith(
        house: state.house?.copyWith(
          area: int.parse(area),
        ),
      );
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  void setRentalPrice(String rentalPrice) {
    try {
      state = state.copyWith(
        house: state.house?.copyWith(
          rentalPrice: int.parse(rentalPrice),
        ),
      );
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  void setDipositPrice(String depositPrice) {
    try {
      state = state.copyWith(
        house: state.house?.copyWith(
          depositPrice: int.parse(depositPrice),
        ),
      );
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  void setElectricPrice(String electricPrice) {
    try {
      state = state.copyWith(
        house: state.house?.copyWith(
          electricPrice: int.parse(electricPrice),
        ),
      );
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  void setWaterPrice(String waterPrice) {
    try {
      state = state.copyWith(
        house: state.house?.copyWith(
          waterPrice: int.parse(waterPrice),
        ),
      );
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  void setInternetPrice(String internetPrice) {
    try {
      state = state.copyWith(
        house: state.house?.copyWith(
          internetPrice: int.parse(internetPrice),
        ),
      );
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  void setParkingPrice(String parkingPrice) {
    try {
      state = state.copyWith(
        house: state.house?.copyWith(
          parkingPrice: int.parse(parkingPrice),
        ),
      );
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  void setStreetName(String streetName) {
    state = state.copyWith(
      house: state.house?.copyWith(
        streetName: streetName,
      ),
    );
  }

  void setHouseNumber(String houseNumber) {
    state = state.copyWith(
      house: state.house?.copyWith(
        houseNumber: houseNumber,
      ),
    );
  }

  // void setNumberPhone(String numberPhone) {
  //   state = state.copyWith(
  //     house: state.house?.copyWith(
  //       phoneNumber: numberPhone,
  //     ),
  //   );
  // }

  // void setDescription(String description) {
  //   state = state.copyWith(
  //     house: state.house?.copyWith(
  //       description: description,
  //     ),
  //   );
  // }

  // void setTitle(String title) {
  //   state = state.copyWith(
  //     house: state.house?.copyWith(
  //       title: title,
  //     ),
  //   );
  // }

  void onConvenientTap(String convenientId) {
    state = state.copyWith(
        convenients: state.convenients.map((e) {
      if (e.id == convenientId) {
        return e.copyWith(isSelected: !e.isSelected);
      }
      return e;
    }).toList());
  }

  Future<void> onDistrictChanged(String districtName) async {
    state = state.copyWith(
      currentDistrict: state.districts.firstWhere(
        (e) => e.name == districtName,
      ),
    );
    final communes = await _getCommuneListUseCase.run(state.currentDistrict.id);
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
      currentDistrict: state.communes.firstWhere(
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
