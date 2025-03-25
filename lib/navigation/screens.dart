// Screens in App:
import 'package:flutter/material.dart';

class InitialScreens {
  static const String splash = "/splash_screen";
  static const String login = "/login_screen";
  static const String details = "/details_screen";
  static const String search = "/search_screen";
}


class BottomNavigationScreen {
  final String route;
  final String title;
  final IconData icon;

  const BottomNavigationScreen({
    required this.route,
    required this.title,
    required this.icon,
  });

  // Bottom Navigation Screens
  static const BottomNavigationScreen home = BottomNavigationScreen(
    route: "/home_screen",
    title: "Home",
    icon: Icons.home_outlined,
  );

}

// Items in Bottom Navigation:
final List<BottomNavigationScreen> bottomNavigationItems = [
  BottomNavigationScreen.home,
];