// import 'package:flutter_svg/flutter_svg.dart';
import 'package:mock_test_app/controllers/splash_screen_controller.dart';
import 'package:mock_test_app/utils/constants/imports.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final SplashScreenController splashScreenController = Get.find<SplashScreenController>();
  @override
  Widget build(BuildContext context) {
    heightWidthKeyboardValue(context);
    return Scaffold(
      body: Image.asset(
        splashImage,
        width: width,
        height: height,
        fit: BoxFit.cover,
      ),
    );
  }
}
