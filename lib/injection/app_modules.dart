import 'package:batru_house_rental/data/repositories/address/address_repository.dart';
import 'package:batru_house_rental/data/repositories/article/article_repository.dart';
import 'package:batru_house_rental/data/repositories/auth/auth_repository.dart';
import 'package:batru_house_rental/data/repositories/chat_message/chat_message_repository.dart';
import 'package:batru_house_rental/data/repositories/chat_room/chat_room_repository.dart';
import 'package:batru_house_rental/data/repositories/commune/commune_repository.dart';
import 'package:batru_house_rental/data/repositories/convenient/convenient_repository.dart';
import 'package:batru_house_rental/data/repositories/convenient_house/convenient_house_repository.dart';
import 'package:batru_house_rental/data/repositories/district/district_repository.dart';
import 'package:batru_house_rental/data/repositories/favorite/favorite_repository.dart';
import 'package:batru_house_rental/data/repositories/house/house_repository.dart';
import 'package:batru_house_rental/data/repositories/house_type/house_type_repository.dart';
import 'package:batru_house_rental/data/repositories/image_house/image_house_repository.dart';
import 'package:batru_house_rental/data/repositories/province/province_repository.dart';
import 'package:batru_house_rental/data/repositories/type/type_repository.dart';
import 'package:batru_house_rental/domain/use_case/address/post_address_use_case.dart';
import 'package:batru_house_rental/domain/use_case/article/get_article_filter_list_use_case.dart';
import 'package:batru_house_rental/domain/use_case/article/get_article_list_use_case.dart';
import 'package:batru_house_rental/domain/use_case/article/get_article_use_case.dart';
import 'package:batru_house_rental/domain/use_case/article/get_articles_by_user_id_use_case.dart';
import 'package:batru_house_rental/domain/use_case/article/get_initial_article_data_use_case.dart';
import 'package:batru_house_rental/domain/use_case/auth/get_current_user_information_use_case.dart';
import 'package:batru_house_rental/domain/use_case/auth/get_user_by_id_use_case.dart';
import 'package:batru_house_rental/domain/use_case/auth/google_login_use_case.dart';
import 'package:batru_house_rental/domain/use_case/auth/logout_use_case.dart';
import 'package:batru_house_rental/domain/use_case/chat/get_chat_message_list_by_room_id_use_case.dart';
import 'package:batru_house_rental/domain/use_case/chat/get_chat_room_list_by_user_id_use_case.dart';
import 'package:batru_house_rental/domain/use_case/chat/post_chat_room_use_case.dart';
import 'package:batru_house_rental/domain/use_case/chat/post_message_use_case.dart';
import 'package:batru_house_rental/domain/use_case/commune/get_commune_list_use_case.dart';
import 'package:batru_house_rental/domain/use_case/convenient/get_convenient_list_use_case.dart';
import 'package:batru_house_rental/domain/use_case/convenient_house/post_convenient_house_list_use_case.dart';
import 'package:batru_house_rental/domain/use_case/district/get_district_list_use_case.dart';
import 'package:batru_house_rental/domain/use_case/favorite/add_favorite_use_case.dart';
import 'package:batru_house_rental/domain/use_case/favorite/check_favorite_use_case.dart';
import 'package:batru_house_rental/domain/use_case/favorite/get_favorite_list_use_case.dart';
import 'package:batru_house_rental/domain/use_case/favorite/remove_favorite_use_case.dart';
import 'package:batru_house_rental/domain/use_case/house/get_house_use_case.dart';
import 'package:batru_house_rental/domain/use_case/house/post_available_house_use_case.dart';
import 'package:batru_house_rental/domain/use_case/house/post_house_use_case.dart';
import 'package:batru_house_rental/domain/use_case/house/remove_house_use_case.dart';
import 'package:batru_house_rental/domain/use_case/house/un_post_available_use_case.dart';
import 'package:batru_house_rental/domain/use_case/house_type/post_house_type_use_case.dart';
import 'package:batru_house_rental/domain/use_case/image_house/get_image_house_list_use_case.dart';
import 'package:batru_house_rental/domain/use_case/image_house/post_image_house_list_use_case.dart';
import 'package:batru_house_rental/domain/use_case/image_house/post_image_to_storage_use_case.dart';
import 'package:batru_house_rental/domain/use_case/province/get_province_list_use_case.dart';
import 'package:batru_house_rental/domain/use_case/type/get_type_list_use_case.dart';
import 'package:batru_house_rental/injection/injector.dart';

class AppModules {
  static Future<void> inject() async {
    /// chat message repository
    injector.registerLazySingleton<ChatMessageRepository>(
        () => ChatMessageRepository());

    /// chat room repository
    injector
        .registerLazySingleton<ChatRoomRepository>(() => ChatRoomRepository());

    /// get chat message list by id use case
    injector.registerLazySingleton<GetChatMessageListByIdUseCase>(
        () => GetChatMessageListByIdUseCase());

    /// post chat room use case
    injector.registerLazySingleton<PostChatRoomUseCase>(
        () => PostChatRoomUseCase());

    /// post message use case
    injector
        .registerLazySingleton<PostMessageUseCase>(() => PostMessageUseCase());

    /// get chat room list by user Id use case
    injector.registerLazySingleton<GetChatRoomListByUserIdUseCase>(
        () => GetChatRoomListByUserIdUseCase());

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

    /// convenient house repository
    injector.registerLazySingleton<ConvenientHouseRepository>(
        () => ConvenientHouseRepository());

    /// post convenient list use case
    injector.registerLazySingleton<PostConvenientHouseListUseCase>(
        () => PostConvenientHouseListUseCase());

    /// house repository
    injector.registerLazySingleton<HouseRepository>(() => HouseRepository());

    /// house use case
    injector.registerLazySingleton<GetHouseUseCase>(() => GetHouseUseCase());

    /// get user by house id use case
    injector
        .registerLazySingleton<GetUserByIdUseCase>(() => GetUserByIdUseCase());

    /// post house use case
    injector.registerLazySingleton<PostHouseUseCase>(() => PostHouseUseCase());

    /// remove house use case
    injector
        .registerLazySingleton<RemoveHouseUseCase>(() => RemoveHouseUseCase());

    /// image house repository
    injector.registerLazySingleton<ImageHouseRepository>(
        () => ImageHouseRepository());

    /// image house list use case
    injector.registerLazySingleton<GetImageHouseListUseCase>(
        () => GetImageHouseListUseCase());

    /// post image house use case

    injector.registerLazySingleton<PostImageHouseListUseCase>(
        () => PostImageHouseListUseCase());

    /// post image to storage use case

    injector.registerLazySingleton<PostImageToStorageUseCase>(
        () => PostImageToStorageUseCase());

    /// address repository
    injector
        .registerLazySingleton<AddressRepository>(() => AddressRepository());

    /// post address use case
    injector
        .registerLazySingleton<PostAddressUseCase>(() => PostAddressUseCase());

    /// article repository
    injector
        .registerLazySingleton<ArticleRepository>(() => ArticleRepository());

    /// get article list use case
    injector.registerLazySingleton<GetArticleListUseCase>(
        () => GetArticleListUseCase());

    /// get article filter list use case
    injector.registerLazySingleton<GetArticleFilterListUseCase>(
        () => GetArticleFilterListUseCase());

    /// get articles by user id use case
    injector.registerLazySingleton<GetArticlesByUserIdUseCase>(
        () => GetArticlesByUserIdUseCase());

    /// house type repository
    injector.registerLazySingleton<HouseTypeRepository>(
        () => HouseTypeRepository());

    /// post house type use case
    injector.registerLazySingleton<PostHouseTypeUseCase>(
        () => PostHouseTypeUseCase());

    /// get initail data use case
    injector.registerLazySingleton<GetInitialArticleDataUseCase>(
        () => GetInitialArticleDataUseCase());

    /// get article use case
    injector
        .registerLazySingleton<GetArticleUseCase>(() => GetArticleUseCase());

    /// favorite repository
    injector
        .registerLazySingleton<FavoriteRepository>(() => FavoriteRepository());

    /// get favorite list use case
    injector.registerLazySingleton<GetFavoriteListUsecase>(
        () => GetFavoriteListUsecase());

    /// check favorite use case
    injector.registerLazySingleton<CheckFavoriteUseCase>(
        () => CheckFavoriteUseCase());

    /// add favorite use case
    injector
        .registerLazySingleton<AddFavoriteUseCase>(() => AddFavoriteUseCase());

    /// remove favorite use case
    injector.registerLazySingleton<RemoveFavoriteUseCase>(
        () => RemoveFavoriteUseCase());

    /// post available house use case
    injector.registerLazySingleton<PostAvailableHouseUseCase>(
        () => PostAvailableHouseUseCase());

    /// un post available house use case
    injector.registerLazySingleton<UnPostAvailableHouseUseCase>(
        () => UnPostAvailableHouseUseCase());
  }
}
