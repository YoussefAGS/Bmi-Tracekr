
import 'package:bmitracker/features/bmi_calculator/presentation/refactor/calculator_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/model/BMI.dart';

class BmiClaculator extends StatelessWidget {
  const BmiClaculator({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CalculatorBody()
    );
  }
}
