import 'package:flutter/material.dart';

class SyBottomNavItem {
  final IconData icon;
  final String label;
  final String location;
  final VoidCallback onTap;

  SyBottomNavItem({
    required this.icon,
    required this.label,
    required this.location,
    required this.onTap,
  });
}

class SyBottomNavBar extends StatelessWidget {
  final List<SyBottomNavItem> items;
  final String currentLocation;
  final Color selectedColor;
  final Color unselectedColor;
  final double iconSize;
  final double fontSize;

  const SyBottomNavBar({
    super.key,
    required this.items,
    this.currentLocation = 'home',
    this.selectedColor = Colors.orange,
    this.unselectedColor = Colors.blueGrey,
    this.iconSize = 22,
    this.fontSize = 13,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: items.map((item) {
          bool isSelected = item.location == currentLocation;

          return MaterialButton(
            minWidth: 40,
            onPressed: item.onTap,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  size: iconSize,
                  color: isSelected ? selectedColor : unselectedColor,
                ),
                Text(
                  item.label,
                  style: TextStyle(fontSize: fontSize),
                )
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}