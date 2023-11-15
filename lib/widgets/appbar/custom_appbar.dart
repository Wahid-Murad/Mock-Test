import 'package:mock_test_app/utils/constants/imports.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    this.title,
    this.action,
    this.hasBackButton = true,
    required this.onBack,
    this.icon,
    required this.onPressed,
  }) : super(key: key);

  final dynamic title;
  final List<Widget>? action;
  final Function()? onBack;
  final bool hasBackButton;
  final IconData? icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: kCommonElevation,
      backgroundColor: cWhiteColor,
      // leadingWidth: kCommonBackSpace + k20Padding,
      centerTitle: true,
      title: title == null
          ? null
          : (title is String)
              ? Text(
                  title,
                  style: p16MediumTextStyle(cTextPrimaryColor),
                )
              : title,
      leading: hasBackButton
          ? IconButton(
              // constraints: const BoxConstraints(),
              onPressed: onPressed,
              icon: Icon(
                icon,
                size: kIconSize16,
                color: cBlackColor,
              ))
          : null,
      actions: action,
    );
  }
}
