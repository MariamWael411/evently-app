import 'package:flutter/material.dart';
import 'package:icon_plus/icon_plus.dart';

import '../../l10n/app_localizations.dart';
import '../../utils/config.dart';
import '../widgets/custom_text_form_feild.dart';
import 'login_logic.dart';

class LoginTextFeild extends StatefulWidget {
  bool obscureText;
  TextEditingController emailController;
  TextEditingController passwordController;

  LoginTextFeild({
    super.key,
    required this.passwordController,
    required this.emailController,
    required this.obscureText,
  });

  @override
  State<LoginTextFeild> createState() => _LoginTextFeildState();
}

class _LoginTextFeildState extends State<LoginTextFeild> {
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: Config.height(context) * 0.02,
      children: [
        CustomTextFormFeild(
          textInputType: TextInputType.emailAddress,
          controller: widget.emailController,
          onValidator: (text) {
            return LoginLogic.emailValidator(text, context);
          },
          hintText: AppLocalizations.of(context)!.enter_your_email,
          prefixIcon: Icon(Bootstrap.envelope),
        ),
        CustomTextFormFeild(
          textInputType: TextInputType.number,
          obscureText: widget.obscureText,
          controller: widget.passwordController,
          onValidator: (text) {
            return LoginLogic.passwordValidator(text, context);
          },
          hintText: AppLocalizations.of(context)!.enter_your_password,
          prefixIcon: Icon(Bootstrap.lock),
          sufixIcon: IconButton(
            icon: Icon(
              widget.obscureText == true ? Bootstrap.eye_slash : Bootstrap.eye,
            ),
            onPressed: () {
              if (widget.obscureText == true) {
                widget.obscureText = false;
              } else {
                widget.obscureText = true;
              }
              setState(() {});
            },
          ),
        ),
      ],
    );
  }
}
