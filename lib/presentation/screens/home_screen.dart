import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_clone/presentation/controllers/main_controller.dart';
import 'package:github_clone/themes/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(builder: (controller) {
      return Scaffold(
        backgroundColor: background,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Text(
              "Home",
              style: TextStyle(
                fontSize: 35,
                color: Colors.white,
                fontWeight: FontWeight.w900,
              ),
            ),
            TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                isDense: true,
                filled: true,
                fillColor: Colors.grey.shade400.withValues(alpha: 0.25),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
                hintText: "Search User",
                hintStyle: TextStyle(color: Colors.grey),
                counterText: '',
                prefixIcon: Icon(Icons.search, color: Colors.grey, size: 25),
              ),
              cursorColor: blue,
              maxLength: 100,
              minLines: 1,
              controller: controller.searchController,
              onChanged: (value) {
                controller.searchQuery.value = value;
              },
            ),
            Expanded(
              child: controller.getWidgets(),
            )
          ],
        ).paddingOnly(left: 12, right: 12, top: 20),
      );
    });
  }
}
