import 'package:flutter/material.dart';
import 'package:github_clone/themes/colors.dart';

class EmptyPlaceholderWidget extends StatelessWidget {
  const EmptyPlaceholderWidget({
    super.key,
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, size: 100, color: grey),
          Text(text, style: TextStyle(fontSize: 20, color: Colors.white),),
        ],
      ),
    );
  }
}
