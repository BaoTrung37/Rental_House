// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:batru_house_rental/data/models/favorite/favorite_response.dart';
import 'package:batru_house_rental/domain/entities/chat/chat_entity.dart';
import 'package:batru_house_rental/domain/use_case/article/get_article_list_use_case.dart';
import 'package:batru_house_rental/domain/use_case/article/get_article_use_case.dart';
import 'package:batru_house_rental/domain/use_case/auth/get_current_user_information_use_case.dart';
import 'package:batru_house_rental/domain/use_case/auth/get_user_by_id_use_case.dart';
import 'package:batru_house_rental/domain/use_case/chat/post_chat_room_use_case.dart';
import 'package:batru_house_rental/domain/use_case/favorite/add_favorite_use_case.dart';
import 'package:batru_house_rental/domain/use_case/favorite/check_favorite_use_case.dart';
import 'package:batru_house_rental/domain/use_case/favorite/remove_favorite_use_case.dart';
import 'package:batru_house_rental/domain/use_case/house/post_available_house_use_case.dart';
import 'package:batru_house_rental/domain/use_case/house/remove_house_use_case.dart';
import 'package:batru_house_rental/domain/use_case/house/un_post_available_use_case.dart';
import 'package:batru_house_rental/presentation/pages/house_detail/house_detail_state.dart';
import 'package:batru_house_rental/presentation/utilities/enums/loading_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HouseDetailViewModel extends StateNotifier<HouseDetailState> {
  HouseDetailViewModel(
    this._getArticleUseCase,
    this._getUserByIdUseCase,
    this._getCurrentUserInformationUseCase,
    this._getArticleListUseCase,
    this._postChatRoomUseCase,
    this._removeHouseUseCase,
    this._checkFavoriteUseCase,
    this._addFavoriteUseCase,
    this._removeFavoriteUseCase,
    this._postAvailableHouseUseCase,
    this._unPostAvailableHouseUseCase,
  ) : super(const HouseDetailState());

  final GetArticleUseCase _getArticleUseCase;
  final GetUserByIdUseCase _getUserByIdUseCase;
  final GetCurrentUserInformationUseCase _getCurrentUserInformationUseCase;
  final GetArticleListUseCase _getArticleListUseCase;
  final PostChatRoomUseCase _postChatRoomUseCase;
  final RemoveHouseUseCase _removeHouseUseCase;
  final CheckFavoriteUseCase _checkFavoriteUseCase;
  final AddFavoriteUseCase _addFavoriteUseCase;
  final RemoveFavoriteUseCase _removeFavoriteUseCase;
  final PostAvailableHouseUseCase _postAvailableHouseUseCase;
  final UnPostAvailableHouseUseCase _unPostAvailableHouseUseCase;

  late String ownerHouseUserId;
  late String currentUserId;
  Future<void> init(String houseId) async {
    try {
      state = state.copyWith(status: LoadingStatus.inProgress);
      final article = await _getArticleUseCase.run(houseId);
      final currentUser = await _getCurrentUserInformationUseCase.run();
      ownerHouseUserId = article.house!.userId;
      currentUserId = currentUser.id;
      final ownerHouse = await _getUserByIdUseCase.run(article.house!.userId);
      final houseArticleRelativeList = await _getArticleListUseCase.run(10);

      final favoriteId = await _checkFavoriteUseCase.run(
        GetFavoriteInput(
          userId: currentUserId,
          houseId: article.house!.id,
        ),
      );

      state = state.copyWith(
        article: article,
        onwerHouse: ownerHouse,
        houseArticleRelativeList: houseArticleRelativeList,
        isYourHouse: currentUser.id == ownerHouseUserId,
        isFavorite: favoriteId != null,
        favoriteId: favoriteId,
        status: LoadingStatus.success,
      );
    } catch (e) {
      state = state.copyWith(status: LoadingStatus.error);
      debugPrint('House detail: $e');
    }
  }

  Future<void> onFavoriteChanged() async {
    try {
      state = state.copyWith(isFavorite: !state.isFavorite);

      final isFavorite = state.isFavorite;
      if (isFavorite) {
        final favoriteId = DateTime.now().microsecondsSinceEpoch.toString();
        await _addFavoriteUseCase.run(
          FavoriteResponse(
            id: favoriteId,
            address: state.article!.house!.address,
            houseId: state.article!.house!.id,
            userId: currentUserId,
            rentalPrice: state.article!.house!.rentalPrice,
            url: state.article!.imageList.first.url,
            title: state.article!.house!.title,
            typeHouse: state.article!.type!.name,
          ),
        );
        state = state.copyWith(favoriteId: favoriteId);
      } else {
        await _removeFavoriteUseCase.run(state.favoriteId ?? '');
      }
    } catch (e) {
      state = state.copyWith(
        status: LoadingStatus.error,
        // appError: 'Lỗi xóa bài đăng',
      );
      debugPrint('Favorite changed: $e');
    }
  }

  Future<void> onAvailablePostChanged() async {
    try {
      final isAvailablePost = state.article?.house?.isAvailablePost;
      if (isAvailablePost == false) {
        await _postAvailableHouseUseCase.run(state.article!.house!.id);
      } else {
        await _unPostAvailableHouseUseCase.run(state.article!.house!.id);
      }
      state = state.copyWith(
        article: state.article!.copyWith(
          house: state.article!.house!.copyWith(
            isAvailablePost: !isAvailablePost!,
          ),
        ),
      );
    } catch (e) {
      debugPrint('AvailablePost changed: $e');
    }
  }

  Future<void> onRemoveHouse() async {
    try {
      state = state.copyWith(removeHouseStatus: LoadingStatus.inProgress);
      await _removeHouseUseCase.run(RemoveHouseInput(
        houseId: state.article!.house!.id,
        imageIdList: state.article!.imageList.map((e) => e.id).toList(),
        convenientIdList:
            state.article!.convenientList.map((e) => e.id).toList(),
        houseTypeId: state.article!.type!.id,
      ));
      state = state.copyWith(removeHouseStatus: LoadingStatus.success);
    } catch (e) {
      state = state.copyWith(
        status: LoadingStatus.error,
        appError: 'Lỗi xóa bài đăng',
      );
      debugPrint('Remove house: $e');
    }
  }

  Future<void> onSendMessage() async {
    try {
      state = state.copyWith(sendMessageStatus: LoadingStatus.inProgress);
      final currentUser = await _getCurrentUserInformationUseCase.run();
      await _postChatRoomUseCase.run(
        PostChatRoomInput(
          chatEntity: ChatEntity(
            id: DateTime.now().microsecondsSinceEpoch.toString(),
            createdAt: DateTime.now(),
            message: state.message,
            senderId: currentUser.id,
            type: ChatType.message.value,
          ),
          receiverId: state.onwerHouse!.id,
          userId: currentUser.id,
        ),
      );
      state = state.copyWith(
        message: '',
        sendMessageStatus: LoadingStatus.success,
      );
    } catch (e) {
      state = state.copyWith(status: LoadingStatus.error);
      debugPrint('House detail: $e');
    }
  }

  Future<String> getOwnerHouseUserId() async {
    return ownerHouseUserId;
  }

  void onMessageChanged(String message) {
    state = state.copyWith(message: message);
  }
}
