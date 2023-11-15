import 'package:mock_test_app/utils/constants/imports.dart';

class AuthController extends GetxController {
  final TextEditingController phoneNumberController = TextEditingController();
  final RxString phoneNumber = RxString('');
  final RxInt countryPhoneNumberLength = RxInt(10);
  final RxBool isPhoneNumberFilled = RxBool(false);
  final RxString countryCode = RxString('');

  //!Otp verification
  final TextEditingController otpTextEditingController = TextEditingController();
  final RxBool isOTPResendClick = RxBool(false);
  final RxBool canOTPVerifyNow = RxBool(false);

  void resetOTPScreen() {
    otpTextEditingController.clear();
    isOTPResendClick.value = false;
    canOTPVerifyNow.value = false;
  }

  void checkCanOTPVerifyNow() {
    if (otpTextEditingController.text.length == kOTPLength) {
      canOTPVerifyNow.value = true;
    } else {
      canOTPVerifyNow.value = false;
    }
  }
}
