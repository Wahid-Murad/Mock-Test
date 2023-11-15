import 'package:mock_test_app/controllers/common_controller/global_controller.dart';
import 'package:mock_test_app/controllers/schedule_controller.dart';
import 'package:mock_test_app/utils/constants/imports.dart';
import 'package:mock_test_app/widgets/common/common_textfield.dart';

class ScheduleScreen extends StatelessWidget {
  ScheduleScreen({super.key});
  final GlobalController globalController = Get.find<GlobalController>();
  final ScheduleController scheduleController = Get.find<ScheduleController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhiteColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kAppBarSize),
        child: CustomAppBar(
            title: ksSchedule,
            hasBackButton: true,
            icon: Icons.arrow_back_ios,
            onPressed: () {
              Get.back();
            },
            onBack: () {
              Get.back();
            }),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: Obx(
        () => SizedBox(
          width: width,
          height: height - (MediaQuery.of(context).padding.top + kAppBarSize),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(k20Padding).copyWith(bottom: k0Padding),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppoinmentDateDateTimeElevatedButton(
                        title: ksAppointmentDate.tr,
                        labelValue: scheduleController.appoinmentDate.value == '' ? ksSelectDate.tr : scheduleController.appoinmentDate.value,
                        labelStyle:
                            scheduleController.appoinmentDate.value == '' ? p12RegularTextStyle(cTextSecondaryColor) : p14MediumTextStyle(cTextPrimaryColor),
                        icon: Icons.date_range_outlined,
                        onPressed: () {
                          FocusManager.instance.primaryFocus!.unfocus();
                          globalController.datePicker(context);
                        },
                      ),
                      kH20sizedBox,
                      AppoinmentDateDateTimeElevatedButton(
                        title: ksAppointmentTime.tr,
                        labelValue: scheduleController.appoinmentTime.value == '' ? ksSelectTime.tr : scheduleController.appoinmentTime.value,
                        labelStyle:
                            scheduleController.appoinmentTime.value == '' ? p12RegularTextStyle(cTextSecondaryColor) : p14MediumTextStyle(cTextPrimaryColor),
                        icon: Icons.schedule,
                        onPressed: () {
                          FocusManager.instance.primaryFocus!.unfocus();
                          globalController.showCupertinoTimePicker();
                        },
                      ),
                      kH20sizedBox,
                      Text(
                        ksSubject.tr,
                        style: p16MediumTextStyle(cTextPrimaryColor),
                      ),
                      kH10sizedBox,
                      CustomModifiedTextField(
                        readOnly: true,
                        controller: scheduleController.subjectController,
                        hint: "45th BCS Mock Test", //*data from previous test page
                      ),
                      kH20sizedBox,
                      Text(
                        ksName.tr,
                        style: p16MediumTextStyle(cTextPrimaryColor),
                      ),
                      kH10sizedBox,
                      CustomModifiedTextField(
                        readOnly: scheduleController.isNameEditIconClicked.value ? false : true,
                        controller: scheduleController.nameController,
                        hint: "Wahid Murad", //*data from api
                        suffixIcon: Icons.edit,
                        onSuffixPress: () {
                          scheduleController.isNameEditIconClicked.value = true;
                          scheduleController.nameController.text = "Wahid Murad";
                        },
                      ),
                      kH20sizedBox,
                      Text(
                        ksPhoneOrEmail.tr,
                        style: p16MediumTextStyle(cTextPrimaryColor),
                      ),
                      kH10sizedBox,
                      CustomModifiedTextField(
                        controller: scheduleController.phoneEmailController,
                        hint: "01766098919", //*data from user/api
                      ),
                      kH20sizedBox,
                      Text(
                        ksCvOrResume.tr,
                        style: p16MediumTextStyle(cTextPrimaryColor),
                      ),
                      Row(
                        children: [
                          Checkbox(
                              value: scheduleController.isCheckBoxChecked.value,
                              checkColor: cBlueTintColor,
                              onChanged: (v) {
                                scheduleController.isCheckBoxChecked.value = !scheduleController.isCheckBoxChecked.value;
                              }),
                          Expanded(
                            child: Text(
                              ksByBecomeAMember.tr + ksTermsAndConditions.tr,
                              overflow: TextOverflow.clip,
                              style: p16MediumTextStyle(cTextSecondaryColor),
                            ),
                          ),
                        ],
                      ),
                      kH20sizedBox,
                      CustomElevatedButton(buttonWidth: width - 40, buttonHeight: 36, label: ksNext.tr, onPressed: () {}),
                      kH20sizedBox,
                    ],
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

class AppoinmentDateDateTimeElevatedButton extends StatelessWidget {
  const AppoinmentDateDateTimeElevatedButton(
      {super.key, required this.title, required this.labelValue, required this.labelStyle, required this.icon, required this.onPressed});
  final String title;
  final String labelValue;
  final TextStyle labelStyle;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: p16MediumTextStyle(cTextPrimaryColor),
        ),
        kH10sizedBox,
        CustomElevatedButton(
          buttonWidth: width - 40,
          buttonHeight: 36,
          buttonColor: cOutLineColor,
          borderColor: cBlackColor,
          label: labelValue,
          textStyle: labelStyle,
          labelIcon: icon,
          onPressed: onPressed,
          labelIconColor: cBlackColor,
          isCircularHead: false,
          labelAlign: TextAlign.left,
          isLabelCentered: false,
        ),
      ],
    );
  }
}
