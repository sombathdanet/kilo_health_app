import 'package:flutter/material.dart';

class BottomNavigationModel {
  final String label;
  final String icon;
  final Color color;

  BottomNavigationModel({
    required this.label,
    required this.icon,
    required this.color,
  });
}

List<BottomNavigationModel> bottomNavItems = [
  BottomNavigationModel(
    color: Colors.grey,
    label: "Home",
    icon: "assets/icons/ic_home.svg",
  ),
  BottomNavigationModel(
    color: Colors.grey,
    label: "Person",
    icon: "assets/icons/ic_messaage.svg",
  ),
  BottomNavigationModel(
    color: Colors.grey,
    label: "Person",
    icon: "assets/icons/ic_notification.svg",
  ),
  BottomNavigationModel(
    color: Colors.grey,
    label: "Person",
    icon: "assets/icons/ic_profile.svg",
  ),
];
