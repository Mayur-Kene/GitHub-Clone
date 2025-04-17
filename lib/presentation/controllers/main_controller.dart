import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_clone/data/models/search_model.dart';
import 'package:github_clone/data/models/user_model.dart';
import 'package:github_clone/presentation/reusable_widgets/no_data_found_widget.dart';
import 'package:github_clone/presentation/reusable_widgets/user_list_tile.dart';
import 'package:github_clone/presentation/screens/explore_screen.dart';
import 'package:github_clone/presentation/screens/notification_screen.dart';
import 'package:github_clone/presentation/screens/profile_screen.dart';
import 'package:github_clone/presentation/screens/user_profile_detail_screen.dart';
import 'package:github_clone/services/database_service.dart';
import 'package:github_clone/themes/colors.dart';
import '../screens/home_screen.dart';

class MainController extends GetxController {
  //database
  DatabaseService databaseService = DatabaseService.instance;

  //api calling
  final dio = Dio();

  //screen list
  final List<Widget> screens = [
    HomeScreen(),
    NotificationScreen(),
    ExploreScreen(),
    ProfileScreen(),
  ];

  // masterModels
  List<UserModel> searchList = [];
  List<SearchModel> recentSearchList = [];

  //editing controllers
  TextEditingController searchController = TextEditingController();

  //
  bool isFollowing = false;
  RxString searchQuery = ''.obs;
  int selectedIndex = 0;
  bool isLoading = false;
  String errorMessage = "No User Found";
  IconData errorIcon = Icons.close_rounded;

  @override
  void onInit() {
    dio.options = BaseOptions(
      baseUrl: "https://api.github.com",
    );
    getRecentSearchList();


    debounce(
      searchQuery,
      (callback) {
        if (searchQuery.value.isNotEmpty) {
          searchUser(searchQuery.value);
        } else {
          update();
        }
      },
      time: Duration(milliseconds: 800),
    );
    super.onInit();
  }

  void changeTab(int index) {
    selectedIndex = index;
    update();
  }

  void getRecentSearchList() async {
    recentSearchList = await databaseService.getSearchesList();
    update();
  }

  Future<void> searchUser(String word) async {
    isLoading = true;
    searchList.clear();
    update();

    try {
      var response = await dio.get('/users/$word');

      if (response.data is! List) {
        final data = UserModel.fromJson(response.data);
        searchList.add(data);
      } else {
        searchList = (response.data as List).map((data) => UserModel.fromJson(data)).toList();
      }
      log('response: $response');
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        errorMessage = "No Internet Connection";
        errorIcon = Icons.signal_wifi_connected_no_internet_4_rounded;
      } else {
        errorMessage = "No User Found";
        errorIcon = Icons.close_rounded;
      }
      debugPrint("Error $e");
    }
    isLoading = false;
    update();
  }

  Widget getWidgets() {
    if (isLoading == true) {
      return Center(child: CircularProgressIndicator());
    } else if (isLoading == false && searchQuery.value.isEmpty) {
      // Recent Search UI
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recent Searches",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                ),
              ).marginOnly(top: 10),
              if (recentSearchList.isNotEmpty)
                InkWell(
                  onTap: () {
                    databaseService.deleteAllSearchesFromDatabase();
                    recentSearchList.clear();
                    update();
                  },
                  child: Text(
                    "Clear",
                    style: TextStyle(fontSize: 16, color: blue, fontWeight: FontWeight.w600),
                  ).marginOnly(top: 10),
                )
            ],
          ),
          recentSearchList.isNotEmpty
              ? Expanded(
                  child: ListView.builder(
                    itemCount: recentSearchList.length,
                    itemBuilder: (context, index) {
                      final item = recentSearchList[index];
                      return UserListTile(
                        loginName: item.name,
                        userName: "@${item.name.toLowerCase()}",
                        imageUrl: item.image,
                        onTap: () {
                          final userModel = UserModel.fromJson(jsonDecode(item.data));
                          Get.to(() => UserProfileDetailScreen(user: userModel), transition: Transition.fadeIn)?.then(
                            (value) {
                              searchController.clear();
                              searchQuery.value = '';
                              update();
                            },
                          );
                        },
                        isClearVisible: true,
                        clear: () {
                          databaseService.deleteSearchFromDatabase(item.id);
                          recentSearchList.removeAt(index);
                          update();
                        },
                      );
                    },
                  ),
                )
              : Expanded(child: NoDataFoundWidget(text: "No Search Found", icon: Icons.search_off_rounded))
        ],
      );
    } else if (isLoading == false && searchList.isEmpty) {
      return NoDataFoundWidget(text: errorMessage, icon: errorIcon);
    } else if (isLoading == false && searchList.isNotEmpty) {
      return ListView.builder(
        itemCount: searchList.length,
        itemBuilder: (context, index) {
          final item = searchList[index];
          return UserListTile(
            loginName: "${item.login.capitalize}",
            userName: "@${item.login.toLowerCase()}",
            imageUrl: item.avatarUrl,
            onTap: () {
              databaseService.addSearchToDatabase(item.id, item.login, item.avatarUrl, jsonEncode(item.toJson()));
              if (!recentSearchList.any((element) => element.id == item.id)) {
                recentSearchList.insert(
                  0,
                  SearchModel(
                    id: item.id,
                    name: item.login,
                    image: item.avatarUrl,
                    timeStamp: DateTime.now().millisecondsSinceEpoch,
                    data: jsonEncode(item.toJson(),),
                  ),
                );
              }

              Get.to(
                      () => UserProfileDetailScreen(
                            user: item,
                          ),
                      transition: Transition.leftToRight)
                  ?.then(
                (value) {
                  searchController.clear();
                  searchQuery.value = '';
                  update();
                },
              );
            },
          );
        },
      );
    }
    return SizedBox.shrink();
  }


}
