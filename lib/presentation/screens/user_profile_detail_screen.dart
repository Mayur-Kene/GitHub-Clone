import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_clone/data/models/user_model.dart';
import 'package:github_clone/themes/colors.dart';

import '../reusable_widgets/icon_label.dart';
import '../reusable_widgets/overlap_image_widget.dart';
import '../reusable_widgets/tile.dart';

class UserProfileDetailScreen extends StatefulWidget {
  const UserProfileDetailScreen({super.key, required this.user});

  final UserModel user;

  @override
  State<UserProfileDetailScreen> createState() => _UserProfileDetailScreenState();
}

class _UserProfileDetailScreenState extends State<UserProfileDetailScreen> {
  bool isFollowing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        leadingWidth: 100,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.arrow_back_ios_new_rounded, color: blue),
              Text("Back", style: TextStyle(color: blue, fontSize: 16)),
            ],
          ).marginOnly(left: 5),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_horiz_rounded, color: blue),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          spacing: 5,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              spacing: 5,
              children: [
                Row(
                  spacing: 10,
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: grey,
                      backgroundImage: NetworkImage(widget.user.avatarUrl),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${widget.user.login.capitalize}", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                        Text("@${widget.user.login.toLowerCase()}", style: TextStyle(color: grey, fontSize: 14)),
                      ],
                    )
                  ],
                ).marginOnly(bottom: 15),
                SizedBox(
                  width: double.infinity,
                  child: Wrap(
                    spacing: 15,
                    runSpacing: 5,
                    runAlignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    children: [
                      iconLabel("@github", Icons.apartment_rounded, Colors.white),
                      iconLabel(widget.user.location, Icons.location_on_outlined, grey),
                      iconLabel("@github.blog", Icons.link, Colors.white),
                      iconLabel("${widget.user.email}", Icons.email_outlined, Colors.white),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        spacing: 8,
                        children: [
                          Icon(Icons.group, color: grey),
                          Text("${widget.user.followers}", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                          Text("followers", style: TextStyle(color: grey, fontSize: 16, fontWeight: FontWeight.bold)),
                          Text("${widget.user.following}", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                          Text("following", style: TextStyle(color: grey, fontSize: 16, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ),
                overlapImageWidget(25),
                SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        isFollowing = !isFollowing;
                        setState(() {});
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: !isFollowing ? darkGrey : blue,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: Text(
                        !isFollowing ? "+ Follow" : "Following",
                        style: TextStyle(color: Colors.grey.shade300, fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    )),
              ],
            ).paddingAll(15),
            Column(
              children: [
                tile(
                  Icons.book,
                  "Repositories",
                  Colors.grey.shade800,
                ),
                Divider(color: grey.withValues(alpha: 0.35), height: 1),
                tile(Icons.star_border_rounded, "Starred", Colors.amber),
                Divider(color: grey.withValues(alpha: 0.35), height: 1),
                tile(Icons.apartment_outlined, "Organizations", Colors.orange),
              ],
            ),
            iconLabel("Popular", Icons.star_border_rounded, grey).marginOnly(top: 20, left: 10, bottom: 10),
            SizedBox(
              height: 200,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 300,
                      width: 260,
                      decoration: BoxDecoration(color: Colors.grey.shade900, borderRadius: BorderRadius.circular(5)),
                      padding: const EdgeInsets.all(15.0),
                      margin: const EdgeInsets.only(left: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 15,
                                backgroundColor: Colors.blue,
                                backgroundImage: NetworkImage(widget.user.avatarUrl),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                "${widget.user.login.capitalize}",
                                style: TextStyle(color: Colors.grey.shade300, fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Spoon-Knife',
                            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Expanded(
                            child: Text(
                              'This repo is for demonstration purposes only',
                              style: TextStyle(color: Colors.grey.shade300, fontSize: 16, fontWeight: FontWeight.bold),
                              maxLines: 8,
                            ),
                          ),
                          Row(
                            spacing: 15,
                            children: [
                              iconLabel("12932", Icons.star_border_rounded, grey),
                              Row(
                                children: [
                                  Container(
                                    height: 15,
                                    width: 15,
                                    decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(30)),
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    'HTML',
                                    style: TextStyle(color: Colors.grey.shade300, fontSize: 16, fontWeight: FontWeight.bold),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  },
                  itemCount: 4),
            ).paddingOnly(bottom: 20)
          ],
        ),
      ),
    );
  }
}
