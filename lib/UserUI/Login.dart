import 'package:baby_cam/UserContoller/userContoller.dart';
import 'package:baby_cam/UserUI/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerStatefulWidget {
  LoginScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _LoginScreen();
  }
}

class _LoginScreen extends ConsumerState<LoginScreen> {
  void LoginUser({required String password, required String email}) async {
    ref
        .watch(authContoller)
        .LoginUser(email: email, password: password, context: context);
  }

  final TextEditingController emailContoller = TextEditingController();
  final TextEditingController passwordContoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Login Screen",
      )),
      body: Center(
        child: Column(
          children: [
            TextFormField(
              controller: emailContoller,
              decoration: InputDecoration(
                hintText: 'Email',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: passwordContoller,
              decoration: InputDecoration(
                hintText: 'PassWord',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  LoginUser(
                      password: passwordContoller.text,
                      email: emailContoller.text);
                },
                child: Text('Login')),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (ctx) => SignUP()));
                },
                child: Text('SignUp')),
          ],
        ),
      ),
    );
  }
}
