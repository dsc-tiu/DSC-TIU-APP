import 'package:dsc_tiu/config/dark_mode.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavDrawerItem extends StatelessWidget {
  final Color selectedColor;
  final Function onPressed;
  final IconData icon;
  final String title;
  final bool isSelected;

  NavDrawerItem({
    this.selectedColor,
    @required this.onPressed,
    this.icon,
    @required this.title,
    this.isSelected,
  });
  @override
  Widget build(BuildContext context) {
    bool isDarkModeOn = Provider.of<DarkMode>(context).isDarkModeOn;
    return ListTile(
      leading: Icon(
        icon,
        color: selectedColor,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isSelected
              ? selectedColor
              : isDarkModeOn ? Colors.white : Colors.black,
        ),
      ),
      onTap: onPressed,
    );
  }
}
