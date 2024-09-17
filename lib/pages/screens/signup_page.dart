import 'package:attendsure/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  // String name = "";
  bool changebtn = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  moveToHome(BuildContext context) async {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      final email = _email.text;
      final password = _password.text;
      try {
        final userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        print(userCredential);
        setState(() {
          changebtn = true;
        });
        await Future.delayed(Duration(seconds: 1));
        await Navigator.pushNamed(context, Myroutes.backToLoginRoute);
        setState(() {
          changebtn = false;
        });
      } on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: Email already in use')),
          );
        } else if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: Password is too weak')),
          );
        } else if (e.code == 'invalid-email') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: Invalid email format')),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: ${e.message}')),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: const [
              Color(0xFFE8E8E8), // Light grey or white color at the top
              Color(0xFF71C8F9), // Blue color at the bottom
            ],
            stops: const [
              0.7,
              0.3
            ], // Adjust to control the split between colors
          ),
        ),
        child: Container(
          child: Form(
            key: _formKey,
            child: FutureBuilder(
              future: Firebase.initializeApp(
                  options: DefaultFirebaseOptions.currentPlatform),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.done:
                    return Column(
                      children: [
                        SizedBox(
                          height: 100,
                        ),
                        SizedBox(
                          height: 70,
                          child: Text(
                            "AttendSure",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          width: 250,
                          height: 250,
                          child: Image.asset(
                            "assets/images/AttendSure Logo.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 32),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 32),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(18)),
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  child: TextFormField(
                                    validator: (email) {
                                      if (email == null || email.isEmpty) {
                                        return "Email Cannot be empty";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      hintText: "Email",
                                      // labelText: "Email"
                                      filled: true,
                                      fillColor: const Color.fromARGB(
                                          255, 224, 223, 223),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            12), // Rounded border radius
                                        borderSide: BorderSide.none,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide.none,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              255, 224, 223, 223),
                                        ), // Border color when focused
                                      ),
                                      prefixIcon: Icon(Icons.mail),
                                    ),
                                    autocorrect: false,
                                    enableSuggestions: false,
                                    keyboardType: TextInputType.emailAddress,
                                    controller: _email,
                                  ),
                                ),
                                TextFormField(
                                  validator: (password) {
                                    if (password == null || password.isEmpty) {
                                      return "Password cannot be empty";
                                    } else if (password.length < 6) {
                                      return "Password length must be atleast 6";
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                      hintText: "Password",
                                      // labelText: "Password"
                                      filled: true,
                                      fillColor: const Color.fromARGB(
                                          255, 224, 223, 223),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            12), // Rounded border radius
                                        borderSide: BorderSide.none,
                                      ),
                                      // labelText: "Password"
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide.none,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide(
                                            color: Color.fromARGB(255, 224, 223,
                                                223)), // Border color when focused
                                      ),
                                      prefixIcon: Icon(Icons.lock)),
                                  obscureText: true,
                                  autocorrect: false,
                                  enableSuggestions: false,
                                  controller: _password,
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                InkWell(
                                  onTap: () => moveToHome(context),
                                  child: AnimatedContainer(
                                    duration: Duration(seconds: 1),
                                    width: changebtn ? 50 : 200,
                                    height: 50,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF0486FD),
                                      shape: changebtn
                                          ? BoxShape.circle
                                          : BoxShape.rectangle,
                                      borderRadius: changebtn
                                          ? null
                                          : BorderRadius.circular(8),
                                      // borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: changebtn
                                        ? Icon(Icons.done, color: Colors.white)
                                        : Text(
                                            'Sign Up',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                  ),
                                ),
                                SizedBox(
                                  height: 70,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    );
                  default:
                    return const Text("Loading");
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
