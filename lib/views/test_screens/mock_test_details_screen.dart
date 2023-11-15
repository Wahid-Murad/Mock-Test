import 'package:mock_test_app/controllers/mock_test_controller.dart';
import 'package:mock_test_app/utils/constants/imports.dart';

class MockTestDetailsScreen extends StatelessWidget {
  MockTestDetailsScreen({super.key});
  final MockTestController _mockTestController = Get.find<MockTestController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhiteColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kAppBarSize),
        child: CustomAppBar(
            title: _mockTestController.popularMockTestMap['title'],
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
      body: SingleChildScrollView(
        child: SizedBox(
          width: width,
          child: Padding(
            padding: const EdgeInsets.all(k20Padding).copyWith(bottom: k0Padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(bcsImage),
                Text(
                  'আপনি যদি BCS পরীক্ষার ভাইভা জন্য সর্বোত্তম প্রস্তুতি নিতে এবং কাঙ্খিত স্কোর অর্জন করতে আগ্রহী হন, আমরা আপনাকে আমাদের 45th BCS Mock Test দিতে উৎসাহিত করছি!',
                  style: p12MediumTextStyle(cTextPrimaryColor),
                ),
                kH10sizedBox,
                Text(
                  _mockTestController.popularMockTestMap['title'] + '-এ যা যা থাকছে:-',
                  style: p14MediumTextStyle(cTextPrimaryColor),
                ),
                kH15sizedBox,
                for (int index = 0; index < _mockTestController.mockTestCourseFeature.length; index++)
                  Padding(
                    padding: const EdgeInsets.only(bottom: k5Padding),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.verified,
                          size: kIconSize14,
                          color: cGreenColor,
                        ),
                        kW15sizedBox,
                        Text(
                          _mockTestController.mockTestCourseFeature[index]['features'],
                          style: p12RegularTextStyle(cTextPrimaryColor),
                        ),
                      ],
                    ),
                  ),
                kH20sizedBox,
                CustomElevatedButton(
                  label: 'মূল্য:- ৯৯০$ksTaka',
                  onPressed: () {
                    Get.toNamed(krScheduleScreen);
                  },
                  buttonColor: cPrimaryShadeColor,
                ),
                kH30sizedBox,
                Text(
                  'শিক্ষক সমূহ:-',
                  style: p14MediumTextStyle(cTextPrimaryColor),
                ),
                kH10sizedBox,
                SizedBox(
                  height: 60,
                  child: ListView.builder(
                    // shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: _mockTestController.mockTestTeacherList.length,
                    itemBuilder: (context, index) {
                      var item = _mockTestController.mockTestTeacherList[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: k5Padding),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(k10BorderRadius),
                          child: TextButton(
                            style: kTextButtonStyle,
                            onPressed: () async {
                              // ll(index);
                            },
                            child: SizedBox(
                              width: width * 0.6,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: const BoxDecoration(shape: BoxShape.circle, color: cGreyColor),
                                    child: Image.asset(item['teacher_image']),
                                  ),
                                  kW5sizedBox,
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                item['teacher_name'],
                                                style: p12MediumTextStyle(cTextPrimaryColor),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                item['teacher_title'],
                                                style: p12RegularTextStyle(cTextSecondaryColor),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                item['teacher_designation'],
                                                style: p12RegularTextStyle(cTextSecondaryColor),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                kH30sizedBox,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
