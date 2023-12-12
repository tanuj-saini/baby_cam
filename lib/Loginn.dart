import 'package:baby_cam/SignnUP.dart';
import 'package:baby_cam/UserContoller/userContoller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../welcomescreen.dart';

import 'package:flutter/material.dart';

class LoginPage extends ConsumerStatefulWidget {
  LoginPage({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _LoginPage();
  }
}

class _LoginPage extends ConsumerState<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(child: Log()),
    );
  }
}

class Log extends ConsumerStatefulWidget {
  const Log({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _LogState();
  }
}

class _LogState extends ConsumerState<Log> {
  void signInwithUser({required String email, required String password}) async {
    ref
        .watch(authContoller)
        .signUP(name: "", email: email, password: password, context: context);
  }

  // variable for the show-hide password
  bool _isObscure = true;
  //create a key for the Form widget
  final _formkey = GlobalKey<FormState>();
  //create the texfield controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var loading = false;

  @override
  Widget build(BuildContext context) {
    //fonction to validate if the fields are empty or filled
    String? _requiredValidator(String? text) {
      if (text == null || text.trim().isEmpty) {
        return 'this field is required';
      }
      return null;
    }

    return SingleChildScrollView(
      child: SizedBox(
          height: 800,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 4,
                width: 100,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        alignment: Alignment(-1, 0),
                        image: AssetImage("assets/images/consulting.png"),
                        fit: BoxFit.fill)),
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 5, top: 5),
                child: IconButton(
                  color: Colors.black,
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WelcomeScreen())),
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(left: 40),
                              height: 20,
                              width: 200,
                              child: const Text(
                                "WELCOME BACK ",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(30, 31, 75, 0.45)),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 40),
                              child: const Text(
                                "Account Log In ",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w700,
                                    color: Color.fromRGBO(30, 31, 75, 1)),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            MaterialButton(
                              minWidth: 168,
                              height: 56,
                              onPressed: () {},
                              shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                    color: Color.fromRGBO(254, 207, 165, 0.82),
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        bottom: 1.56, top: 1.56),
                                    child: Text(
                                      "G  ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Color.fromRGBO(30, 31, 75, 0.65),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "Login with Google",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11.5,
                                      color: Color.fromRGBO(30, 31, 75, 0.6),
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            MaterialButton(
                              minWidth: 162,
                              height: 56,
                              onPressed: () {},
                              shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                    color: Color.fromRGBO(254, 207, 165, 0.82),
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 0.15, top: 1.17),
                                    child: Icon(
                                      Icons.apple,
                                      color: Color.fromRGBO(30, 31, 75, 0.65),
                                    ),
                                  ),
                                  Text(
                                    "  Login with Apple",
                                    style: TextStyle(
                                        color: Color.fromRGBO(30, 31, 75, 0.6),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 11.5),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        const Center(
                          child: Text(
                            "Or Create Using Email",
                            style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                color: Color.fromRGBO(30, 31, 75, 0.65)),
                          ),
                        ),
                        Form(
                          key: _formkey,
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 50, vertical: 20),
                                height: 74,
                                width: 342,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color.fromRGBO(253, 167, 88, 1)),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Center(
                                  child: TextFormField(
                                    enableSuggestions: true,
                                    keyboardType: TextInputType.emailAddress,
                                    controller: emailController,
                                    validator: _requiredValidator,
                                    decoration: const InputDecoration(
                                      focusColor: Colors.orange,

                                      suffixIcon: Icon(Icons.email_outlined),
                                      suffixIconColor: Colors.orange,
                                      hintText: "Email",
                                      // border: OutlineInputBorder(
                                      //     borderRadius: BorderRadius.circular(10),
                                      //     borderSide: const BorderSide(
                                      //       color: Colors.orange,
                                      //       width: 1,
                                      //     )),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                    left: 50, right: 50, top: 4, bottom: 20),
                                height: 74,
                                width: 342,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color.fromRGBO(253, 167, 88, 1)),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Center(
                                  child: TextFormField(
                                    keyboardType: TextInputType.visiblePassword,
                                    controller: passwordController,
                                    validator: _requiredValidator,
                                    obscureText: _isObscure,
                                    decoration: InputDecoration(
                                      suffixIconColor: Colors.orange,
                                      suffixIcon: IconButton(
                                        icon: Icon(_isObscure
                                            ? Icons.visibility
                                            : Icons.visibility_off),
                                        onPressed: () {
                                          setState(() {
                                            _isObscure = !_isObscure;
                                          });
                                        },
                                      ),
                                      hintText: "Password",
                                      border: const OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 64,
                                width: 226,
                                margin: const EdgeInsets.only(left: 50),
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(253, 167, 88, 1),
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: MaterialButton(
                                  child: const Center(
                                      child: Text(
                                    "Continue",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 3,
                                        fontSize: 18.0),
                                  )),
                                  onPressed: () {
                                    signInwithUser(
                                        email: emailController.text,
                                        password: passwordController.text);
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              "Don't Have An Acount?",
                              style: TextStyle(
                                color: Color.fromRGBO(30, 31, 75, 0.65),
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextButton(
                                child: const Text(
                                  "REGISTER",
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    decorationThickness: 1.2,
                                    color: Color.fromRGBO(253, 167, 88, 1),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                  ),
                                ),
                                onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignUpPage()),
                                    )),
                          ],
                        ),
                      ]),
                ),
              )
            ],
          )),
    );
  }
}
