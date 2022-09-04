import 'package:batru_house_rental/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

class Initialize {
  static Future<void> initializationSetup() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
