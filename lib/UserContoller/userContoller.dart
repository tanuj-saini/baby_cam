import 'package:baby_cam/UserRepositry/userRepo.dart';
import 'package:baby_cam/UserUI/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authContoller = Provider<AuthContoller>((ref) {
  final authRepo = ref.watch(authReopsitry);
  return AuthContoller(authRepositery: authRepo);
});

class AuthContoller {
  final AuthRepositery authRepositery;
  AuthContoller({required this.authRepositery});

  void signUP(
      {required String email,
      required String name,
      required String password,
      required BuildContext context}) async {
    authRepositery.SignUser(
        name: name, PassWord: password, Email: email, context: context);
  }

  void LoginUser(
      {required String email,
      required String password,
      required BuildContext context}) async {
    authRepositery.LoginUser(
        PassWord: password, Email: email, context: context);
  }

  Stream<UserModel> getUserModel() {
    return authRepositery.getUserModel();
  }

  void logoutUser({required BuildContext context}) {
    authRepositery.logoutUser(context: context);
  }
}
