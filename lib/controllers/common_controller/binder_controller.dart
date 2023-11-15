import 'package:mock_test_app/controllers/auth/auth_controller.dart';
import 'package:mock_test_app/controllers/home_controller.dart';
import 'package:mock_test_app/controllers/mock_test_controller.dart';
import 'package:mock_test_app/controllers/schedule_controller.dart';
import 'package:mock_test_app/utils/constants/imports.dart';
import 'package:mock_test_app/controllers/common_controller/global_controller.dart';
import 'package:mock_test_app/controllers/splash_screen_controller.dart';

class BinderController implements Bindings {
  @override
  void dependencies() {
    Get.put<GlobalController>(GlobalController(), permanent: true);
    Get.put<SplashScreenController>(SplashScreenController());
    Get.put<AuthController>(AuthController());
    Get.put<HomeController>(HomeController());
    Get.put<MockTestController>(MockTestController());
    Get.put<ScheduleController>(ScheduleController());
  }
}
