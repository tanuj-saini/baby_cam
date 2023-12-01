import 'package:baby_cam/HomeScreen/HomeScreen.dart';
import 'package:baby_cam/UserUI/Login.dart';
import 'package:baby_cam/UserUI/UserModel.dart';
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
          .push(MaterialPageRoute(builder: (ctx) => HomeScreen()));
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
          .push(MaterialPageRoute(builder: (ctx) => HomeScreen()));
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
          .push(MaterialPageRoute(builder: (ctx) => LoginScreen()));
    } on FirebaseAuthException catch (e) {
      showSnackBar(e.toString(), context);
    }
  }
}

showSnackBar(String message, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
