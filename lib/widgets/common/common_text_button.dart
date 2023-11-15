import 'package:mock_test_app/utils/constants/imports.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    required this.onPressed,
    required this.text,
    required this.textStyle,
    this.isIconExits,
    Key? key,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final String text;
  final TextStyle textStyle;
  final bool? isIconExits;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text.toString(),
              style: textStyle,
            ),
            if (isIconExits != null) kW5sizedBox,
            if (isIconExits != null)
              const Icon(
                Icons.arrow_right_alt_outlined,
                size: kIconSize14,
                color: cPrimaryColor,
              )
          ],
        ),
      ),
    );
  }
}
