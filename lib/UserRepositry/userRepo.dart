import 'package:baby_cam/Loginn.dart';
import 'package:baby_cam/Not/HomeScreen/HomeScreen.dart';
import 'package:baby_cam/Not/Models/camera.dart';
import 'package:baby_cam/UserRepositry/test.dart';
import 'package:baby_cam/Not/UserUI/Login.dart';
import 'package:baby_cam/Not/UserUI/UserModel.dart';
import 'package:baby_cam/testScreen.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authReopsitry = Provider((ref) => AuthRepositery(
    firebaseAuth: FirebaseAuth.instance,
    firebaseFirestore: FirebaseFirestore.instance));

class AuthRepositery {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;
  AuthRepositery({required this.firebaseAuth, required this.firebaseFirestore});
  void SignUser(
      {required String PassWord,
      required String Email,
      required String name,
      required BuildContext context}) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: Email, password: PassWord);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => TestScreenRE()));
      sendUserDetailsToD(name: name, email: Email, context: context);
    } on FirebaseAuthException catch (e) {
      showSnackBar(e.toString(), context);
    }
  }

  void LoginUser(
      {required String PassWord,
      required String Email,
      required BuildContext context}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: Email, password: PassWord);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => TestScreenRE()));
    } on FirebaseAuthException catch (e) {
      showSnackBar(e.toString(), context);
    }
  }

  void sendUserDetailsToD(
      {required String name,
      required String email,
      required BuildContext context}) async {
    try {
      UserModel userMdoel = UserModel(
          uid: firebaseAuth.currentUser!.uid, name: name, email: email);
      await firebaseFirestore
          .collection("User")
          .doc(firebaseAuth.currentUser!.uid)
          .set(userMdoel.toMap());
    } on FirebaseException catch (e) {
      showSnackBar(e.toString(), context);
    }
  }

  Stream<UserModel> getUserModel() {
    return firebaseFirestore
        .collection('User')
        .doc(firebaseAuth.currentUser!.uid)
        .snapshots()
        .map((event) => UserModel.fromMap(event.data()!));
  }

  void logoutUser({required BuildContext context}) async {
    try {
      await firebaseAuth.signOut();

      Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => LoginPage()));
    } on FirebaseAuthException catch (e) {
      showSnackBar(e.toString(), context);
    }
  }

  void makeAcamera(
      {required bool isTalk,
      required bool isFalsLight,
      required bool isSwitch,
      required BuildContext context,
      required List usersToCamera}) async {
    try {
      await firebaseFirestore
          .collection('Camera')
          .doc(firebaseAuth.currentUser!.uid)
          .set(cameraModule(
                  cameruid: firebaseAuth.currentUser!.uid,
                  isTalk: isTalk,
                  isFalsLight: isFalsLight,
                  isSwitch: isSwitch,
                  usersToCamera: usersToCamera)
              .toMap());
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => TestScreen()));
      showSnackBar('Live Stream Is Started', context);
    } catch (e) {
      showSnackBar(e.toString(), context);
    }
  }

  Future<UserModel?> getUserDetails() async {
    var userData = await firebaseFirestore
        .collection('users')
        .doc(firebaseAuth.currentUser?.uid)
        .get();
    UserModel? user;
    if (userData.data() != null) {
      user = UserModel.fromMap(userData.data()!);
    }

    return user;
  }

  Future<void> updateUserOFStream({required String CameraUid}) async {
    await firebaseFirestore.collection('Camera').doc(CameraUid).update({
      "usersToCamera": FieldValue.arrayUnion([firebaseAuth.currentUser!.uid])
    });
  }

  Future<void> checkCameraId(
      {required BuildContext context, required String CamereUId}) async {
    try {
      QuerySnapshot snap = await firebaseFirestore
          .collection('Camera')
          .where('cameruid', isEqualTo: CamereUId)
          .get();
      if (snap.docs.isNotEmpty) {
        // Navigator.of(context).push(MaterialPageRoute(
        //     builder: (ctx) => viewerCamera(
        //         camerUid: CamereUId,
        //         viewerUid: firebaseAuth.currentUser!.uid)));
      } else {
        showSnackBar('No CameraId Is found', context);
      }
    } catch (e) {
      showSnackBar(e.toString(), context);
    }
  }
}

showSnackBar(String message, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
