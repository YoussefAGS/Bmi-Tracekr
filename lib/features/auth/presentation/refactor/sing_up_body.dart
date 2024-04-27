import 'package:bmitracker/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/common/animations/animate_do.dart';
import '../../../../core/common/widgets/text_app.dart';
import '../../../../core/routes/app_route.dart';
import '../../../../core/style/fonts/font_widget_helper.dart';
import '../widgets/auth_title_info.dart';
import '../widgets/login/login_button.dart';
import '../widgets/sign_up/sign_up_text_form.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 20.w),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            AuthTitleInfo(
                description:"Welcome, Please add your information",
                title: "Sign Up"),
            const SizedBox(
              height: 40,
            ),
            /// login Text Form
            const SignUpTextForm(),
            const SizedBox(
              height: 20,
            ),

            /// login button
            const SizedBox(
              height: 20,
            ),
            CustomFadeInRight(
              duration: 400,
              child: TextButton(
                onPressed: () {
                  context.pushReplacementNamed(AppRoute.login);
                },
                child: TextApp(
                    text: "You have an account?",
                    theme: context.textStyle.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWidgetHelper.bold,
                        color: context.color.bluePinkLight)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
