import 'package:flutter/material.dart';
import 'package:attendsure/utils/routes.dart';

class TeacherandstudentPage extends StatelessWidget {
  const TeacherandstudentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.center,
            end: Alignment.bottomCenter,
            colors: const [
              Color(0xFFE8E8E8),
              Color.fromARGB(255, 101, 191, 243),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text("AttendSure", style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold)),
            Image.asset(
              "assets/images/AttendSure Logo.png",
              height: 300,
              width: 300,
            ),
            SizedBox(height: 40),
            Container(
              width: 300,
              height: 150,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to the ERP login page with "teacher" argument
                      Navigator.pushNamed(
                        context,
                        Myroutes.erpLoginRoute,
                        arguments: 'teacher',
                      );
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF0486FD)),
                    child: Text(
                      "Login as Teacher",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to the ERP login page with "student" argument
                      Navigator.pushNamed(
                        context,
                        Myroutes.erpLoginRoute,
                        arguments: 'student',
                      );
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF0486FD)),
                    child: Text(
                      "Login as Student",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
