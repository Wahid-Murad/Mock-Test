import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mock_test_app/controllers/auth/auth_controller.dart';
import 'package:mock_test_app/utils/constants/imports.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final AuthController _authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: cWhiteColor,
        body: Obx(
          () => SizedBox(
            width: width,
            height: height - MediaQuery.of(context).padding.top,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(k20Padding).copyWith(bottom: k0Padding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TopRowAndImage(imageLink: loginImage),
                    Text(
                      ksEnterNumber.tr,
                      style: p20MediumTextStyle(cTextPrimaryColor),
                    ),
                    IntlPhoneField(
                      onCountryChanged: (countries) {
                        _authController.countryPhoneNumberLength.value = countries.maxLength;
                        _authController.isPhoneNumberFilled.value = false;
                      },
                      controller: _authController.phoneNumberController,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                      onChanged: (value) {
                        _authController.countryCode.value = value.countryCode;
                        _authController.phoneNumber.value = value.number.toString().trim();
                        if (_authController.phoneNumber.value.length == _authController.countryPhoneNumberLength.value) {
                          _authController.isPhoneNumberFilled.value = true;
                        } else {
                          _authController.isPhoneNumberFilled.value = false;
                        }
                      },
                      decoration: InputDecoration(
                        suffixIcon: _authController.isPhoneNumberFilled.value ? const Icon(Icons.turn_right_outlined) : null,
                      ),
                      initialCountryCode: 'BD',
                    ),
                    kH10sizedBox,
                    CustomElevatedButton(
                      buttonWidth: width - 40,
                      buttonHeight: h40,
                      labelIcon: Icons.arrow_right_alt_outlined,
                      label: ksNext.tr,
                      onPressed: _authController.isPhoneNumberFilled.value
                          ? () {
                              Get.toNamed(krOtpScreen);
                              _authController.phoneNumberController.clear();
                              _authController.isPhoneNumberFilled.value = false;
                            }
                          : null,
                      textStyle: p16MediumTextStyle(cWhiteColor),
                    ),
                    const TermsConditionText(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TermsConditionText extends StatelessWidget {
  const TermsConditionText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: k16Padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              ksByBecomeAMember.tr,
              style: p12MediumTextStyle(cTextSecondaryColor),
            ),
          ),
          Center(
            child: Text(
              ksTermsAndConditions.tr,
              style: p12MediumTextStyle(cTextPrimaryColor),
            ),
          ),
        ],
      ),
    );
  }
}

class TopRowAndImage extends StatelessWidget {
  const TopRowAndImage({super.key, this.imageLink, this.icon, this.backOnPressed});
  final String? imageLink;
  final IconData? icon;
  final VoidCallback? backOnPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: backOnPressed,
              icon: Icon(
                icon,
                size: kIconSize16,
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.light_mode_outlined,
              size: kIconSize24,
            ),
            kW15sizedBox,
            CustomElevatedButton(
              label: ksEn.tr,
              buttonWidth: h40,
              buttonHeight: h28,
              onPressed: () {},
              textStyle: p18RegularTextStyle(cWhiteColor),
            ),
          ],
        ),
        imageLink != null
            ? Image.asset(
                imageLink!,
                height: 250,
              )
            : const SizedBox(),
      ],
    );
  }
}
