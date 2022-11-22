import 'package:batru_house_rental/domain/entities/chat/chat_entity.dart';
import 'package:batru_house_rental/domain/use_case/article/get_article_list_use_case.dart';
import 'package:batru_house_rental/domain/use_case/article/get_article_use_case.dart';
import 'package:batru_house_rental/domain/use_case/auth/get_current_user_information_use_case.dart';
import 'package:batru_house_rental/domain/use_case/auth/get_user_by_id_use_case.dart';
import 'package:batru_house_rental/domain/use_case/chat/post_chat_room_use_case.dart';
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
  ) : super(const HouseDetailState());

  final GetArticleUseCase _getArticleUseCase;
  final GetUserByIdUseCase _getUserByIdUseCase;
  final GetCurrentUserInformationUseCase _getCurrentUserInformationUseCase;
  final GetArticleListUseCase _getArticleListUseCase;
  final PostChatRoomUseCase _postChatRoomUseCase;
  late String ownerHouseUserId;
  Future<void> init(String houseId) async {
    try {
      state = state.copyWith(status: LoadingStatus.inProgress);
      final article = await _getArticleUseCase.run(houseId);
      final currentUser = await _getCurrentUserInformationUseCase.run();
      ownerHouseUserId = article.house!.userId;
      final ownerHouse = await _getUserByIdUseCase.run(article.house!.userId);
      final houseArticleRelativeList = await _getArticleListUseCase.run(10);
      state = state.copyWith(
        article: article,
        onwerHouse: ownerHouse,
        houseArticleRelativeList: houseArticleRelativeList,
        isYourHouse: currentUser.id == ownerHouseUserId,
        status: LoadingStatus.success,
      );
    } catch (e) {
      state = state.copyWith(status: LoadingStatus.error);
      debugPrint('House detail: $e');
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
