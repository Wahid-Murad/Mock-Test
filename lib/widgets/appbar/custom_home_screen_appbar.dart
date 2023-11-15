import 'package:mock_test_app/utils/constants/imports.dart';

class CustomHomeScreenAppBar extends StatelessWidget {
  const CustomHomeScreenAppBar({super.key, required this.notificationOnPressed, required this.profileOnPressed});
  final VoidCallback notificationOnPressed;
  final VoidCallback profileOnPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: cBlackColor, size: kIconSize20),
      automaticallyImplyLeading: true,
      backgroundColor: cWhiteColor,
      elevation: 0,
      actions: [
        IconButton(
            onPressed: notificationOnPressed,
            icon: const Icon(
              Icons.notifications_active_outlined,
              color: cBlackColor,
              size: kIconSize20,
            )),
        Padding(
          padding: const EdgeInsets.only(
            right: k12Padding,
          ),
          child: CustomRoundedCircleIconButton(
            onPress: profileOnPressed,
            icon: Icons.person,
            containerColor: cBottomNavBarColor,
            size: kIconSize16,
          ),
        ),
      ],
    );
  }
}
