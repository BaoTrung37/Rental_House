import 'package:batru_house_rental/data/repositories/auth/auth_repository.dart';
import 'package:batru_house_rental/data/repositories/chat/chat_repository.dart';
import 'package:batru_house_rental/data/repositories/commune/commune_repository.dart';
import 'package:batru_house_rental/data/repositories/convenient/convenient_repository.dart';
import 'package:batru_house_rental/data/repositories/district/district_repository.dart';
import 'package:batru_house_rental/data/repositories/province/province_repository.dart';
import 'package:batru_house_rental/data/repositories/type/type_repository.dart';
import 'package:batru_house_rental/domain/use_case/auth/get_current_user_information_use_case.dart';
import 'package:batru_house_rental/domain/use_case/auth/google_login_use_case.dart';
import 'package:batru_house_rental/domain/use_case/auth/logout_use_case.dart';
import 'package:batru_house_rental/domain/use_case/chat/get_chat_use_case.dart';
import 'package:batru_house_rental/domain/use_case/commune/get_commune_list_use_case.dart';
import 'package:batru_house_rental/domain/use_case/convenient/get_convenient_list_use_case.dart';
import 'package:batru_house_rental/domain/use_case/district/get_district_list_use_case.dart';
import 'package:batru_house_rental/domain/use_case/province/get_province_list_use_case.dart';
import 'package:batru_house_rental/domain/use_case/type/get_type_list_use_case.dart';
import 'package:batru_house_rental/injection/injector.dart';

class AppModules {
  static Future<void> inject() async {
    /// chat repository
    injector.registerLazySingleton<ChatRepository>(() => ChatRepository());

    /// chat use case
    injector.registerLazySingleton<GetChatUseCase>(() => GetChatUseCase());

    /// auth repository
    injector.registerLazySingleton<AuthRepository>(() => AuthRepository());

    /// auth use case
    injector
        .registerLazySingleton<GoogleLoginUseCase>(() => GoogleLoginUseCase());

    /// get User information
    injector.registerLazySingleton<GetCurrentUserInformationUseCase>(
        () => GetCurrentUserInformationUseCase());

    /// logout use case
    injector.registerLazySingleton<LogoutUseCase>(() => LogoutUseCase());

    /// type repository
    injector.registerLazySingleton<TypeRepository>(() => TypeRepository());

    /// type use case
    injector
        .registerLazySingleton<GetTypeListUseCase>(() => GetTypeListUseCase());

    /// district repository
    injector
        .registerLazySingleton<DistrictRepository>(() => DistrictRepository());

    /// district list use case
    injector.registerLazySingleton<GetDistrictListUseCase>(
        () => GetDistrictListUseCase());

    /// province repository
    injector
        .registerLazySingleton<ProvinceRepository>(() => ProvinceRepository());

    /// province list use case
    injector.registerLazySingleton<GetProvinceListUseCase>(
        () => GetProvinceListUseCase());

    /// commune repository
    injector
        .registerLazySingleton<CommuneRepository>(() => CommuneRepository());

    /// commune list use case
    injector.registerLazySingleton<GetCommuneListUseCase>(
        () => GetCommuneListUseCase());

    /// convenient repository
    injector.registerLazySingleton<ConvenientRepository>(
        () => ConvenientRepository());

    /// convenient list use case
    injector.registerLazySingleton<GetConvenientListUseCase>(
        () => GetConvenientListUseCase());
  }
}
