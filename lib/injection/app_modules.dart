import 'package:batru_house_rental/data/repositories/chat_repository.dart';
import 'package:batru_house_rental/domain/use_case/chat/get_chat_use_case.dart';
import 'package:batru_house_rental/injection/injector.dart';

class AppModules {
  static Future<void> inject() async {
    /// chat repository
    injector.registerLazySingleton<ChatRepository>(() => ChatRepository());

    /// chat use case
    injector.registerLazySingleton<GetChatUseCase>(() => GetChatUseCase());
  }
}
