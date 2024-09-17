import 'package:attendsure/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  @override
  Widget build(BuildContext context) {
    int selectedindex = 0;
    final List<Map<String, dynamic>> items = [
      {'icon': Icons.home, 'label': 'Home', 'route': Myroutes.homeRoute},
      {
        'icon': CupertinoIcons.person_crop_circle_badge_checkmark,
        'label': 'Attendance',
        'route': Myroutes.attendanceRoute
      },
      {'icon': Icons.badge, 'label': 'ID', 'route': Myroutes.timetableRoute},
      {
        'icon': CupertinoIcons.bell,
        'label': 'Notifications',
        'route': Myroutes.notificationsRoute
      },
      {
        'icon': CupertinoIcons.profile_circled,
        'label': 'Profile',
        'route': Myroutes.myinformationRoute
      },
    ];

    void onitemTapped(int index) {
      setState(() {
        selectedindex = index;
      });
      Navigator.pushNamed(context, items[index]['route']);
    }

    return NavigationBar(
      selectedIndex: selectedindex,
      onDestinationSelected: onitemTapped,
      destinations: items
          .map(
            (item) => NavigationDestination(
              icon: Icon(item['icon'],
              color: Color(0x000000ff),),
              label: item['label'],
            ),
          )
          .toList(),
    );
  }
}