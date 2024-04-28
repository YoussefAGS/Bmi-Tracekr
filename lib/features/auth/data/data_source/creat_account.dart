import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/utils/database_uitles.dart';
import '../model/user.dart';


class AuthDataSource {
  static Future<bool> createUserWithFirebaseAuth(String emailAddress, String password, String userName) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      if (credential.user != null) {
        MyUser myUser = MyUser(
          id: credential.user!.uid,
          userName: userName,
          email: emailAddress,
        );
        DatabaseUtils.AddUserToFirebase(myUser);
        return true;
      } else {
        return false; // User creation failed
      }
    } catch (e) {
      return false; // Error occurred during user creation
    }
  }

  static Future<bool> loginWithFirebaseAuth(String emailAddress, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return true; // Login successful
    } catch (e) {
      return false; // Login failed or error occurred
    }
  }




}
