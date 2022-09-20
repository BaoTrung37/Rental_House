import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth fireAuth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  User get user => fireAuth.currentUser!;

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
          await firestore
              .collection(FirestoreConstants.pathUserCollection)
              .doc(firebaseUser.uid)
              .set({
            FirestoreConstants.avatar: firebaseUser.photoURL,
            FirestoreConstants.username: firebaseUser.displayName,
          });
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
  static const pathUserCollection = 'users';
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
