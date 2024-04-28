
import 'package:bmitracker/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/animations/animate_do.dart';
import '../../../../core/common/widgets/text_app.dart';
import '../../../../core/style/fonts/font_widget_helper.dart';

class CalculatorTitleInfo extends StatelessWidget {
  const CalculatorTitleInfo({
    required this.description,
    required this.title,
    super.key,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return CustomFadeInDown(
      duration: 400,
      child: Column(
        children: [
          // title
          TextApp(
            text: title,
            theme: context.textStyle.copyWith(
              fontSize: 24,
              fontWeight: FontWidgetHelper.bold,
              color: context.color.textColor,
            ),
          ),
          SizedBox(height: 10.h),
          TextApp(
            text: description,
            theme: context.textStyle.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWidgetHelper.medium,
              color: context.color.textColor,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
