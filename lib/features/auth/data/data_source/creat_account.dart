import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/utils/database_uitles.dart';
import '../model/user.dart';


class AuthDataSource {
  static void CreateAccountWithFirbaseAuth(String emailAddress, String password,
      String userName) async {
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );
    MyUser myUser = MyUser(
        id: credential.user?.uid ?? "", userName: userName, email: emailAddress);
    DatabaseUtils.AddUserToFirebase(myUser);
  }
  static void loginWithFirbaseAuth(String emailAddress,String password)async{
     await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
  }



}
