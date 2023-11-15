import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:mock_test_app/controllers/schedule_controller.dart';
import 'package:mock_test_app/utils/constants/imports.dart';

class GlobalController extends GetxController {
  //* parent route
  final RxString parentRoute = RxString("");

  //*Bottom Navigation bar index
  RxInt bottomNavBarIndex = RxInt(0);
  final screens = [
    krHomeScreen,
    krTestScreen,
    krScheduleScreen,
    krHomeScreen,
  ];

  //*Test Screen Search
  final RxBool isTestSearching = RxBool(false);
  final TextEditingController testSearchController = TextEditingController();

//*Single Date Picker
  // Future<void> datePicker(BuildContext context) async {
  //   ScheduleController scheduleRewardController = Get.find<ScheduleController>();
  //   DateTime? pickStartDate = await showDatePicker(
  //       context: context, initialDate: scheduleRewardController.selectAppointmentDate.value, firstDate: DateTime.now(), lastDate: DateTime(2101));
  //   if (pickStartDate != null) {
  //     if (scheduleRewardController.selectAppointmentDate.value.isAfter(pickStartDate)) {
  //       // scheduleRewardController.visitTime.value = '';
  //       // hrController.selectedVisitTime.value = DateTime.now();
  //     }
  //     scheduleRewardController.selectAppointmentDate.value = pickStartDate;
  //     scheduleRewardController.appoinmentDate.value = DateFormat('dd MMMM yyyy').format(pickStartDate);
  //   }
  // }

   Future<void> datePicker(BuildContext context) async {
     ScheduleController scheduleController = Get.find<ScheduleController>();
    DateTime? pickStartDate =
        await showDatePicker(context: context, initialDate: scheduleController.selectAppointmentDate.value, firstDate: DateTime.now(), lastDate: DateTime(2101));
    // if (pickStartDate != null) {
    //   hrController.selectedVisitDate.value = pickStartDate;
    //   hrController.visitDate.value = DateFormat.yMMMd().format(pickStartDate);
    // }
    if (pickStartDate != null) {
      if (scheduleController.selectAppointmentDate.value.isAfter(pickStartDate)) {
        scheduleController.appoinmentTime.value = '';
        scheduleController.selectAppointmentTime.value = DateTime.now();
      }
      scheduleController.selectAppointmentDate.value = pickStartDate;
      scheduleController.appoinmentDate.value = DateFormat.yMMMd().format(pickStartDate);
    }
  }


//*Time Picker in flutter

  // void showCupertinoTimePicker() {
  //   final ScheduleController scheduleController = Get.find<ScheduleController>();
  //   DateTime selectedTime = scheduleController.selectAppointmentDate.value;
  //   DateTime currentDate = DateTime.now();

  //   showModalBottomSheet(
  //     context: Get.context!,
  //     builder: (context) {
  //       return Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: <Widget>[
  //           SizedBox(
  //             height: 216,
  //             child: CupertinoDatePicker(
  //               mode: CupertinoDatePickerMode.time,
  //               initialDateTime: selectedTime,
  //               onDateTimeChanged: (value) {
  //                 if (scheduleController.selectAppointmentDate.value.year == currentDate.year &&
  //                     scheduleController.selectAppointmentDate.value.month == currentDate.month &&
  //                     scheduleController.selectAppointmentDate.value.day == currentDate.day) {
  //                   if (value.isBefore(currentDate)) {
  //                     scheduleController.todayTimeInvalidValue.value = true;
  //                   } else {
  //                     selectedTime = value;
  //                     scheduleController.todayTimeInvalidValue.value = false;
  //                   }
  //                 } else {
  //                   selectedTime = value;
  //                   scheduleController.todayTimeInvalidValue.value = false;
  //                 }
  //               },
  //             ),
  //           ),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceAround,
  //             children: <Widget>[
  //               CupertinoButton(
  //                 child: const Text("Cancel"),
  //                 onPressed: () {
  //                   Get.back();
  //                 },
  //               ),
  //               CupertinoButton(
  //                 child: const Text("OK"),
  //                 onPressed: () {
  //                   if (scheduleController.todayTimeInvalidValue.value == true) {
  //                     commonSnackBarShow('Time invalid', 'Please select a valid time');
  //                   } else {
  //                     scheduleController.selectAppointmentTime.value = selectedTime;
  //                     scheduleController.appoinmentTime.value = DateFormat('hh:mm a').format(selectedTime);
  //                     Get.back();
  //                   }
  //                 },
  //               ),
  //             ],
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  void showCupertinoTimePicker() {
    final ScheduleController scheduleController = Get.find<ScheduleController>();
    DateTime selectedTime = scheduleController.selectAppointmentTime.value;
    DateTime currentDate = DateTime.now();

    showModalBottomSheet(
      context: Get.context!,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: 216,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.time,
                initialDateTime: selectedTime,
                onDateTimeChanged: (value) {
                  if (scheduleController.selectAppointmentDate.value.year == currentDate.year &&
                      scheduleController.selectAppointmentDate.value.month == currentDate.month &&
                      scheduleController.selectAppointmentDate.value.day == currentDate.day) {
                    if (value.isBefore(currentDate)) {
                      scheduleController.todayTimeInvalidValue.value = true;
                    } else {
                      selectedTime = value;
                      scheduleController.todayTimeInvalidValue.value = false;
                    }
                  } else {
                    selectedTime = value;
                    scheduleController.todayTimeInvalidValue.value = false;
                  }
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                CupertinoButton(
                  child: const Text("Cancel"),
                  onPressed: () {
                    Get.back();
                  },
                ),
                CupertinoButton(
                  child: const Text("OK"),
                  onPressed: () {
                    if (scheduleController.todayTimeInvalidValue.value == true) {
                      commonSnackBarShow('Time invalid', 'Please select a valid time');
                    } else {
                      scheduleController.selectAppointmentTime.value = selectedTime;
                      scheduleController.appoinmentTime.value = DateFormat('hh:mm a').format(selectedTime);
                      Get.back();
                    }
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  commonSnackBarShow(String? title, String? message) {
    Get.showSnackbar(
      GetSnackBar(
        borderRadius: k10BorderRadius,
        margin: const EdgeInsets.symmetric(horizontal: k12Padding, vertical: k8Padding),
        padding: const EdgeInsets.symmetric(horizontal: k12Padding, vertical: k12Padding),
        title: title,
        message: message,
        duration: const Duration(milliseconds: 1500),
        backgroundColor: cAmberColor,
        snackPosition: SnackPosition.TOP,
      ),
    );
  }
}
