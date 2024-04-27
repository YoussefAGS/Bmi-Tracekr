import 'package:bmitracker/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/animations/animate_do.dart';
import '../../../../core/common/widgets/text_app.dart';
import '../../../../core/routes/app_route.dart';
import '../../../../core/style/fonts/font_widget_helper.dart';
import '../widgets/auth_title_info.dart';
import '../widgets/login/login_button.dart';
import '../widgets/login/login_text_form.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            AuthTitleInfo(
                description: "Welcome, Please enter your email and get started.",
                title: "Login"),
            const SizedBox(
              height: 50,
            ),

            /// login Text Form
            const LoginTextForm(),
            const SizedBox(
              height: 50,
            ),

            /// login button
            const SizedBox(
              height: 30,
            ),
            CustomFadeInRight(
              duration: 400,
              child: TextButton(
                onPressed: () {
                  context.pushReplacementNamed(AppRoute.signUp);
                },
                child: TextApp(
                    text: "sign_up",
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
