import 'package:attendsure/firebase_services/std_details.dart';
import 'package:attendsure/pages/drawer_pages/attendance_page.dart';
import 'package:attendsure/pages/drawer_pages/my_information_page.dart';
import 'package:attendsure/pages/drawer_pages/notifications_page.dart';
import 'package:attendsure/pages/drawer_pages/settings_page.dart';
import 'package:attendsure/pages/drawer_pages/timetable_page.dart';
import 'package:attendsure/pages/screens/erp_login.dart';
import 'package:attendsure/pages/screens/home_page.dart';
import 'package:attendsure/pages/screens/login_page.dart';
import 'package:attendsure/pages/otp.dart';
import 'package:attendsure/pages/screens/teacherAndStudent.dart';
import 'package:attendsure/pages/screens/tr_erpLogin_page.dart';
import 'package:attendsure/utils/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/trAndstd',
      routes: {
        // '/': (context)=>TeacherandstudentPage(),
        Myroutes.attendanceRoute: (context) => AttendancePage(),
        Myroutes.notificationsRoute: (context) => NotificationsPage(),
        Myroutes.timetableRoute: (context) => TimetablePage(),
        Myroutes.myinformationRoute: (context) => MyInformationPage(),
        Myroutes.settingsRoute: (context) => SettingsPage(),
        Myroutes.loginRoute: (context) => LoginPage(),
        Myroutes.otpRoute: (context) => OTPPage(),
        // Myroutes.signupRoute: (context) => SignUpPage(),
        // Myroutes.backToLoginRoute: (context) => BacktologinPage(),
        Myroutes.erpLoginRoute: (context) => ErpLogin(),
        Myroutes.trAndstdroute:(context)=>TeacherandstudentPage(),
        Myroutes.trErpLoginRoute:(context)=>TrErploginPage()
      },
    onGenerateRoute: (settings) {
  // Handle named routes dynamically with arguments
  if (settings.name == Myroutes.stdDetailsRoute) {
    final arguments = settings.arguments as Map<String, String>;
    final erpNo = arguments['erpNo']!;
    return MaterialPageRoute(
      builder: (context) => StudentDetails(erpNo: erpNo),
    );
  }
  if (settings.name == Myroutes.homeRoute) {
    final arguments = settings.arguments as Map<String, String>;
    final erpNo = arguments['erpNo']!;
    final loginType = arguments['loginType']!;
    return MaterialPageRoute(
      builder: (context) => HomePage(erpNo: erpNo, loginType: loginType),
    );
  }
  if (settings.name == Myroutes.trDetailsRoute) {
    final arguments = settings.arguments as Map<String, String>;
    final erpNo = arguments['erpNo']!;
    final loginType = arguments['loginType']!;
    return MaterialPageRoute(
      builder: (context) => HomePage(erpNo: erpNo, loginType: loginType),
    );
  }
  return null; // Return null if route not found
},
    );
  }
}
