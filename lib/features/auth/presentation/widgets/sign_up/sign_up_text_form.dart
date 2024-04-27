import 'package:bmitracker/core/extensions/context_extension.dart';
import 'package:bmitracker/features/auth/presentation/widgets/sign_up/sign_up_button.dart';
import 'package:flutter/material.dart';

import '../../../../../core/common/animations/animate_do.dart';
import '../../../../../core/common/widgets/custom_text_field.dart';
import '../../../../../core/utils/app_regex.dart';
import '../../../data/data_source/creat_account.dart';

class SignUpTextForm extends StatefulWidget {
  const SignUpTextForm({super.key});

  @override
  State<SignUpTextForm> createState() => _SignUpTextFormState();
}

class _SignUpTextFormState extends State<SignUpTextForm> {
  bool isShowPassword = false;

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formkey,
        child: Column(
          children: [
            CustomFadeInRight(
                duration: 200,
                child: CustomTextField(
                  controller: userNameController,
                  hintText: "Full Name",
                  keyboardType: TextInputType.text,
                  validator: (v) {
                    if (AppRegex.isEmailValid("")) {
                      return "Please enter your full name";
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
                ))
            ,
            SizedBox(height: 20),
            SignUpButton(onPressed: ValidatFoem)
          ],
        )
    );

  }
  void ValidatFoem()async{
    if(formkey.currentState!.validate()){
      AuthDataSource.CreateAccountWithFirbaseAuth(emailController.text, passwordController.text,userNameController.text);
    }
  }
}
