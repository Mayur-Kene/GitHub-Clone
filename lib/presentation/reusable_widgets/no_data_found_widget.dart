import 'package:flutter/material.dart';
import 'package:github_clone/themes/colors.dart';

class NoDataFoundWidget extends StatelessWidget {
  const NoDataFoundWidget({
    super.key,
    this.icon = Icons.close_rounded,
    this.text = "No User Found",
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: grey, size: 150),
          Text(text, style: TextStyle(color: grey, fontSize: 20)),
        ],
      ),
    );
  }
}
