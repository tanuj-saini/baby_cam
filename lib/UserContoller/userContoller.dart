import 'package:baby_cam/Not/Models/camera.dart';
import 'package:baby_cam/UserRepositry/userRepo.dart';
import 'package:baby_cam/Not/UserUI/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authContoller = Provider<AuthContoller>((ref) {
  final authRepo = ref.watch(authReopsitry);
  return AuthContoller(authRepositery: authRepo);
});

final USerDetailsFormain = FutureProvider((ref) {
  final authRepo = ref.watch(authReopsitry);
  return authRepo.getUserDetails();
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
        name: " ", PassWord: password, Email: email, context: context);
  }

  void LoginUser(
      {required String email,
      required String name,
      required String password,
      required BuildContext context}) async {
    authRepositery.LoginUser(
        PassWord: password, Email: email, context: context);
  }

  Stream<UserModel> getUserModel(
      {required BuildContext context, required CameraUid}) {
    return authRepositery.getUserModel();
  }

  void logoutUser({required BuildContext context}) {
    authRepositery.logoutUser(context: context);
  }

  void makeAcameraContoller(
      {required bool isTalk,
      required bool isFalsLight,
      required bool isSwitch,
      required BuildContext context,
      required List usersToCamera}) {
    authRepositery.makeAcamera(
        isTalk: isTalk,
        isFalsLight: isFalsLight,
        isSwitch: isSwitch,
        context: context,
        usersToCamera: usersToCamera);
  }

  Future updateUserId(
      {required BuildContext context, required String CameraUid}) async {
    await authRepositery.updateUserOFStream(CameraUid: CameraUid);
  }

  void checlCamerId(
      {required BuildContext context, required String CamereUId}) async {
    await authRepositery.checkCameraId(context: context, CamereUId: CamereUId);
  }
}
