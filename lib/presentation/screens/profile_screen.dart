import 'package:flutter/material.dart';
import 'package:github_clone/presentation/reusable_widgets/empty_placeholder_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return EmptyPlaceholderWidget(text: "Profile", icon: Icons.person);
  }
}
