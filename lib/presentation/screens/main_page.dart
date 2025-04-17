import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:github_clone/presentation/controllers/main_controller.dart';
import 'package:github_clone/presentation/reusable_widgets/bottom_nav_widget.dart';
import 'package:github_clone/themes/colors.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (controller) {
        return Scaffold(
            backgroundColor: background,
            body: controller.screens[controller.selectedIndex],
            bottomNavigationBar: Container(
              color: tabBackground,
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BottomNavWidget(
                    icon: Icons.home,
                    text: "Home",
                    isSelected: controller.selectedIndex == 0,
                    onTap: () {
                      controller.changeTab(0);
                    },
                  ),
                  BottomNavWidget(
                    icon: Icons.notifications,
                    text: "Notification",
                    isSelected: controller.selectedIndex == 1,
                    onTap: () {
                      controller.changeTab(1);
                    },
                  ),
                  BottomNavWidget(
                    icon: Icons.explore,
                    text: "Explore",
                    isSelected: controller.selectedIndex == 2,
                    onTap: () {
                      controller.changeTab(2);
                    },
                  ),
                  BottomNavWidget(
                    icon: Icons.person,
                    text: "Profile",
                    isSelected: controller.selectedIndex == 3,
                    onTap: () {
                      controller.changeTab(3);
                    },
                  ),
                ],
              ),
            ));
      },
    );
  }
}


