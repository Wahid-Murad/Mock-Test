import 'package:mock_test_app/utils/constants/imports.dart';

class LinkupTextRow extends StatelessWidget {
  const LinkupTextRow({
    Key? key,
    required this.prefix,
    required this.suffix,
    required this.onPressed,
    this.onPrefixPressed,
    this.prefixStyle,
    this.suffixStyle,
  }) : super(key: key);

  final String prefix;
  final String suffix;
  final Function()? onPressed;
  final Function()? onPrefixPressed;
  final TextStyle? prefixStyle, suffixStyle;
  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: suffix == ksResendCode
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  style: kTextButtonStyle,
                  onPressed: onPrefixPressed,
                  child: Text(
                    prefix + ' ',
                    textAlign: TextAlign.center,
                    style: prefixStyle ?? p16MediumTextStyle(cTextSecondaryColor),
                  ),
                ),
                InkWell(
                  onTap: onPressed,
                  child: Text(
                    suffix,
                    textAlign: TextAlign.center,
                    style: suffixStyle ?? p16MediumTextStyle(cPrimaryColor),
                  ),
                ),
              ],
            )
          : Column(
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  style: kTextButtonStyle,
                  onPressed: onPrefixPressed,
                  child: Text(
                    '$prefix ',
                    textAlign: TextAlign.center,
                    style: prefixStyle ?? p16MediumTextStyle(cTextSecondaryColor),
                  ),
                ),
                InkWell(
                  onTap: onPressed,
                  child: Text(
                    suffix,
                    textAlign: TextAlign.center,
                    style: suffixStyle ?? p16MediumTextStyle(cPrimaryColor),
                  ),
                ),
              ],
            ),
    );
  }
}
