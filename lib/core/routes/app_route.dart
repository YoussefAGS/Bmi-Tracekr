import 'package:flutter/material.dart';


import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/sign_up_screen.dart';
import '../common/screens/underplid.dart';
import 'basi_route.dart';

class AppRoute{
  static const String login="login";
  static const String signUp="signUp";
  static const String dd="dd";



  static Route<void> routes(RouteSettings routeSettings){
  // final argu= routeSettings.arguments;
  switch(routeSettings.name){
    case login:return BaseRoute(page: const Login());
    case signUp:return BaseRoute(page: const SignUp());
    default :
      return BaseRoute(page:  PageUnderBuildScreen());


  }
}
}