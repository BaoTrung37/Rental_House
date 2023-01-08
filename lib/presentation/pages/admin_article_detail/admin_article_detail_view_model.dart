// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:batru_house_rental/domain/entities/chat/chat_entity.dart';
import 'package:batru_house_rental/domain/use_case/article/get_article_use_case.dart';
import 'package:batru_house_rental/domain/use_case/article/set_approve_article_use_case.dart';
import 'package:batru_house_rental/domain/use_case/article/set_reject_article_use_case.dart';
import 'package:batru_house_rental/domain/use_case/auth/get_current_user_information_use_case.dart';
import 'package:batru_house_rental/domain/use_case/auth/get_user_by_id_use_case.dart';
import 'package:batru_house_rental/domain/use_case/chat/post_chat_room_use_case.dart';
import 'package:batru_house_rental/domain/use_case/post/remove_post_use_case.dart';
import 'package:batru_house_rental/presentation/pages/admin_article_detail/admin_article_detail_state.dart';
import 'package:batru_house_rental/presentation/utilities/enums/loading_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdminArticleDetailViewModel
    extends StateNotifier<AdminArticleDetailState> {
  AdminArticleDetailViewModel(
    this._getArticleUseCase,
    this._getUserByIdUseCase,
    this._getCurrentUserInformationUseCase,
    this._removeHouseUseCase,
    this._setApproveArticleUseCase,
    this._setRejectArticleUseCase,
    this._postChatRoomUseCase,
  ) : super(const AdminArticleDetailState());

  final GetArticleUseCase _getArticleUseCase;
  final GetUserByIdUseCase _getUserByIdUseCase;
  final GetCurrentUserInformationUseCase _getCurrentUserInformationUseCase;
  final RemovePostUseCase _removeHouseUseCase;
  final SetApproveArticleUseCase _setApproveArticleUseCase;
  final SetRejectArticleUseCase _setRejectArticleUseCase;
  final PostChatRoomUseCase _postChatRoomUseCase;

  late String ownerHouseUserId;
  late String currentUserId;
  late String currentPostId;

  Future<void> init(String postId) async {
    try {
      state = state.copyWith(status: LoadingStatus.inProgress);
      currentPostId = postId;
      final article = await _getArticleUseCase.run(postId);
      final currentUser = await _getCurrentUserInformationUseCase.run();
      ownerHouseUserId = article.post!.userId;
      currentUserId = currentUser.id;
      final ownerHouse = await _getUserByIdUseCase.run(article.post!.userId);

      state = state.copyWith(
        article: article,
        onwerHouse: ownerHouse,
        status: LoadingStatus.success,
      );
      await quantityInit();
    } catch (e) {
      state = state.copyWith(status: LoadingStatus.error);
      debugPrint('Admin article detail: $e');
    }
  }

  Future<void> setApprovedPost() async {
    try {
      state = state.copyWith(browsePostStatus: LoadingStatus.inProgress);
      await _setApproveArticleUseCase.run(SetApprovedArticleInput(
        postId: state.article!.post!.id,
        adminId: currentUserId,
      ));
      await onSendMessage(true);
      state = state.copyWith(
        browsePostStatus: LoadingStatus.success,
      );
    } catch (e) {
      state = state.copyWith(status: LoadingStatus.error);
      debugPrint('Admin article detail: $e');
    }
  }

  Future<void> setUnApprovedPost() async {
    try {
      state = state.copyWith(browsePostStatus: LoadingStatus.inProgress);
      await _setRejectArticleUseCase.run(state.article!.post!.id);
      await onSendMessage(false);
      state = state.copyWith(
        browsePostStatus: LoadingStatus.success,
      );
    } catch (e) {
      state = state.copyWith(status: LoadingStatus.error);
      debugPrint('Admin article detail: $e');
    }
  }

  Future<void> onSendMessage(bool isApprove) async {
    try {
      final currentUser = await _getCurrentUserInformationUseCase.run();
      await _postChatRoomUseCase.run(
        PostChatRoomInput(
          chatEntity: ChatEntity(
            id: DateTime.now().microsecondsSinceEpoch.toString(),
            createdAt: DateTime.now(),
            message: isApprove
                ? 'Bài đăng của bạn đã được duyệt.'
                : 'Bài đăng của bạn đã bị từ chối.',
            senderId: currentUser.id,
            type: ChatType.message.value,
          ),
          receiverId: state.onwerHouse!.id,
          userId: currentUser.id,
        ),
      );
      await _postChatRoomUseCase.run(
        PostChatRoomInput(
          chatEntity: ChatEntity(
            id: DateTime.now().microsecondsSinceEpoch.toString(),
            createdAt: DateTime.now(),
            message: currentPostId,
            senderId: currentUser.id,
            type: ChatType.post.value,
          ),
          receiverId: state.onwerHouse!.id,
          userId: currentUser.id,
        ),
      );
    } catch (e) {
      state = state.copyWith(status: LoadingStatus.error);
      debugPrint('Admin article detail: $e');
    }
  }

  Future<void> quantityInit() async {
    final area = state.article!.post!.area;
    final normalQuantity = area ~/ 10 <= 0 ? 1 : area ~/ 10;
    final smallQuantity = normalQuantity + 1;
    final largeQuantity = normalQuantity - 1 <= 0 ? 1 : normalQuantity - 1;

    state = state.copyWith(
      normalQuantity: normalQuantity,
      smallQuantity: smallQuantity,
      largeQuantity: largeQuantity,
    );
  }

  Future<void> onRemoveHouse() async {
    try {
      state = state.copyWith(removeHouseStatus: LoadingStatus.inProgress);
      await _removeHouseUseCase.run(RemovePostInput(
        postId: state.article!.post!.id,
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
      debugPrint('Admin Remove article: $e');
    }
  }

  Future<String> getOwnerHouseUserId() async {
    return ownerHouseUserId;
  }
}
