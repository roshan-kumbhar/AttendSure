import 'package:attendsure/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TrErploginPage extends StatefulWidget {
  const TrErploginPage({super.key});

  @override
  State<TrErploginPage> createState() => _TrErploginPageState();
}

class _TrErploginPageState extends State<TrErploginPage> {
  late final TextEditingController _erpController;
  late final TextEditingController _passwordController;
  bool changebtn = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _erpController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _erpController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> moveToHome(BuildContext context) async {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      final erpNo = _erpController.text.trim();
      final password = _passwordController.text.trim();

      try {
        // Check if the ERP number exists in Firestore
        final teacherDoc = await FirebaseFirestore.instance
            .collection('teacher')
            .doc(erpNo)
            .get();

        if (teacherDoc.exists) {
          // ERP found, check if password matches
          final storedPassword = teacherDoc['password'];

          if (storedPassword == password) {
            // Password matches, proceed to the home page
            setState(() {
              changebtn = true;
            });
            await Future.delayed(Duration(seconds: 1));
            Navigator.pushNamed(
              context,
              Myroutes.homeRoute,
              arguments: erpNo, // Pass ERP number to the HomePage
            );
            setState(() {
              changebtn = false;
            });
          } else {
            // Show error if password does not match
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error: Incorrect password')),
            );
          }
        } else {
          // Show error if ERP number does not exist
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: Invalid ERP Number')),
          );
        }
      } catch (e) {
        // Handle other errors
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${e.toString()}')),
        );
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
            begin: Alignment.center,
            end: Alignment.bottomCenter,
            colors: const [
              Color(0xFFE8E8E8),
              Color(0xFF71C8F9),
            ],
          ),
        ),
        child: Container(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 40),
                SizedBox(
                  child: Text(
                    "AttendSure",
                    style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                  ),
                ),
                Image.asset(
                  "assets/images/AttendSure Logo.png",
                  width: 300,
                  height: 300,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 1, horizontal: 32),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 32),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "ERP Number cannot be empty";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: "ERP Number",
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(255, 224, 223, 223),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 224, 223, 223),
                                ),
                              ),
                              prefixIcon: Icon(Icons.person),
                            ),
                            controller: _erpController,
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Password cannot be empty";
                              }
                              return null;
                            },
                            obscureText: true, // Hide password
                            decoration: InputDecoration(
                              hintText: "Password",
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(255, 224, 223, 223),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 224, 223, 223),
                                ),
                              ),
                              prefixIcon: Icon(Icons.lock),
                            ),
                            controller: _passwordController,
                          ),
                        ),
                        SizedBox(height: 30),
                        InkWell(
                          onTap: () => moveToHome(context),
                          child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            width: changebtn ? 50 : 150,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Color(0xFF0486FD),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: changebtn
                                ? CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
