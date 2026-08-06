import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/ui/Login/login_logic.dart';
import 'package:evently/ui/Login/login_text_feild.dart';
import 'package:evently/ui/widgets/custom_divider_widget.dart';
import 'package:evently/ui/widgets/custom_elevated_button.dart';
import 'package:evently/utils/app_route.dart';
import 'package:evently/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:icon_plus/icon_plus.dart';
import 'package:provider/provider.dart';

import '../../providers/theme_provider.dart';
import '../../utils/app_image.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool obscureText = true;

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
                    AppLocalizations.of(context)!.login_to_your_account,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  LoginTextFeild(
                    passwordController: passwordController,
                    emailController: emailController,
                    obscureText: obscureText,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(AppRoute
                              .forgetPasswordScreen);
                        },
                        child: Text(
                          AppLocalizations.of(context)!.forget_passwordtwo,
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: Config.height(context) * 0.001),
                  CustomElevatedButton(
                    text: AppLocalizations.of(context)!.login,
                    onClick: login,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.dont_have_an_account,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(
                            context,
                          ).pushReplacementNamed(AppRoute.registerScreen);
                        },
                        child: Text(
                          AppLocalizations.of(context)!.signup,
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                      ),
                    ],
                  ),

                  CustomDividerWidget(),
                  CustomElevatedButton(
                    onClick: () {
                      signInWithGoogle();
                    },
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
                          AppLocalizations.of(context)!.login_with_google,
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

  void login() async {
    LoginLogic.login(
      formKey: formKey,
      context: context,
      emailController: emailController,
      passwordController: passwordController,
    );
  }

  Future<void> signInWithGoogle() async {
    LoginLogic.signInWithGoogle(context: context);
  }
}
