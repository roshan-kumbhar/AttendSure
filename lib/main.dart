import 'package:attendsure/firebase_services/std_details.dart';
import 'package:attendsure/pages/bottom_navbar_pages/id_page.dart';
import 'package:attendsure/pages/screens/backToLogin_page.dart';
import 'package:attendsure/pages/drawer_pages/attendance_page.dart';
import 'package:attendsure/pages/drawer_pages/my_information_page.dart';
import 'package:attendsure/pages/drawer_pages/notifications_page.dart';
import 'package:attendsure/pages/drawer_pages/settings_page.dart';
import 'package:attendsure/pages/drawer_pages/timetable_page.dart';
import 'package:attendsure/pages/screens/home_page.dart';
import 'package:attendsure/pages/screens/login_page.dart';
import 'package:attendsure/pages/otp.dart';
import 'package:attendsure/pages/screens/signup_page.dart';
import 'package:attendsure/utils/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // options: DefaultFirebseOptions.Currentplatform;
      );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/': (context) => LoginPage(),
        Myroutes.homeRoute: (context) => HomePage(),
        Myroutes.attendanceRoute: (context) => AttendancePage(),
        Myroutes.notificationsRoute: (context) => NotificationsPage(),
        Myroutes.timetableRoute: (context) => TimetablePage(),
        Myroutes.myinformationRoute: (context) => MyInformationPage(),
        Myroutes.settingsRoute: (context) => SettingsPage(),
        Myroutes.loginRoute: (context) => LoginPage(),
        Myroutes.otpRoute: (context) => OTPPage(),
        Myroutes.signupRoute: (context) => SignUpPage(),
        Myroutes.backToLoginRoute: (context) => BacktologinPage(),
        Myroutes.stdDetailsRoute: (context) =>
            StudentDetails(erpNo: '220600114'),
        // Myroutes.idRoute:(context)=>IdPage(studentDetails: )
      },
    );
  }
}
