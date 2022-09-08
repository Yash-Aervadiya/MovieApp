import 'package:flutter/material.dart';
import 'package:movie_app/utils/app_strings.dart';

import '/empty_screen.dart';
import '/movies/popular_movies.dart';
import 'utils/app_colors.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  int _selectedIndex = 1;

  final List<Widget> pages = [
    const EmptyScreen(),
    const PopularMovies(),
    const EmptyScreen(),
    const EmptyScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: _buildScreenWidgets(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.lighterGrayColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: AppColors.blueColor,
        items: <BottomNavigationBarItem>[
          _bottomNavigationBarItem(AppStrings.homeImage, 0),
          _bottomNavigationBarItem(AppStrings.trophyImage, 1),
          _bottomNavigationBarItem(AppStrings.eventImage, 2),
          _bottomNavigationBarItem(AppStrings.graphImage, 3),
        ],
      ),
    );
  }

  Widget _buildScreenWidgets() {
    return pages.elementAt(_selectedIndex);
  }

  BottomNavigationBarItem _bottomNavigationBarItem(
      String imagePath, int index) {
    return BottomNavigationBarItem(
      icon: ImageIcon(
        AssetImage(imagePath),
        color: _selectedIndex == index ? AppColors.blueColor : Colors.white,
      ),
      label: '',
    );
  }
}
