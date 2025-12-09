import 'package:flutter/material.dart';

import '../../../core/constans/app_colors.dart';
import '../../../core/constans/app_icon.dart';
import 'dashboard_screen.dart';
import '../news/ui/news_screen.dart';
import 'profile_screen.dart';

class NavBarBottom extends StatefulWidget {
  const NavBarBottom({super.key});

  @override
  State<NavBarBottom> createState() => _NavBarBottomState();
}

class _NavBarBottomState extends State<NavBarBottom> {
  int currentIndex = 0;

  Widget body() {
    switch (currentIndex) {
      case 0:
        return DashboardScreen();
      case 1:
        return NewsScreen();
      case 2:
        return const ProfileScreen();
      default:
        return DashboardScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: AppColors.black100, width: 1.0),
          ),
        ),
        child: BottomAppBar(
          padding: const EdgeInsets.all(0),
          shape: const CircularNotchedRectangle(),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColors.white,
            elevation: 0,
            currentIndex: currentIndex,
            onTap: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  AppIcons.dashboard,
                  width: 24,
                  color: AppColors.black300,
                ),
                activeIcon: Image.asset(
                  AppIcons.dashboard,
                  width: 24,
                  color: AppColors.primary,
                ),
                label: 'Dashboard',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  AppIcons.news,
                  width: 24,
                  color: AppColors.black300,
                ),
                activeIcon: Image.asset(
                  AppIcons.news,
                  width: 24,
                  color: AppColors.primary,
                ),
                label: 'News',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  AppIcons.user,
                  width: 24,
                  color: AppColors.black300,
                ),
                activeIcon: Image.asset(
                  AppIcons.user,
                  width: 24,
                  color: AppColors.primary,
                ),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
      body: body(),
    );
  }
}
