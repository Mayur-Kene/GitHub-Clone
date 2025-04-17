

import 'package:flutter/material.dart';

import '../../themes/colors.dart';

Widget tile(IconData icon, title, Color color) {
  return ListTile(
    tileColor: Colors.grey.shade900.withAlpha(150),
    onTap: () {},
    splashColor: darkGrey,
    leading: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: color,
        ),
        padding: const EdgeInsets.all(10),
        child: Icon(icon, color: Colors.white)),
    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
    title: Text(title, style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500)),
    trailing: SizedBox(
      height: 50,
      width: 50,
      child: Row(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text('8', style: TextStyle(color: grey, fontSize: 16, fontWeight: FontWeight.w600)),
          Icon(Icons.arrow_forward_ios_outlined, size: 15, color: Colors.grey.shade800),
        ],
      ),
    ),
  );
}