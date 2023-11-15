import 'package:mock_test_app/utils/constants/imports.dart';

class CustomElevatedButton extends StatelessWidget {
  final String label;
  final GestureTapCallback? onPressed;
  final double? buttonWidth;
  final double? buttonHeight;
  final Color? buttonColor, borderColor;
  final bool isButtonInPopUp, isCircularHead, autoFocus, isPadding;
  final IconData? labelIcon;
  final TextStyle? textStyle;
  final Color? labelIconColor;
  final TextAlign? labelAlign;
  final bool? isLabelCentered;

  const CustomElevatedButton(
      {Key? key,
      this.buttonColor = cPrimaryColor,
      this.borderColor,
      required this.label,
      required this.onPressed,
      this.buttonWidth,
      this.labelIcon,
      this.buttonHeight,
      this.isCircularHead = true,
      this.isButtonInPopUp = true,
      this.autoFocus = false,
      this.isPadding = false,
      this.textStyle,
      this.labelIconColor,
      this.labelAlign,
      this.isLabelCentered = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            padding: MaterialStateProperty.all(EdgeInsets.zero),
            minimumSize: MaterialStateProperty.all(Size.zero),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: isCircularHead ? BorderRadius.circular(kButtonBorderRadius) : BorderRadius.circular(k10BorderRadius),
              side: BorderSide(color: (buttonColor == cWhiteColor) ? (borderColor ?? cPrimaryColor) : cTransparentColor, width: 1),
            )),
            backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return cIconColor.withOpacity(.5);
              }
              return buttonColor!;
            }),
            splashFactory: InkRipple.splashFactory,
          ),
          child: SizedBox(
            height: buttonHeight ?? (height > kSmallDeviceSizeLimit ? (kButtonHeight - 1) : (kButtonHeight - 6)),
            width: buttonWidth ?? width * .5,
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: isPadding ? k5Padding : k0Padding),
                child: Row(
                  mainAxisAlignment: labelIcon != null ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
                  children: [
                    if (labelIcon != null && isLabelCentered == true) kW20sizedBox,
                    Padding(
                      padding: isLabelCentered == false ? const EdgeInsets.only(left: k20Padding) : const EdgeInsets.only(left: k0Padding),
                      child: Text(
                        label,
                        textAlign: labelAlign ?? TextAlign.center,
                        style: textStyle ??
                            MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
                              if (states.contains(MaterialState.disabled)) {
                                return p16MediumTextStyle(cTextSecondaryColor);
                              }
                              return p16MediumTextStyle(cWhiteColor);
                            }),
                      ),
                    ),
                    if (labelIcon != null)
                      Padding(
                        padding: const EdgeInsets.only(right: k20Padding),
                        child: Icon(
                          labelIcon!,
                          color: labelIconColor ?? cWhiteColor,
                          size: screenWiseSize(kIconSize24, 4),
                        ),
                      )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
