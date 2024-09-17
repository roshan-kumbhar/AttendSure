// import 'package:attendsure/widgets/drawer.dart';
// import 'package:attendsure/widgets/navigation_bar.dart';
// import 'package:flutter/material.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final String? email = ModalRoute.of(context)!.settings.arguments as String?;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('AttendSure'),
//         backgroundColor: Color(0xFF07A5FD),
//         foregroundColor: Colors.white,
//       ),
//       body: Center(
//         child: SizedBox(
//           height: 100,
//           width: 100,
//           child: Text('Hello'),
//         ),
//       ),
//       drawer: Mydrawer(
//         email: "$email",
//       ),
//       bottomNavigationBar: NavigationMenu(),
//     );
//   }
// }

import 'package:attendsure/firebase_services/std_details.dart';
import 'package:attendsure/widgets/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:attendsure/pages/drawer_pages/attendance_page.dart';
import 'package:attendsure/pages/bottom_navbar_pages/id_page.dart';
import 'package:attendsure/pages/drawer_pages/notifications_page.dart';
import 'package:attendsure/pages/drawer_pages/my_information_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // Selected index to manage the selected page

  String? erpNo;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Retrieve ERP number from route arguments
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    erpNo = args?['erpNo'] as String?;
  }

  // Define a list of widgets that correspond to the different screens
  final List<Widget> _pages = [
    Center(child: Text('Home Page')), // Replace with actual home widget
    AttendancePage(),
    StudentDetails(
      erpNo: '220600114',
    ),
    NotificationsPage(),
    MyInformationPage(),
  ];

  // This function will handle navigation item selection
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final String? email = ModalRoute.of(context)!.settings.arguments as String?;

    //  _pages[2] = StudentDetails(erpNo: erpNo ?? '');

    return Scaffold(
      appBar: AppBar(
        title: Text('AttendSure'),
        backgroundColor: Color(0xFF07A5FD),
        foregroundColor: Colors.white,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages, // Use IndexedStack to keep the state of all pages
      ),
      // drawer: Mydrawer(
      //   email: "$email",
      // ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
        destinations: const [
          NavigationDestination(
              icon: Icon(
                Icons.home,
                color: Color(0xFF0486FD),
              ),
              label: "Home"),
          NavigationDestination(
            icon: Icon(
              CupertinoIcons.person_crop_circle_badge_checkmark,
              color: Color(0xFF0486FD),
            ),
            label: "Attendance",
          ),
          NavigationDestination(
              icon: Icon(
                Icons.badge,
                color: Color(0xFF0486FD),
              ),
              label: "ID"),
          NavigationDestination(
              icon: Icon(
                CupertinoIcons.bell,
                color: Color(0xFF0486FD),
              ),
              label: "Notifications"),
          NavigationDestination(
              icon: Icon(
                CupertinoIcons.profile_circled,
                color: Color(0xFF0486FD),
              ),
              label: "Profile"),
        ],
      ),
    );
  }
}
