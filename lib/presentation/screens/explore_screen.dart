import 'package:flutter/material.dart';
import 'package:github_clone/presentation/reusable_widgets/empty_placeholder_widget.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return EmptyPlaceholderWidget(text: "Explore", icon: Icons.explore);
  }
}
