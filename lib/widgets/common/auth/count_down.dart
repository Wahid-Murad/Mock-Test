import 'package:mock_test_app/utils/constants/imports.dart';
import 'package:mock_test_app/widgets/common/auth/auth_linkup_textrow.dart';

class CountDown extends StatelessWidget {
  const CountDown({
    Key? key,
    required this.onEnd,
    required this.seconds,
  }) : super(key: key);

  final VoidCallback? onEnd;
  final int seconds;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<Duration>(
      duration: Duration(seconds: seconds),
      tween: Tween(begin: Duration(seconds: seconds), end: Duration.zero),
      onEnd: onEnd,
      builder: (BuildContext context, Duration value, Widget? child) {
        final minutes = value.inMinutes;
        final seconds = value.inSeconds % 60;
        return LinkupTextRow(
          prefix: ksDontRecieveCode.tr,
          suffix: '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
          prefixStyle: p16MediumTextStyle(cTextSecondaryColor),
          suffixStyle: p16MediumTextStyle(cTextSecondaryColor),
          onPressed: null,
        );
      },
    );
  }
}
