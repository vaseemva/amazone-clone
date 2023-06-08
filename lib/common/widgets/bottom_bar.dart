import 'package:amazone_clone/constants/global_variables.dart';
import 'package:amazone_clone/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class BottomBar extends StatefulWidget {
  static const String routeName = '/actual-home';
  const BottomBar({Key? key}) : super(key: key);

  @override
  BottomBarState createState() => BottomBarState();
}

class BottomBarState extends State<BottomBar> {
  // ignore: prefer_final_fields
  int _currentIndex = 0;
  double bottomBarwidth = 42;
  updatePage(int page) {
    setState(() {
      _currentIndex = page;
    });
  }

  List<Widget> pages = [
    const HomeScreen(),
    const Center(
      child: Text('account screen'),
    ),
    const Center(
      child: Text('cart page'),
    )
  ];

  double bottomBarBorderwidth = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: updatePage,
        items: [
          BottomNavigationBarItem(
              icon: Container(
                width: bottomBarwidth,
                decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          color: _currentIndex == 0
                              ? GlobalVariables.selectedNavBarColor
                              : GlobalVariables.backgroundColor,
                          width: bottomBarBorderwidth)),
                ),
                child: const Icon(Icons.home_outlined),
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Container(
                width: bottomBarwidth,
                decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          color: _currentIndex == 1
                              ? GlobalVariables.selectedNavBarColor
                              : GlobalVariables.backgroundColor,
                          width: bottomBarBorderwidth)),
                ),
                child: const Icon(Icons.person_outlined),
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Container(
                width: bottomBarwidth,
                decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          color: _currentIndex == 2
                              ? GlobalVariables.selectedNavBarColor
                              : GlobalVariables.backgroundColor,
                          width: bottomBarBorderwidth)),
                ),
                child: const badges.Badge(
                  badgeContent: Text('2'),
                  badgeStyle: badges.BadgeStyle(badgeColor: Colors.white),
                  child: Icon(Icons.shopping_cart_outlined),
                ),
              ),
              label: '')
        ],
        currentIndex: _currentIndex,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 28,
      ),
    );
  }
}
