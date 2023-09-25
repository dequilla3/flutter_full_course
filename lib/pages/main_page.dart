import 'package:flutter/material.dart';
import 'package:flutter_full_course/components/bottom_navigation_item.dart';
import 'package:flutter_full_course/config/app_icons.dart';
import 'package:flutter_full_course/pages/home_page.dart';
import 'package:flutter_full_course/pages/profile_page.dart';
import 'package:flutter_full_course/style/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Menus menus = Menus.home;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: pages[menus.index],
        bottomNavigationBar: MyBottomNavigation(
          onTap: (Menus value) {
            setState(() {
              menus = value;
            });
          },
          menus: menus,
        ));
  }

  final pages = [
    HomePage(),
    const Center(child: Text('Favorite')),
    const Center(child: Text('Add Post')),
    const Center(child: Text('Message')),
    const ProfilePage(),
  ];
}

enum Menus { home, favorite, add, messages, user }

class MyBottomNavigation extends StatelessWidget {
  final ValueChanged<Menus> onTap;
  final Menus menus;
  const MyBottomNavigation(
      {super.key, required this.onTap, required this.menus});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 87,
      margin: const EdgeInsets.all(24),
      child: Stack(children: [
        Positioned(
          right: 0,
          left: 0,
          top: 17,
          child: Container(
            height: 70,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(25))),
            child: Row(
              children: [
                Expanded(
                    child: BottomNavigationItem(
                        onPressed: () => onTap(Menus.home),
                        icon: AppIcons.home,
                        currentMenu: menus,
                        menu: Menus.home)),
                Expanded(
                    child: BottomNavigationItem(
                        onPressed: () => onTap(Menus.favorite),
                        icon: AppIcons.favorite,
                        currentMenu: menus,
                        menu: Menus.favorite)),
                const Spacer(),
                Expanded(
                    child: BottomNavigationItem(
                        onPressed: () => onTap(Menus.messages),
                        icon: AppIcons.chat,
                        currentMenu: menus,
                        menu: Menus.messages)),
                Expanded(
                    child: BottomNavigationItem(
                        onPressed: () => onTap(Menus.user),
                        icon: AppIcons.profile,
                        currentMenu: menus,
                        menu: Menus.user)),
              ],
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          child: GestureDetector(
            onTap: () => onTap(Menus.add),
            child: Container(
              width: 64,
              height: 64,
              padding: const EdgeInsets.all(18),
              decoration: const BoxDecoration(
                  color: AppColors.primary, shape: BoxShape.circle),
              child: SvgPicture.asset(AppIcons.add),
            ),
          ),
        )
      ]),
    );
  }
}
