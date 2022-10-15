import 'package:batru_house_rental/domain/entities/district/district_entity.dart';
import 'package:batru_house_rental/presentation/utilities/enums/loading_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(LoadingStatus.initial) LoadingStatus status,
    @Default([]) List<DistrictEntity> famousDistrictList,
  }) = _HomeState;
}
