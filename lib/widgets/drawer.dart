import 'package:attendsure/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Mydrawer extends StatelessWidget {
  final String email;
  const Mydrawer({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    // List of tiles data
    final List<Map<String, dynamic>> drawerItems = [
      {
        'icon': CupertinoIcons.home,
        'title': 'Home',
        'route': Myroutes.homeRoute
      },
      {
        'icon': CupertinoIcons.person_crop_circle_badge_checkmark,
        'title': 'Attendance',
        'route': Myroutes.attendanceRoute
      },
      {
        'icon': CupertinoIcons.bell,
        'title': 'Notifications',
        'route': Myroutes.notificationsRoute
      },
      {
        'icon': CupertinoIcons.calendar,
        'title': 'Time Table',
        'route': Myroutes.timetableRoute
      },
      {
        'icon': CupertinoIcons.profile_circled,
        'title': 'My Information',
        'route': Myroutes.myinformationRoute
      },
      {
        'icon': CupertinoIcons.gear,
        'title': 'Settings',
        'route': Myroutes.settingsRoute
      },
    ];

    return Drawer(
      child: Container(
        color: Color(0xFF0486FD),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Color(0xFF0486FD)),
                margin: EdgeInsets.zero,
                accountEmail: Text(email),
                currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage(
                        "assets/images/userImg-removebg-preview.png")),
                accountName: null,
              ),
            ),
            // Generate ListTile widgets using map
            ...drawerItems.map((item) => ListTile(
                  leading: Icon(
                    item['icon'],
                    color: Colors.white,
                  ),
                  title: Text(
                    item['title'],
                    textScaler: TextScaler.linear(1.2),
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    if (item['route'] == Myroutes.homeRoute) {
                      Navigator.pushNamed(context, item['route'],
                          arguments: email);
                    } else {
                      Navigator.pushNamed(context, item['route']);
                    }
                  },
                )),
          ],
        ),
      ),
    );
  }
}
