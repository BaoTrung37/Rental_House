import 'package:batru_house_rental/domain/entities/type/type_entity.dart';
import 'package:batru_house_rental/presentation/utilities/enums/loading_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_article_state.freezed.dart';

@freezed
class PostArticleState with _$PostArticleState {
  const factory PostArticleState({
    @Default(LoadingStatus.initial) LoadingStatus status,
    @Default(0) int currentStep,
    @Default(false) bool isParkingSpaceAvailable,
    @Default([]) List<TypeEntity> types,
    @Default(1) int houseAmount,
    @Default(1) int houseCapacity,
    @Default(1) int houseArea,
    @Default(0) int housePrice,
    @Default(0) int houseDepositPrice,
    @Default(0) int houseElectricityPrice,
    @Default(0) int houseWaterPrice,
    @Default(0) int houseInternetPrice,
    @Default(0) int housePackingPrice,
  }) = _PostArticleState;
}
