import 'package:batru_house_rental/data/models/user/user_response.dart';
import 'package:batru_house_rental/data/services/preference_services/shared_preferences_manager.dart';
import 'package:batru_house_rental/domain/use_case/auth/email_login_use_case.dart';
import 'package:batru_house_rental/presentation/utilities/enums/login_type.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository {
  AuthRepository(this.sharedPreferencesManager);

  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth fireAuth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final SharedPreferencesManager sharedPreferencesManager;

  User? get user => fireAuth.currentUser;

  Future<UserResponse> getCurrentUserInformation() async {
    final userDocument =
        await firestore.collection('user').doc(user!.uid).get();
    final userResponse = UserResponse.fromJson(userDocument.data()!);
    return userResponse;
  }

  Future<UserResponse> getUserById(String userId) async {
    final userDocument = await firestore.collection('user').doc(userId).get();
    final userResponse = UserResponse.fromJson(userDocument.data()!);
    return userResponse;
  }

  Future<bool> signInWithGoogle() async {
    final googleUser = await googleSignIn.signIn();
    await sharedPreferencesManager.saveLoginType(param: LoginType.customer);
    if (googleUser != null) {
      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final firebaseUser =
          (await fireAuth.signInWithCredential(credential)).user;

      if (firebaseUser != null) {
        final QuerySnapshot result = await firestore
            .collection(FirestoreConstants.pathUserCollection)
            .where(FirestoreConstants.id, isEqualTo: firebaseUser.uid)
            .get();
        final document = result.docs;
        if (document.isEmpty) {
          final userResponse = UserResponse(
            id: firebaseUser.uid,
            name: firebaseUser.displayName!,
            avatar: firebaseUser.photoURL!,
            role: 0,
          );
          await firestore
              .collection(FirestoreConstants.pathUserCollection)
              .doc(firebaseUser.uid)
              .set(userResponse.toJson());
        }

        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  Future<bool> signInWithEmail(EmailLoginInput input) async {
    final emailAddress = input.email;
    final password = input.password;
    // try {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: emailAddress, password: password);
    final user = credential.user;
    await sharedPreferencesManager.saveLoginType(param: LoginType.admin);
    if (user != null) {
      return true;
    } else {
      return false;
    }
    // } on FirebaseAuthException catch (e) {
    //   if (e.code == 'user-not-found') {
    //     debugPrint('No user found for that email.');
    //   } else if (e.code == 'wrong-password') {
    //     debugPrint('Wrong password provided for that user.');
    //   }
    // }
    // return false;
  }

  Future<void> googleLogout() async {
    await clearSharedPreferencesPropertiesWhenLogout();
    await fireAuth.signOut();
    await googleSignIn.disconnect();
    await googleSignIn.signOut();
  }

  Future<void> emailLogout() async {
    await clearSharedPreferencesPropertiesWhenLogout();
    await fireAuth.signOut();
  }

  Future clearSharedPreferencesPropertiesWhenLogout() => Future.wait([
        // sharedPreferencesManager.removeLoginType(),
      ]);
}

class FirestoreConstants {
  static const pathUserCollection = 'user';
  static const pathChatsCollection = 'chats';
  static const username = 'username';
  static const avatar = 'avatar';
  static const aboutMe = 'aboutMe';
  static const id = 'id';
  static const lastMessage = 'lastMessage';
  static const timestamp = 'timestamp';
  static const idFrom = 'idFrom';
  static const idTo = 'idTo';
  static const type = 'type';
}
