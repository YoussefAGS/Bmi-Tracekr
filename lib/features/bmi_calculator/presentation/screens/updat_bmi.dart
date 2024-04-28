
import 'package:bmitracker/features/bmi_calculator/presentation/refactor/updat_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/model/BMI.dart';

class BmiUpdate extends StatelessWidget {
  const BmiUpdate({super.key, required this.bmi});
  final Bmi bmi;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: UpdateBody(bmi: bmi,)
    );
  }
}
