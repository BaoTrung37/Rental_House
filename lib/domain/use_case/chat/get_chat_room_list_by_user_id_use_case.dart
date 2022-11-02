import 'package:batru_house_rental/data/repositories/chat/chat_room_repository.dart';
import 'package:batru_house_rental/domain/entities/chat/chat_room_entity.dart';
import 'package:batru_house_rental/domain/use_case/use_case.dart';
import 'package:batru_house_rental/injection/injector.dart';

class GetChatRoomListByUserIdUseCase
    extends FutureUseCase<String, List<ChatRoomEntity>> {
  @override
  Future<List<ChatRoomEntity>> run(String input) {
    return injector.get<ChatRoomRepository>().getChatRoomListByUserId(input);
  }
}
