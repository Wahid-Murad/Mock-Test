import 'package:mock_test_app/utils/constants/imports.dart';

class CustomCircularIconButton extends StatelessWidget {
  const CustomCircularIconButton({super.key, this.containerWidth, this.containerHeight, this.containerColor, required this.icon, this.iconSize, this.iconColor, this.onPressed});
 final double ? containerWidth;
 final double ? containerHeight;
 final Color ? containerColor;
 final IconData icon;
 final double ? iconSize;
 final Color? iconColor;
 final VoidCallback ? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: containerWidth,
        height: containerHeight,
        decoration: BoxDecoration(
          color: containerColor,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: iconSize?? kIconSize16,
          color: iconColor,
        ),
      ),
    );
  }
}