import 'package:evently/firebase_utils.dart';
import 'package:evently/model/my_user.dart';
import 'package:evently/providers/user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../utils/app_route.dart';
import '../../utils/utils_dialog.dart';

class RegisterLogic {
  static void register({
    required var formKey,
    required BuildContext context,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required TextEditingController nameController,
  }) async {
    if (formKey.currentState?.validate() == true) {
      try {
        //todo: show loading
        UtilsDialog.showLoading(
          context: context,
          content: AppLocalizations.of(context)!.loading,
        );
        final credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
              email: emailController.text,
              password: passwordController.text,
            );
        MyUser myUser = MyUser(
          name: nameController.text,
          email: emailController.text,
          id: credential.user?.uid ?? '',
        );
        //todo:save in fireStore
        FirebaseUtils.addUserInFireStore(myUser);
        //todo:save in provider
        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.updateUser(myUser);
        //todo: hide loading
        UtilsDialog.hideDialog(context: context);
        //todo: show message success
        UtilsDialog.showMessage(
          context: context,
          content: AppLocalizations.of(context)!.register_successfully,
          title: AppLocalizations.of(context)!.success,
          posAction: AppLocalizations.of(context)!.ok,
          posActions: () {
            Navigator.pushNamed(context, AppRoute.primaryScreen);
          },
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          //todo: hide loading
          UtilsDialog.hideDialog(context: context);
          //todo: show message error
          UtilsDialog.showMessage(
            context: context,
            content: AppLocalizations.of(
              context,
            )!.the_account_already_exists_for_that_email,
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
    MyUser myUser = MyUser(
      name: googleUser?.displayName ?? '',
      email: googleUser?.email ?? '',
      id: googleUser?.id ?? '',
    );
    //todo:save in fireStore
    FirebaseUtils.addUserInFireStore(myUser);
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
      content: AppLocalizations.of(context)!.register_successfully,
      title: AppLocalizations.of(context)!.success,
      posAction: AppLocalizations.of(context)!.ok,
      posActions: () {
        Navigator.of(context).pushNamed(AppRoute.primaryScreen);
      },
    );
  }

  static String? nameValidator(String? text, BuildContext context) {
    if (text == null || text.trim().isEmpty) {
      return AppLocalizations.of(context)!.please_enter_name;
    }
    return null;
  }

  static String? rePasswordValidator(
    String? text,
    BuildContext context,
    TextEditingController passwordController,
  ) {
    if (text == null || text.trim().isEmpty) {
      return AppLocalizations.of(context)!.please_enter_confirm_password;
    }
    if (text != passwordController.text) {
      return AppLocalizations.of(context)!.repassword_doesnt_math_password;
    }
    return null;
  }
}
