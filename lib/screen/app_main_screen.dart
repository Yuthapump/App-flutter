import 'package:flutter/material.dart';
import './home_screen.dart';
import './course_screen.dart';
import './notificate_screen.dart';
import './setting_screen.dart';
import './member_screen.dart';

class AppMainScreen extends StatelessWidget {
  const AppMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        body: const TabBarView(
          children: [
            HomeScreen(),
            CourseScreen(),
            MemberScreen(),
            NotificationsScreen(),
            SettingScreen(),
          ],
        ),
        bottomNavigationBar: Container(
          color: Colors.white,
          child: const TabBar(
            labelColor: Color.fromARGB(255, 8, 233, 83),
            unselectedLabelColor: Colors.grey,
            indicatorColor: Color.fromARGB(255, 8, 233, 83),
            indicatorWeight: 4,
            tabs: [
              Tab(
                icon: Icon(Icons.home),
                text: "Home",
              ),
              Tab(
                icon: Icon(Icons.menu_book),
                text: "Course",
              ),
              Tab(
                icon: Icon(Icons.person),
                text: "Member",
              ),
              Tab(
                icon: Icon(Icons.message),
                text: "Notication",
              ),
              Tab(
                icon: Icon(Icons.settings),
                text: "Settings",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
