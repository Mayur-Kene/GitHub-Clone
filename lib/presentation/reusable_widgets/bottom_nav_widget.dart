import 'package:flutter/material.dart';
import 'package:github_clone/themes/colors.dart';

class BottomNavWidget extends StatelessWidget {
  const BottomNavWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  final IconData icon;
  final String text;
  final bool isSelected;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: isSelected ? blue : grey),
          Text(text, style: TextStyle(color: isSelected ? blue : grey)),
        ],
      ),
    );
  }
}
