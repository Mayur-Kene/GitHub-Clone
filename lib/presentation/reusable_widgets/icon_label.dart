import 'package:flutter/material.dart';

import '../../themes/colors.dart';

Widget iconLabel(String labelText, IconData icon, Color textColor) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    spacing: 8,
    children: [
      Icon(icon, color: grey),
      Flexible(
        child: Text(
          labelText,
          style: TextStyle(color: textColor, fontSize: 16),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ],
  );
}
