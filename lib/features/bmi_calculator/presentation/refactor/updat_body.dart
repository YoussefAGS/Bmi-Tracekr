import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../data/model/BMI.dart';
import '../widgets/calculator/bmi_updat_text_form.dart';
import '../widgets/calculator/calc_text_form.dart';
import '../widgets/calculator_title.dart';

class UpdateBody extends StatelessWidget {
  final Bmi bmi;

  const UpdateBody({super.key, required this.bmi});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
      child:  SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            CalculatorTitleInfo(
              description: 'Welcome, Please add your  new information',
              title: 'BMI Calculator',),
            SizedBox(
              height: 30,
            ),
            BmiUdateTextForm(bmi: bmi,),
          ],
        ),
      ),
    );
  }
}
