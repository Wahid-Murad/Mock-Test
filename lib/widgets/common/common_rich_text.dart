import 'package:mock_test_app/utils/constants/imports.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText({super.key, required this.defaultText, required this.richText, required this.defaultTextStyle, required this.richTextStyle});
  final String defaultText;
  final String richText;
  final TextStyle defaultTextStyle;
  final TextStyle richTextStyle;
  @override
  Widget build(BuildContext context) {
    return RichText(
                text: TextSpan(
                  style: defaultTextStyle,
                  children: [
                    TextSpan(
                      text: defaultText,
                    ),
                     TextSpan(
                      text: richText,
                       style: richTextStyle,
                    ),
                  ],
                ),
              );
  }
}