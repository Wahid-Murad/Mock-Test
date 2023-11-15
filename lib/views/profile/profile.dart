import 'package:mock_test_app/utils/constants/imports.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: cWhiteColor,
        body: SizedBox(
          width: width,
          height: height - MediaQuery.of(context).padding.top,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: k10Padding, left: k20Padding, right: k20Padding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TopRowAndImage(
                      icon: Icons.arrow_back_ios,
                      backOnPressed: () {
                        Get.back();
                      }),
                  Stack(
                    children: [
                      Center(
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: cBackgroundNeutralColor2,
                            shape: BoxShape.circle,
                            border: Border.all(width: 1, color: cBlackColor),
                          ),
                          child: Image.asset(otpImage),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        left: 65,
                        child: Container(
                          width: h24,
                          height: h24,
                          decoration: const BoxDecoration(
                            color: cGreenColor,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.camera_alt_outlined,
                            color: cWhiteColor,
                            size: kIconSize12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  kH20sizedBox,
                  Text(
                    ksProfileSetup,
                    style: p18MediumTextStyle(cTextPrimaryColor),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
