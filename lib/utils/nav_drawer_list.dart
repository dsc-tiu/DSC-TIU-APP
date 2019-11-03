import 'package:dsc_tiu/components/nav_drawer_item.dart';
import 'package:dsc_tiu/screens/settings.dart';
import 'package:dsc_tiu/utils/google_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavDrawerList {
  final PageController pageController;
  final FirebaseUser user;
  final BuildContext context;
  // int _currentIndex;

  NavDrawerList({
    @required this.pageController,
    @required this.user,
    @required this.context,
  });

  void _pageChangeFunction(int page) {
    pageController.animateToPage(
      page,
      duration: Duration(microseconds: 100),
      curve: Curves.linear,
    );
    Navigator.pop(context);
  }

  List<Widget> getList() {
    int _currentIndex = pageController.hasClients
        ? pageController.page.toInt()
        : pageController.initialPage;
    return [
      UserAccountsDrawerHeader(
        accountEmail: Text(user.email),
        accountName: Text(user.displayName),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff43cea2),
              Color(0xff185a9d)
            ],
          ),
        ),
        currentAccountPicture: ClipRRect(
          borderRadius: BorderRadius.circular(50.0),
          child: Image.network(user.photoUrl),
        ),
      ),
      NavDrawerItem(
        title: 'Sessions',
        icon: FontAwesomeIcons.code,
        selectedColor: GoogleColors.red,
        isSelected: _currentIndex == 0,
        onPressed: () => _pageChangeFunction(0),
      ),
      NavDrawerItem(
        title: 'Courses',
        icon: FontAwesomeIcons.book,
        selectedColor: GoogleColors.green,
        isSelected: _currentIndex == 1,
        onPressed: () => _pageChangeFunction(1),
      ),
      NavDrawerItem(
        title: 'Announcements',
        icon: FontAwesomeIcons.solidStickyNote,
        selectedColor: GoogleColors.yellow,
        isSelected: _currentIndex == 2,
        onPressed: () => _pageChangeFunction(2),
      ),
      NavDrawerItem(
        title: 'Core Team',
        icon: FontAwesomeIcons.userFriends,
        selectedColor: GoogleColors.blue,
        isSelected: _currentIndex == 3,
        onPressed: () => _pageChangeFunction(3),
      ),
      NavDrawerItem(
        title: 'Gallery',
        icon: FontAwesomeIcons.images,
        selectedColor: GoogleColors.red,
        isSelected: _currentIndex == 4,
        onPressed: () => _pageChangeFunction(4),
      ),
      NavDrawerItem(
        title: 'Contact Us',
        icon: FontAwesomeIcons.phoneAlt,
        selectedColor: GoogleColors.green,
        isSelected: _currentIndex == 5,
        onPressed: () => _pageChangeFunction(5),
      ),
      NavDrawerItem(
        title: 'About Us',
        icon: FontAwesomeIcons.info,
        selectedColor: GoogleColors.yellow,
        isSelected: _currentIndex == 6,
        onPressed: () => _pageChangeFunction(6),
      ),
      NavDrawerItem(
          title: 'Settings',
          icon: FontAwesomeIcons.wrench,
          selectedColor: GoogleColors.blue,
          isSelected: false,
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => Settings(),
              ),
            );
          }),
    ];
  }
}
