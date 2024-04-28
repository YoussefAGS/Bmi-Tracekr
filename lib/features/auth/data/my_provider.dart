
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/database_uitles.dart';
import 'model/user.dart';

class MyProvider extends ChangeNotifier{
  static MyUser? myUser;
  User? firebaseUser;
  MyProvider(){
  firebaseUser= FirebaseAuth.instance.currentUser;
  if(firebaseUser!=null){
    initUser();
  }
  }
  void initUser()async{
    myUser=await DatabaseUtils.readUserFormFirebase(firebaseUser?.uid??"");
  }

}