import 'package:batru_house_rental/data/models/chat/chat_entity.dart';
import 'package:batru_house_rental/data/repositories/chat/chat_repository.dart';
import 'package:batru_house_rental/domain/use_case/use_case.dart';
import 'package:batru_house_rental/injection/injector.dart';

class GetChatUseCase extends FutureOutputUseCase<List<ChatEntity>> {
  @override
  Future<List<ChatEntity>> run() =>
      injector.get<ChatRepository>().getChatList();
}
