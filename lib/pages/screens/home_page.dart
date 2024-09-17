import 'package:attendsure/firebase_services/teacher_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:attendsure/pages/drawer_pages/attendance_page.dart';
import 'package:attendsure/pages/drawer_pages/notifications_page.dart';
import 'package:attendsure/pages/drawer_pages/my_information_page.dart';
import 'package:attendsure/firebase_services/std_details.dart';

class HomePage extends StatefulWidget {
  final String erpNo;
  final String loginType; // Add loginType here
  const HomePage({super.key, required this.erpNo, required this.loginType}); // Include loginType in constructor

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _initializePages();
  }

  void _initializePages() {
    _pages = [
      Center(child: Text('Home Page')),
      AttendancePage(),
      _getDetailsPage(), // Conditionally render the details page
      NotificationsPage(),
      MyInformationPage(),
    ];
  }

  Widget _getDetailsPage() {
    // Render details page based on user type
    if (widget.loginType == 'teacher') {
      return TeacherDetails(erpNo: widget.erpNo);
    } else {
      return StudentDetails(erpNo: widget.erpNo);
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AttendSure ${widget.erpNo}'),
        backgroundColor: Color(0xFF07A5FD),
        foregroundColor: Colors.white,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
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
