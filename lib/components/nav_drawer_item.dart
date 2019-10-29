import 'package:flutter/material.dart';

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
    return ListTile(
      leading: Icon(
        icon,
        color: selectedColor,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isSelected ? selectedColor : Colors.black,
        ),
      ),
      onTap: onPressed,
    );
  }
}
