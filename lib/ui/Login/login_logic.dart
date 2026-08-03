import 'package:evently/firebase_utils.dart';
import 'package:evently/providers/user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../utils/app_route.dart';
import '../../utils/utils_dialog.dart';

class LoginLogic {
  static void login({
    required var formKey,
    required BuildContext context,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  }) async {
    if (formKey.currentState?.validate() == true) {
      try {
        //todo: show loading
        UtilsDialog.showLoading(
          context: context,
          content: AppLocalizations.of(context)!.loading,
        );
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
              email: emailController.text,
              password: passwordController.text,
            );
        //todo: save in firestore
        var myUser = await FirebaseUtils.getUserFromFireStore(
          credential.user?.uid ?? '',
        );
        if (myUser == null) {
          return;
        }
        //todo:save in provider
        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.updateUser(myUser);

        //todo: hide loading
        UtilsDialog.hideDialog(context: context);
        //todo: show message success
        UtilsDialog.showMessage(
          context: context,
          content: AppLocalizations.of(context)!.login_successfully,
          title: AppLocalizations.of(context)!.success,
          posAction: AppLocalizations.of(context)!.ok,
          posActions: () {
            Navigator.pushReplacementNamed(context, AppRoute.primaryScreen);
          },
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'invalid-credential') {
          //todo: hide loading
          UtilsDialog.hideDialog(context: context);
          //todo: show message error
          UtilsDialog.showMessage(
            context: context,
            content: AppLocalizations.of(
              context,
            )!.email_or_password_is_incorrect,
            title: AppLocalizations.of(context)!.error,
            posAction: AppLocalizations.of(context)!.ok,
          );
        }
      } catch (e) {
        //todo: hide loading
        UtilsDialog.hideDialog(context: context);
        //todo: show message error
        UtilsDialog.showMessage(
          context: context,
          content: e.toString(),
          title: AppLocalizations.of(context)!.error,
          posAction: AppLocalizations.of(context)!.ok,
        );
      }
    }
  }

  static Future<void> signInWithGoogle({required BuildContext context}) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    // Trigger the authentication flow
    await googleSignIn.disconnect();
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    //todo: save in firestore
    var myUser = await FirebaseUtils.getUserFromFireStore(googleUser?.id ?? '');
    if (myUser == null) {
      return;
    }
    //todo:save in provider
    var userProvider = Provider.of<UserProvider>(context, listen: false);
    userProvider.updateUser(myUser);
    // Once signed in, return the UserCredential
    UtilsDialog.showLoading(
      context: context,
      content: AppLocalizations.of(context)!.loading,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
    UtilsDialog.hideDialog(context: context);
    UtilsDialog.showMessage(
      context: context,
      content: AppLocalizations.of(context)!.login_successfully,
      title: AppLocalizations.of(context)!.success,
      posAction: AppLocalizations.of(context)!.ok,
      posActions: () {
        Navigator.of(context).pushReplacementNamed(AppRoute.primaryScreen);
      },
    );
  }

  static String? emailValidator(String? text, BuildContext context) {
    if (text == null || text.trim().isEmpty) {
      return AppLocalizations.of(context)!.please_enter_email;
    }
    final bool emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(text);
    if (!emailValid) {
      return AppLocalizations.of(context)!.please_enter_valid_Email;
    }
    return null;
  }

  static String? passwordValidator(String? text, BuildContext context) {
    if (text == null || text.trim().isEmpty) {
      return AppLocalizations.of(context)!.please_enter_password;
    }
    if (text.length < 6) {
      return AppLocalizations.of(context)!.password_should_be_at_least_6_chars;
    }
    return null;
  }
}
