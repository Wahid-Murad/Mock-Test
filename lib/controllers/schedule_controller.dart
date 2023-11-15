import 'package:mock_test_app/utils/constants/imports.dart';

class ScheduleController extends GetxController {
  final Rx<DateTime> selectAppointmentDate = Rx<DateTime>(DateTime.now());
  final RxString appoinmentDate = RxString("");
  final RxBool todayTimeInvalidValue = RxBool(false);
  final Rx<DateTime> selectAppointmentTime = Rx<DateTime>(DateTime.now());
  final RxString appoinmentTime = RxString("");
  final TextEditingController subjectController = TextEditingController();
}
