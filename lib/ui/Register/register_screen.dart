import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/ui/Register/register_logic.dart';
import 'package:evently/ui/Register/register_text_feild.dart';
import 'package:evently/ui/widgets/custom_divider_widget.dart';
import 'package:evently/ui/widgets/custom_elevated_button.dart';
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
                  RegisterTextFeild(nameController: nameController,
                      emailController: emailController,
                      obscurePassText: obscurePassText,
                      passwordController: passwordController,
                      obscureRePassText: obscureRePassText,
                      rePasswordController: rePasswordController),
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

                  CustomDividerWidget(),
                  SizedBox(height: Config.height(context) * 0.001),

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

  void register() async {
    RegisterLogic.register(
      nameController: nameController,
      formKey: formKey,
      context: context,
      emailController: emailController,
      passwordController: passwordController,
    );
  }


  Future<void> signInWithGoogle() async {
    RegisterLogic.signInWithGoogle(context: context);
  }
}
