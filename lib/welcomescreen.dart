import 'package:flutter/material.dart';
import 'Loginn.dart';
import 'SignnUP.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: 800,
          child: SingleChildScrollView(
            child: SafeArea(
              child: Container(
                // decoration: const BoxDecoration(
                color: Color.fromRGBO(255, 239, 221, 1),

                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding:
                    const EdgeInsets.symmetric(horizontal: 2, vertical: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                            Text(
                              "Kteb",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(253, 167, 88, 1),
                                fontSize: 40,
                              ),
                            ),
                            Text(
                              ".cc",
                              style: TextStyle(
                                color: Color.fromRGBO(2, 30, 64, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: 40,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Column(
                          children: const [
                            Text(
                              "Welcome to new application of",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color.fromRGBO(32, 32, 32, 1),
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              "Books Let's read.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color.fromRGBO(32, 32, 32, 1),
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Container(
                      height: 600,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          alignment: Alignment(-1, 0),
                          image: AssetImage("assets/images/cat.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Column(
                        children: <Widget>[
                          const SizedBox(
                            height: 450,
                          ),
                          SizedBox(
                            width: 300,
                            child: MaterialButton(
                              minWidth: 20,
                              height: 58,
                              color: Color.fromRGBO(253, 167, 88, 1),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()));
                              },
                              shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                    color: Color.fromRGBO(253, 167, 88, 1),
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.only(left: 30.0),
                                    child: Text(
                                      "Get started now",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18,
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 30),
                                    child: Icon(
                                      Icons.arrow_forward,
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextButton(
                            child: const Text(
                              "Create an account",
                              style: TextStyle(
                                  color: Color.fromRGBO(30, 31, 75, 1),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpPage()));
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
