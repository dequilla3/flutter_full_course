import 'package:flutter/material.dart';
import 'package:flutter_full_course/pages/home_page.dart';
import 'package:flutter_full_course/pages/profile_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.house), label: 'Home'),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.heart), label: 'Favorite'),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.plus), label: 'Add Post'),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.message), label: 'Message'),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.user), label: 'User'),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  final pages = [
    HomePage(),
    const Center(child: Text('Favorite')),
    const Center(child: Text('Add Post')),
    const Center(child: Text('Message')),
    const ProfilePage(),
  ];
}
