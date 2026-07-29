import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/ui/widgets/custom_elevated_button.dart';
import 'package:evently/ui/widgets/custom_text_form_feild.dart';
import 'package:evently/utils/app_route.dart';
import 'package:evently/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:icon_plus/icon_plus.dart';
import 'package:provider/provider.dart';

import '../../providers/theme_provider.dart';
import '../../utils/app_image.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var rePasswordController = TextEditingController();
  bool obscurePassText = true;
  bool obscureRePassText = true;

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Config.width(context) * 0.04,
            vertical: Config.height(context) * 0.04,
          ),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: Config.height(context) * 0.02,
                children: [
                  Image.asset(
                    themeProvider.isDark()
                        ? AppImage.iconBlack
                        : AppImage.iconLight,
                  ),
                  Text(
                    AppLocalizations.of(context)!.create_your_account,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  CustomTextFormFeild(
                    hintText: AppLocalizations.of(context)!.enter_your_name,
                    prefixIcon: Icon(Bootstrap.person),
                    controller: nameController,
                    onValidator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return AppLocalizations.of(context)!.please_enter_name;
                      }
                      return null;
                    },
                  ),
                  CustomTextFormFeild(
                    hintText: AppLocalizations.of(context)!.enter_your_email,
                    prefixIcon: Icon(Bootstrap.envelope),
                    controller: emailController,
                    textInputType: TextInputType.emailAddress,
                    onValidator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return AppLocalizations.of(context)!.please_enter_email;
                      }
                      final bool emailValid = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                      ).hasMatch(text);
                      if (!emailValid) {
                        return AppLocalizations.of(
                          context,
                        )!.please_enter_valid_Email;
                      }
                      return null;
                    },
                  ),
                  CustomTextFormFeild(
                    textInputType: TextInputType.number,
                    obscureText: obscurePassText,
                    hintText: AppLocalizations.of(context)!.enter_your_password,
                    prefixIcon: Icon(Bootstrap.lock),
                    controller: passwordController,
                    onValidator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return AppLocalizations.of(
                          context,
                        )!.please_enter_password;
                      }
                      if (text.length < 6) {
                        return AppLocalizations.of(
                          context,
                        )!.password_should_be_at_least_6_chars;
                      }
                      return null;
                    },
                    sufixIcon: IconButton(
                      icon: Icon(
                        obscurePassText == true
                            ? Bootstrap.eye_slash
                            : Bootstrap.eye,
                      ),
                      onPressed: () {
                        if (obscurePassText == true) {
                          obscurePassText = false;
                        } else {
                          obscurePassText = true;
                        }
                        setState(() {});
                      },
                    ),
                  ),
                  CustomTextFormFeild(
                    textInputType: TextInputType.number,
                    obscureText: obscureRePassText,
                    hintText: AppLocalizations.of(
                      context,
                    )!.confirm_your_password,
                    prefixIcon: Icon(Bootstrap.lock),
                    controller: rePasswordController,
                    onValidator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return AppLocalizations.of(
                          context,
                        )!.please_enter_confirm_password;
                      }
                      if (text != passwordController.text) {
                        return AppLocalizations.of(
                          context,
                        )!.repassword_doesnt_math_password;
                      }
                      return null;
                    },
                    sufixIcon: IconButton(
                      icon: Icon(
                        obscureRePassText == true
                            ? Bootstrap.eye_slash
                            : Bootstrap.eye,
                      ),
                      onPressed: () {
                        if (obscureRePassText == true) {
                          obscureRePassText = false;
                        } else {
                          obscureRePassText = true;
                        }
                        setState(() {});
                      },
                    ),
                  ),
                  SizedBox(height: Config.height(context) * 0.003),

                  CustomElevatedButton(
                    text: AppLocalizations.of(context)!.sign_up,
                    onClick: register,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.already_have_an_account,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(
                            context,
                          ).pushReplacementNamed(AppRoute.loginScreen);
                        },
                        child: Text(
                          AppLocalizations.of(context)!.login,
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          indent: Config.width(context) * 0.03,
                          endIndent: Config.width(context) * 0.03,
                          color: Theme.of(
                            context,
                          ).colorScheme.onPrimaryContainer,
                        ),
                      ),
                      Text(
                        AppLocalizations.of(context)!.or,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      Expanded(
                        child: Divider(
                          indent: Config.width(context) * 0.04,
                          endIndent: Config.width(context) * 0.02,
                          color: Theme.of(
                            context,
                          ).colorScheme.onPrimaryContainer,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: Config.height(context) * 0.001),

                  CustomElevatedButton(
                    onClick: () {},
                    borderColor: Theme.of(
                      context,
                    ).colorScheme.onPrimaryContainer,
                    backgroundColor: Theme.of(context).colorScheme.onPrimary,
                    item: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: Config.width(context) * 0.02,
                      children: [
                        Brand(Brands.google),
                        Text(
                          AppLocalizations.of(context)!.sign_up_with_google,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void register() {
    if (formKey.currentState?.validate() == true) {
      Navigator.of(context).pushReplacementNamed(AppRoute.primaryScreen);
    }
  }
}
