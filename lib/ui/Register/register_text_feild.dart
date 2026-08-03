import 'package:evently/ui/Register/register_logic.dart';
import 'package:flutter/material.dart';
import 'package:icon_plus/icon_plus.dart';

import '../../l10n/app_localizations.dart';
import '../../utils/config.dart';
import '../Login/login_logic.dart';
import '../widgets/custom_text_form_feild.dart';

class RegisterTextFeild extends StatefulWidget {
  TextEditingController nameController;
  TextEditingController emailController;
  bool obscurePassText;
  bool obscureRePassText;
  TextEditingController passwordController;

  TextEditingController rePasswordController;

  RegisterTextFeild({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.obscurePassText,
    required this.passwordController,
    required this.obscureRePassText,
    required this.rePasswordController,
  });

  @override
  State<RegisterTextFeild> createState() => _RegisterTextFeildState();
}

class _RegisterTextFeildState extends State<RegisterTextFeild> {
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: Config.height(context) * 0.02,
      children: [
        CustomTextFormFeild(
          hintText: AppLocalizations.of(context)!.enter_your_name,
          prefixIcon: Icon(Bootstrap.person),
          controller: widget.nameController,
          onValidator: (text) {
            return RegisterLogic.nameValidator(text, context);
          },
        ),
        CustomTextFormFeild(
          hintText: AppLocalizations.of(context)!.enter_your_email,
          prefixIcon: Icon(Bootstrap.envelope),
          controller: widget.emailController,
          textInputType: TextInputType.emailAddress,
          onValidator: (text) {
            return LoginLogic.emailValidator(text, context);
          },
        ),
        CustomTextFormFeild(
          textInputType: TextInputType.number,
          obscureText: widget.obscurePassText,
          hintText: AppLocalizations.of(context)!.enter_your_password,
          prefixIcon: Icon(Bootstrap.lock),
          controller: widget.passwordController,
          onValidator: (text) {
            return LoginLogic.passwordValidator(text, context);
          },
          sufixIcon: IconButton(
            icon: Icon(
              widget.obscurePassText == true
                  ? Bootstrap.eye_slash
                  : Bootstrap.eye,
            ),
            onPressed: () {
              if (widget.obscurePassText == true) {
                widget.obscurePassText = false;
              } else {
                widget.obscurePassText = true;
              }
              setState(() {});
            },
          ),
        ),
        CustomTextFormFeild(
          textInputType: TextInputType.number,
          obscureText: widget.obscureRePassText,
          hintText: AppLocalizations.of(context)!.confirm_your_password,
          prefixIcon: Icon(Bootstrap.lock),
          controller: widget.rePasswordController,
          onValidator: (text) {
            return RegisterLogic.rePasswordValidator(
              text,
              context,
              widget.passwordController,
            );
          },
          sufixIcon: IconButton(
            icon: Icon(
              widget.obscureRePassText == true
                  ? Bootstrap.eye_slash
                  : Bootstrap.eye,
            ),
            onPressed: () {
              if (widget.obscureRePassText == true) {
                widget.obscureRePassText = false;
              } else {
                widget.obscureRePassText = true;
              }
              setState(() {});
            },
          ),
        ),
      ],
    );
  }
}
