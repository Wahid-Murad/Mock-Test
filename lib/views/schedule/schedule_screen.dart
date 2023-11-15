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
          child: Padding(
            padding: const EdgeInsets.all(k20Padding).copyWith(bottom: k0Padding),
            child: Column(
              children: [
                Column(
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                      ],
                    )
                  ],
                ),
              ],
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
          buttonHeight: 35,
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
