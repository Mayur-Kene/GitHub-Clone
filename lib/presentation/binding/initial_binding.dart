import 'package:get/get.dart';
import 'package:github_clone/presentation/controllers/main_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MainController>(MainController(), permanent: true);
  }
}
