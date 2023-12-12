import 'package:baby_cam/UserContoller/userContoller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'Loginn.dart';
import 'package:flutter/material.dart';

class SignUpPage extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _SignUpPageState();
  }
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Sign(),
    );
  }
}

class Sign extends ConsumerStatefulWidget {
  const Sign({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _SignState();
  }
}

class _SignState extends ConsumerState<Sign> {
  void SignUpUser(
      {required String email, required String name, required String password}) {
    ref.watch(authContoller).LoginUser(
        email: email, name: name, password: password, context: context);
  }

  //variable for the show-hide password
  bool _isobscure = true;
  //create a key for the Form Widget
  final _formkey = GlobalKey<FormState>();
  //create the texfield controller
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String? _requiredValidator(String? text) {
      if (text == null || text.trim().isEmpty) {
        return 'this field is required';
      }
      return null;
    }

    return SizedBox(
        height: 800,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 6,
              width: 100,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      alignment: Alignment(-2, 0),
                      image: AssetImage("assets/images/signUp.png"),
                      fit: BoxFit.fill)),
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left: 5, top: 5),
              child: IconButton(
                color: Colors.black,
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage())),
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
                            height: 20,
                            width: 200,
                            margin: const EdgeInsets.only(left: 40),
                            child: const Text(
                              "Join our Community ",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(30, 31, 75, 0.45)),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 40),
                            child: const Text(
                              "Create Account",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromRGBO(30, 31, 75, 1)),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
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
                                  color: Color.fromRGBO(253, 167, 88, 1),
                                ),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: 0.22, bottom: 1.56),
                                  child: Text("G  ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromRGBO(30, 31, 75, 0.65),
                                          fontSize: 20)),
                                ),
                                Text(
                                  "Create with Google",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromRGBO(30, 31, 75, 0.6),
                                      fontSize: 11.5),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: 1.17, left: 0.15),
                                  child: Icon(
                                    Icons.apple,
                                    color: Color.fromRGBO(30, 31, 75, 0.65),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 2.33, left: 26),
                                  child: Text(
                                    "Create with Apple",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11.5,
                                      color: Color.fromRGBO(30, 31, 75, 0.65),
                                    ),
                                  ),
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
                          "Or Login using Email",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(30, 31, 75, 0.65),
                          ),
                        ),
                      ),
                      Form(
                        key: _formkey,
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 5),
                              height: 74,
                              width: 342,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.orange,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                child: TextFormField(
                                  validator: _requiredValidator,
                                  controller: _nameController,
                                  enableSuggestions: true,
                                  decoration: const InputDecoration(
                                    suffixIcon: Icon(
                                      Icons.person,
                                      size: 15,
                                      color: Color.fromRGBO(30, 31, 75, 0.45),
                                    ),
                                    hintText: "Johnson Doe",
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 7),
                              height: 74,
                              width: 342,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color.fromRGBO(253, 167, 88, 1),
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                child: TextFormField(
                                  validator: _requiredValidator,
                                  controller: _emailController,
                                  enableSuggestions: true,
                                  decoration: const InputDecoration(
                                    suffixIcon: Icon(
                                      Icons.email_outlined,
                                      color: Color.fromRGBO(253, 167, 88, 1),
                                      size: 15,
                                    ),
                                    hintText: "Email",
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 7, bottom: 20, left: 50, right: 50),
                              height: 74,
                              width: 342,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.orange,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                child: TextFormField(
                                  validator: _requiredValidator,
                                  controller: _passwordController,
                                  obscureText: _isobscure,
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _isobscure
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: Color.fromRGBO(30, 31, 75, .45),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _isobscure = !_isobscure;
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
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      fontSize: 18.0),
                                )),
                                onPressed: () {
                                  SignUpUser(
                                      email: _emailController.text,
                                      name: _nameController.text,
                                      password: _passwordController.text);
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
                            "Already A Team Member?",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Color.fromRGBO(15, 45, 82, 0.65),
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                            ),
                          ),
                          TextButton(
                              child: const Text(
                                "LOG IN",
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
                                        builder: (context) => LoginPage()),
                                  )),
                        ],
                      ),
                    ]),
              ),
            )
          ],
        ));
  }
}
