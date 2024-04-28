

import 'package:bmitracker/core/extensions/context_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../refactor/auth_custom_painter.dart';
import '../refactor/login_body.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomPaint(
        size: Size(
          MediaQuery.of(context).size.width,
          50,
        ),
        painter: AuthCustomPainter(
          gradient: LinearGradient(
            colors: [
              context.color.bluePinkLight!,
              context.color.bluePinkLight!,
              context.color.bluePinkDark!,
              context.color.bluePinkLight!,
            ],
          ),
        ),
      ),
      body: LoginBody(),
    );
  }
}
