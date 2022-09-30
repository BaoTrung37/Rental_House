import 'package:batru_house_rental/data/models/room/room_dto.dart';
import 'package:batru_house_rental/presentation/pages/search/search_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchViewModel extends StateNotifier<SearchState> {
  SearchViewModel() : super(const SearchState());

  void init() {}

  void updateRoomType(RoomType type) {
    state = state.copyWith(roomType: type);
  }
}
