import 'package:baby_cam/Not/HomeScreen/HomeScreen.dart';
import 'package:baby_cam/UserContoller/userContoller.dart';
import 'package:baby_cam/Not/UserUI/Login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUP extends ConsumerStatefulWidget {
  SignUP({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _SignUP();
  }
}

class _SignUP extends ConsumerState<SignUP> {
  void signUPuser(
      {required String name,
      required String password,
      required String email}) async {
    ref.watch(authContoller).LoginUser(
        email: email, name: name, password: password, context: context);
  }

  final TextEditingController emailContoller = TextEditingController();
  final TextEditingController passwordContoller = TextEditingController();
  final TextEditingController nameContoller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: nameContoller,
                decoration: InputDecoration(
                  hintText: 'Name',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (ctx) => LoginScreen()));
                  },
                  child: Text('Login')),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    signUPuser(
                        name: nameContoller.text,
                        password: passwordContoller.text,
                        email: emailContoller.text);
                  },
                  child: Text('SignUp')),
            ],
          ),
        ),
      ),
    );
  }
}
