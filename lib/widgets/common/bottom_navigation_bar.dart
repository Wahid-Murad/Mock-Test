import 'package:mock_test_app/controllers/common_controller/global_controller.dart';
import 'package:mock_test_app/utils/constants/imports.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  CustomBottomNavigationBar({super.key});
  final GlobalController _globalController = Get.find<GlobalController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: cBottomNavBarColor,
          labelTextStyle: MaterialStateProperty.all(
            p14MediumTextStyle(cTextPrimaryColor),
          ),
        ),
        child: NavigationBar(
          height: height > kSmallDeviceSizeLimit ? 70 : 60,
          backgroundColor: cWhiteColor,
          selectedIndex: _globalController.bottomNavBarIndex.value,
          onDestinationSelected: (value) {
            _globalController.bottomNavBarIndex.value = value;
            Get.toNamed(_globalController.screens[value]);
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home),
              selectedIcon: Icon(Icons.home),
              label: ksHome,
            ),
            NavigationDestination(
              icon: Icon(Icons.text_snippet),
              selectedIcon: Icon(Icons.text_snippet),
              label: ksTest,
            ),
            NavigationDestination(
              icon: Icon(Icons.calendar_month),
              selectedIcon: Icon(Icons.calendar_month),
              label: ksSchedule,
            ),
            NavigationDestination(
              icon: Icon(Icons.feedback_outlined),
              selectedIcon: Icon(Icons.feedback_outlined),
              label: ksReward,
            ),
          ],
        ),
      ),
    );
  }
}
