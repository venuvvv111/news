import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_4/login.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final color3 = const Color.fromARGB(255, 16, 66, 64);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();

  bool _checked = false;
  // ignore: non_constant_identifier_names
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    const color3 = Color.fromARGB(255, 3, 5, 5);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Balsamiq_Sans'),
        home: Scaffold(
          backgroundColor: color3,
          body: ListView(children: [
            Form(
                key: _formKey,
                child: Column(
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 10),
                          child: Stack(
                            children: [
                              Container(
                                height: size.height * 0.64,
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
                                      'Create an\n Acount',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Text(
                                      'Name',
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 6, 6, 6),
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 30,
                                      child: TextField(
                                        controller: _nameController,
                                        decoration: const InputDecoration(
                                            suffixIcon: Icon(
                                          Icons.person,
                                          color: Colors.red,
                                        )),
                                      ),
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
                                      'Contact no',
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 6, 6, 6),
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 30,
                                      child: TextField(
                                        controller: _numberController,
                                        keyboardType: TextInputType.number,
                                        decoration: const InputDecoration(
                                            suffixIcon: Icon(
                                          Icons.call,
                                          color: Colors.red,
                                        )),
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
                                        keyboardType: TextInputType.number,
                                        decoration: const InputDecoration(
                                            suffixIcon: Icon(
                                          Icons.lock_outline,
                                          color: Colors.red,
                                        )),
                                      ),
                                    ),
                                    CheckboxListTile(
                                      title: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text('I agree with '),
                                            GestureDetector(
                                              onTap: () {},
                                              child: const Text(
                                                'terms & conditions',
                                                style: TextStyle(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            )
                                          ]),
                                      value: _checked,
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      onChanged: (value) {
                                        setState(() {
                                          _checked = value!;
                                        });
                                      },
                                      activeColor: Colors.red,
                                    ),
                                    Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text('Already have an acount?'),
                                          InkWell(
                                            onTap: () {
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          LOGIN()));
                                            },
                                            child: const Text(
                                              'Sign In',
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
                              _register();
                            }

                            // Map<String, dynamic> data = {
                            //   'name': _nameController.text,
                            //   'email': _emailController.text,
                            //   'number': _numberController.text,
                            // };
                            // FirebaseFirestore.instance
                            //     .collection("users")
                            //     .add(data);
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
                                'REGISTER',
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
        ));
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  void _register() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    // ignore: unnecessary_null_comparison
    if (password != null) {
      try {
        final user =
            (await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        ));
        setState(() {
          // ignore: unnecessary_null_comparison
          if (user != null) {
            Fluttertoast.showToast(msg: "user created");
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LOGIN()),
            );
          }
        });
      } catch (e) {
        Fluttertoast.showToast(msg: e.toString());
      }
    } else {
      Fluttertoast.showToast(msg: "Passwords not null");
    }
  }
}
