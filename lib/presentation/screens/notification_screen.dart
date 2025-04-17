import 'package:flutter/material.dart';
import 'package:github_clone/presentation/reusable_widgets/empty_placeholder_widget.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return EmptyPlaceholderWidget(text: "Notification", icon: Icons.notifications_rounded);
  }
}
