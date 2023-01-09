import 'package:batru_house_rental/domain/entities/chat_room/chat_room_entity.dart';
import 'package:batru_house_rental/presentation/utilities/enums/loading_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_list_state.freezed.dart';

@freezed
class ChatListState with _$ChatListState {
  const factory ChatListState({
    @Default(LoadingStatus.initial) LoadingStatus loadingStatus,
    @Default(false) bool shouldReLoadData,
    @Default([]) List<ChatRoomEntity> chatRoomList,
  }) = _ChatListState;
}
