import 'package:evently/model/my_user.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  MyUser? myUser;

  void updateUser(MyUser newUser) {
    myUser = newUser;
  }
}
