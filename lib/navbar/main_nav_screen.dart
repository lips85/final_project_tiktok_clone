import 'package:final_project_tiktok_clone/features/charts/views/chart_screen.dart';
import 'package:final_project_tiktok_clone/features/moods/views/post_screen.dart';
import 'package:final_project_tiktok_clone/features/settings/views/settings_screen_tweet.dart';
import 'package:final_project_tiktok_clone/features/writes/views/write_screen.dart';
import 'package:final_project_tiktok_clone/navbar/widgets/nav_tap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainNavScreen extends ConsumerStatefulWidget {
  static String routeName = "Home";
  static String routeURL = "/";

  const MainNavScreen({super.key});

  @override
  ConsumerState<MainNavScreen> createState() => _MainNavScreenState();
}

class _MainNavScreenState extends ConsumerState<MainNavScreen> {
  int _selectedIndex = 0;
  bool isSelected = false;
  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onWriteTap() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => const WriteScreen(),
    );

    setState(() {
      isSelected = !isSelected;
    });
  }

  final List screens = [
    "Home",
    "Post",
    "Chart",
    "Profile",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: const PostScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 2,
            child: const ChartScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 3,
            child: const SettingsScreen(),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavTap(
              icon: FontAwesomeIcons.house,
              selectedIcon: FontAwesomeIcons.house,
              isSelected: _selectedIndex == 0,
              onTap: () => _onTap(0),
            ),
            Expanded(
              child: GestureDetector(
                onTap: _onWriteTap,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 300),
                  opacity: isSelected ? 0.4 : 0.4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(
                        isSelected
                            ? FontAwesomeIcons.solidPenToSquare
                            : FontAwesomeIcons.penToSquare,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            NavTap(
              icon: FontAwesomeIcons.chartPie,
              selectedIcon: FontAwesomeIcons.chartPie,
              isSelected: _selectedIndex == 2,
              onTap: () => _onTap(2),
            ),
            NavTap(
              icon: FontAwesomeIcons.user,
              selectedIcon: FontAwesomeIcons.solidUser,
              isSelected: _selectedIndex == 3,
              onTap: () => _onTap(3),
            ),
          ],
        ),
      ),
    );
  }
}
