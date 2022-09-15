import 'package:batru_house_rental/presentation/utilities/enums/loading_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_list_state.freezed.dart';

@freezed
class ChatListState with _$ChatListState {
  const factory ChatListState({
    @Default(LoadingStatus.initial) LoadingStatus loadingStatus,
    @Default([]) List<String> chatList,
  }) = _ChatListState;
}
