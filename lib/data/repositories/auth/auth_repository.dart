import 'package:batru_house_rental/data/models/user/user_response.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth fireAuth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  User? get user => fireAuth.currentUser;

  Future<UserResponse> getCurrentUserInformation() async {
    final userDocument = await firestore.collection('user').doc(user!.uid).get();
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

  Future<void> signOut() async {
    await fireAuth.signOut();
    await googleSignIn.disconnect();
    await googleSignIn.signOut();
  }
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
