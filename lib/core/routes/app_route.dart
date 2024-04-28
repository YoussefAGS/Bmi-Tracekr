import 'package:flutter/material.dart';


import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/sign_up_screen.dart';
import '../../features/bmi_calculator/data/model/BMI.dart';
import '../../features/bmi_calculator/presentation/screens/bmi_state.dart';
import '../../features/bmi_calculator/presentation/screens/calculator.dart';
import '../../features/bmi_calculator/presentation/screens/recent.dart';
import '../../features/bmi_calculator/presentation/screens/updat_bmi.dart';
import '../common/screens/underplid.dart';
import 'basi_route.dart';

class AppRoute{
  static const String login="login";
  static const String signUp="signUp";
  static const String Calculator="Calculator";
  static const String bmiResult="bmiResult";
  static const String RecentClac="RecentClac";
  static const String bmiUpdate="BmiUpdate";





  static Route<void> routes(RouteSettings routeSettings){
  // final argu= routeSettings.arguments;
  switch(routeSettings.name){
    case login:return BaseRoute(page: const Login());
    case signUp:return BaseRoute(page: const SignUp());
    case Calculator:return BaseRoute(page: const BmiClaculator());
    case bmiResult:
      final Bmi bmiModel = routeSettings.arguments as Bmi;
      return BaseRoute(page:  BmiResultScreen(bmiModel: bmiModel,));
    case bmiUpdate:
      final Bmi bmiModel = routeSettings.arguments as Bmi;
      return BaseRoute(page:BmiUpdate(bmi: bmiModel)  );

    case RecentClac:return BaseRoute(page:  const RecentBmi());


    default :
      return BaseRoute(page:  PageUnderBuildScreen());


  }
}
}