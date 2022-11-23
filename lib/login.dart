import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_4/home.dart';
import 'package:flutter_application_4/signup.dart';
import 'package:http/http.dart' as http;

import 'package:fluttertoast/fluttertoast.dart';

// ignore: use_key_in_widget_constructors
class LOGIN extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _LOGINState createState() => _LOGINState();
}

class _LOGINState extends State<LOGIN> {
  List<dynamic> users = [];
  void fetch() async {
    const url =
        'https://newsapi.org/v2/everything?q=tesla&from=2022-10-22&sortBy=publishedAt&apiKey=4f63681140c84fe6a9d781bedb2e4472';
    final uri = Uri.parse(url);
    final responce = await http.get(uri);
    final body = responce.body;
    final json = jsonDecode(body);
    setState(() {
      users = json['articles'];
    });
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final color3 = const Color(0xFF4BE0DB);

  // ignore: non_constant_identifier_names

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    const color3 = Color.fromARGB(255, 2, 7, 7);
    return Scaffold(
      backgroundColor: color3,
      body: ListView(children: [
        Form(
            key: _formKey,
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: size.height * 0.2,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40)),
                        color: Colors.red,
                      ),
                      child: Row(
                        children: const [
                          Text(
                            'Social',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text('X',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Stack(
                        children: [
                          Container(
                            height: size.height * 0.62,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'SignIn into your\nAcount',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text(
                                  'Email',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 6, 6, 6),
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 30,
                                  child: TextField(
                                    controller: _emailController,
                                    decoration: const InputDecoration(
                                      suffixIcon: Icon(
                                        Icons.mail,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text(
                                  'Password',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 6, 6, 6),
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 30,
                                  child: TextField(
                                    controller: _passwordController,
                                    decoration: const InputDecoration(
                                        suffixIcon: Icon(
                                      Icons.lock_outline,
                                      color: Colors.red,
                                    )),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text('Forgot Password?',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(
                                  height: 25,
                                ),
                                const Center(
                                  child: Text(
                                    'Login with',
                                    style: TextStyle(),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 30,
                                      color: Colors.white,
                                      child: const Icon(
                                        Icons.g_translate_outlined,
                                        color: Colors.red,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    Container(
                                      height: 30,
                                      width: 30,
                                      color: Colors.blue,
                                      child: const Icon(Icons.facebook,
                                          color: Colors.white),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text("Don't have an acount?"),
                                      InkWell(
                                        onTap: () {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const SignUp()));
                                        },
                                        child: const Text(
                                          'Register Now',
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          fetch();
                          _signInWithEmailAndPassword();
                        }
                      },
                      child: Container(
                        height: size.height * 0.06,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40)),
                          color: Colors.red,
                        ),
                        child: const Center(
                          child: Text(
                            'LOGIN',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            )),
      ]),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  void _signInWithEmailAndPassword() async {
    try {
      final user = (await _firebaseAuth.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim()));
      // ignore: unnecessary_null_comparison
      if (user != null) {
        setState(() {
          Fluttertoast.showToast(msg: "Signed In Sucessfully");
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        });
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }
}
