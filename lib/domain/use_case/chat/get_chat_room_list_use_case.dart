import 'package:batru_house_rental/data/repositories/chat/chat_repository.dart';
import 'package:batru_house_rental/domain/entities/chat/chat_room_entity.dart';
import 'package:batru_house_rental/domain/use_case/use_case.dart';
import 'package:batru_house_rental/injection/injector.dart';

class GetChatRoomListUseCase
    extends FutureUseCase<String, List<ChatRoomEntity>> {
  @override
  Future<List<ChatRoomEntity>> run(String input) =>
      injector.get<ChatRepository>().getChatRoomList(input);
}
