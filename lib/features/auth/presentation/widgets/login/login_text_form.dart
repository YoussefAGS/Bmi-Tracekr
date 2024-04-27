import 'package:bmitracker/core/extensions/context_extension.dart';
import 'package:bmitracker/features/auth/presentation/widgets/login/login_button.dart';
import 'package:flutter/material.dart';
import '../../../../../core/common/animations/animate_do.dart';
import '../../../../../core/common/widgets/custom_text_field.dart';
import '../../../../../core/utils/app_regex.dart';
import '../../../data/data_source/creat_account.dart';

class LoginTextForm extends StatefulWidget {
  const LoginTextForm({super.key});

  @override
  State<LoginTextForm> createState() => _LoginTextFormState();
}

class _LoginTextFormState extends State<LoginTextForm> {
  bool isShowPassword = false;

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        CustomFadeInRight(
            duration: 200,
            child: CustomTextField(
              controller: emailController,
              hintText: "Your Email",
              keyboardType: TextInputType.emailAddress,
              validator: (v) {
                if (AppRegex.isEmailValid("")) {
                  return "Please enter a valid email";
                }
                return null;
              },
            )),
        SizedBox(
          height: 25,
        ),
        CustomFadeInRight(
            duration: 200,
            child: CustomTextField(
              controller: passwordController,
              hintText: "Password",
              keyboardType: TextInputType.visiblePassword,
              obscureText: isShowPassword,
              validator: (v) {
                if (v == null || v.isEmpty || v.length < 6) {
                  return "Please enter a valid password, not less than 6 characters";
                }
                return null;
              },
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isShowPassword = !isShowPassword;
                  });
                },
                icon: Icon(
                  isShowPassword ? Icons.visibility : Icons.visibility_off,
                  color: context.color.textColor,
                ),
              ),
            )),
        SizedBox(height: 30),
        LoginButton(onPressed: validatForm),

      ],
    ));
  }
  void validatForm() async {
    if (formkey.currentState!.validate()) {
      AuthDataSource.loginWithFirbaseAuth(emailController.text, passwordController.text);
    }
  }
}
