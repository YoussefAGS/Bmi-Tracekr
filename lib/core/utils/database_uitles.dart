import 'package:cloud_firestore/cloud_firestore.dart';

import '../../features/auth/data/model/user.dart';

class DatabaseUtils {
  static CollectionReference<MyUser> getUserCollection() {
    return FirebaseFirestore.instance.collection("Users").withConverter<MyUser>(
        fromFirestore: (snapshot, option) => MyUser.fromJson(snapshot.data()!),
        toFirestore: (value, option) => value.toJson());
  }

  static Future<void> AddUserToFirebase(MyUser user) {
    return getUserCollection().doc(user.id).set(user);
  }

  static Future<MyUser?> readUserFormFirebase(String id) async {
    DocumentSnapshot<MyUser> user = await getUserCollection().doc(id).get();
    var myUser = user.data();
    return myUser;
  }
}