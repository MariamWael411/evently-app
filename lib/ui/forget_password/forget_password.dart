import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:evently/providers/user_provider.dart';
import 'package:evently/ui/widgets/custom_elevated_button.dart';
import 'package:evently/ui/widgets/custom_leading_widget.dart';
import 'package:evently/utils/app_color.dart';
import 'package:evently/utils/app_image.dart';
import 'package:evently/utils/config.dart';
import 'package:evently/utils/toast_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:icon_plus/icon_plus.dart';
import 'package:provider/provider.dart';

import '../Login/login_logic.dart';
import '../widgets/custom_text_form_feild.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  var formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  late UserProvider userProvider;

  @override
  Widget build(BuildContext context) {
    userProvider = Provider.of<UserProvider>(context);

    var themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.transparent,
        leading: CustomLeadingWidget(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Theme.of(context).colorScheme.primary,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          AppLocalizations.of(context)!.forget_password,
          style: Theme.of(context).textTheme.labelSmall,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Config.width(context) * 0.04,
          vertical: Config.height(context) * 0.03,
        ),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              spacing: Config.height(context) * 0.05,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  themeProvider.isDark()
                      ? AppImage.forgetPasswordDark
                      : AppImage.forgetPasswordLight,
                ),
                Text(
                  'Reset Your Password',
                  style: Theme.of(
                    context,
                  ).textTheme.headlineLarge?.copyWith(fontSize: 22),
                ),
                CustomTextFormFeild(
                  textInputType: TextInputType.emailAddress,
                  controller: emailController,
                  onValidator: (text) {
                    return LoginLogic.emailValidator(text, context);
                  },
                  hintText: AppLocalizations.of(context)!.enter_your_email,
                  prefixIcon: Icon(Bootstrap.envelope),
                ),

                CustomElevatedButton(
                  onClick: resetPassword,
                  text: AppLocalizations.of(context)!.reset_password,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void resetPassword() async {
    if (formKey.currentState?.validate() == true) {
      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(
          email: emailController.text.trim(),
        );

        ToastUtils.showToastMessage(
          message: AppLocalizations.of(
            context,
          )!.check_your_email_to_reset_password,
          context: context,
          color: AppColor.green,
        );
        Navigator.pop(context);
      } catch (e) {
        ToastUtils.showToastMessage(
          message: AppLocalizations.of(context)!.email_is_incorrect,
          context: context,
          color: AppColor.red,
        );
      }
    }
  }
}
