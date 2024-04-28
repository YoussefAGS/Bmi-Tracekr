
import 'package:bmitracker/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

import '../../../../../core/common/animations/animate_do.dart';
import '../../../../../core/common/widgets/custom_liner_button.dart';
import '../../../../../core/common/widgets/text_app.dart';
import '../../../../../core/style/fonts/font_widget_helper.dart';

class CalculatorButton extends StatelessWidget {
  final bool? isUpdate;
  const CalculatorButton({super.key, required this.onPressed, this.isUpdate});
  final VoidCallback onPressed;


  @override
  Widget build(BuildContext context) {
    return CustomFadeInRight(
      duration: 600,
      child: CustomLinearButton(
          height: 50,
          width: MediaQuery.of(context).size.width,
          onPressed: onPressed,
          child: TextApp(
            text: isUpdate == true ? "Update" : "calculate",
            theme: context.textStyle.copyWith(fontSize: 16,fontWeight: FontWidgetHelper.bold),
          )),
    );
  }
}