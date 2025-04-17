import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_clone/themes/colors.dart';

class UserListTile extends StatelessWidget {
  const UserListTile({
    super.key,
    required this.loginName,
    required this.userName,
    required this.imageUrl,
    this.onTap,
    this.clear,
    this.isClearVisible = false,
  });

  final String loginName;
  final String userName;
  final String imageUrl;
  final Function()? onTap;
  final bool isClearVisible;
  final Function()? clear;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(loginName, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
      subtitle: Text(userName, style: TextStyle(color: grey)),
      leading: CircleAvatar(backgroundImage: NetworkImage(imageUrl), backgroundColor: Colors.grey),
      onTap: onTap,
      dense: true,
      splashColor: Colors.transparent,
      contentPadding: EdgeInsets.zero,
      trailing: isClearVisible ? InkWell(
        onTap: clear,
        child: Icon(Icons.clear_rounded),
      ).paddingOnly(right: 5) : null,
    );
  }
}
