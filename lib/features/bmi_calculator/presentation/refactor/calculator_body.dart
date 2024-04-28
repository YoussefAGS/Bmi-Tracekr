import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/calculator/calc_text_form.dart';
import '../widgets/calculator_title.dart';

class CalculatorBody extends StatelessWidget {
  const CalculatorBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
      child: const SingleChildScrollView(
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
            BmiClaculatorTextForm(),
          ],
        ),
      ),
    );
  }
}
