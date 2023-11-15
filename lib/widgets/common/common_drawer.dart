import 'package:mock_test_app/utils/constants/imports.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: ListView(
        children: [
          SizedBox(
            height: 100,
            child: DrawerHeader(
              decoration: const BoxDecoration(
                color: cWhiteColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: cBottomNavBarColor,
                    spreadRadius: 0,
                    blurRadius: 5,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: k20Padding),
                    child: Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 2,
                                color: cPrimaryColor,
                              )),
                          child: Image.asset(otpImage),
                        ),
                        kW20sizedBox,
                        Column(
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                'Wahid Murad',
                                style: p16MediumTextStyle(cTextPrimaryColor),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Row(
                                children: [
                                  Text(
                                    ksRating.tr,
                                    style: p12RegularTextStyle(cTextSecondaryColor),
                                  ),
                                  kW5sizedBox,
                                  Image.asset(
                                    starImage,
                                    height: h8,
                                  ),
                                  kW5sizedBox,
                                  Text(
                                    '10',
                                    style: p12RegularTextStyle(cTextSecondaryColor),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.keyboard_arrow_right_outlined,
                          size: kIconSize16,
                          color: cBlackColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // }),
            ),
          ),
          const CustomListTileForDrawer(
            icon: Icons.graphic_eq_outlined,
            title: ksTests,
          ),
          const CustomListTileForDrawer(
            icon: Icons.calendar_month,
            title: ksSchedule,
          ),
          const CustomListTileForDrawer(
            icon: Icons.feed_outlined,
            title: ksReward,
          ),
          const CustomListTileForDrawer(
            icon: Icons.payment,
            title: ksPayment,
          ),
          const CustomListTileForDrawer(
            icon: Icons.settings,
            title: ksSettings,
          ),
          const CustomListTileForDrawer(
            icon: Icons.feedback_rounded,
            title: ksFAQ,
          ),
          const CustomListTileForDrawer(
            icon: Icons.message_outlined,
            title: ksSupport,
          ),
          CustomElevatedButton(
            label: ksLogOut.tr,
            onPressed: () {
              logout(context);
            },
            buttonWidth: width * 0.5,
            buttonHeight: h40,
            labelIcon: Icons.logout,
            buttonColor: cRedAccentColor,
            textStyle: p16MediumTextStyle(cWhiteColor),
          ),
        ],
      ),
    );
  }
}

class CustomListTileForDrawer extends StatelessWidget {
  const CustomListTileForDrawer({super.key, required this.icon, required this.title});
  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: p14RegularTextStyle(cTextPrimaryColor),
      ),
    );
  }
}

void logout(BuildContext context) {
  showAlertDialog(
    context: context,
    child: CommonAlertDialog(
      title: ksConfirmation.tr,
      addContent: Padding(
        padding: const EdgeInsets.symmetric(vertical: k5Padding),
        child: Text(
          ksAreYouSureYouWantToLogout.tr,
          textAlign: TextAlign.center,
          style: p14MediumTextStyle(cTextPrimaryColor),
        ),
      ),
      actions: [
        CustomElevatedButton(
          buttonWidth: width * .5,
          buttonHeight: h40,
          label: ksLogOut.tr,
          buttonColor: cRedAccentColor,
          onPressed: () async {
            //*Logout Api Call Here
          },
        ),
        kH10sizedBox,
      ],
      hasCloseBtn: true,
      onClose: () => Get.back(),
    ),
  );
}
