import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project/feature/desboard/bottom_nav_item.dart';
import 'package:project/feature/desboard/desbord_provider.dart';
import 'package:project/feature/health/presentation/home/home_screen.dart';
import 'package:project/feature/message/message_screen.dart';
import 'package:project/feature/notification/notification_screen.dart';
import 'package:project/feature/profile/profile_screen.dart';
import 'package:provider/provider.dart';

class DesBoardScreen extends StatefulWidget {
  const DesBoardScreen({super.key});

  @override
  State<DesBoardScreen> createState() => _DesBoardScreenState();
}

class _DesBoardScreenState extends State<DesBoardScreen> {
  final List<Widget> _page = [
    const HomeScreen(),
    const MessageScreen(),
    const NotificationScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final desboardProvider = Provider.of<DesBoardProvider>(context);

    return Scaffold(
      body: _buildPage(desboardProvider),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 5),
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 5.0,
              spreadRadius: 5.0,
            )
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          child: _buildBottomNaviagtionBar(desboardProvider),
        ),
      ),
    );
  }

  Widget _buildPage(DesBoardProvider desBoardProvider) => PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: desBoardProvider.pageController,
        children: _page,
      );

  Widget _buildBottomNaviagtionBar(DesBoardProvider desBoardProvider) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: BottomNavigationBar(
        backgroundColor: Theme.of(context).cardColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        onTap: (index) => desBoardProvider.navigator(index),
        elevation: 0.0,
        items: List.generate(
          bottomNavItems.length,
          (index) => BottomNavigationBarItem(
            icon: Consumer<DesBoardProvider>(
              builder: (context, provider, child) => SvgPicture.asset(
                height: 30,
                width: 30,
                fit: BoxFit.contain,
                colorFilter: ColorFilter.mode(
                  provider.uiState.currentindex == index
                      ? Colors.blueAccent
                      : Colors.grey.withOpacity(0.8),
                  BlendMode.srcIn,
                ),
                bottomNavItems[index].icon,
              ),
            ),
            label: "",
          ),
        ),
      ),
    );
  }
}
