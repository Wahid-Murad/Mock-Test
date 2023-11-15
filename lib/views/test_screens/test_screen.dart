import 'package:mock_test_app/controllers/common_controller/global_controller.dart';
import 'package:mock_test_app/controllers/mock_test_controller.dart';
import 'package:mock_test_app/utils/constants/imports.dart';

class TestScreen extends StatelessWidget {
  TestScreen({super.key});
  final GlobalController _globalController = Get.find<GlobalController>();
  final MockTestController _mockTestController = Get.find<MockTestController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhiteColor,
      //*AppBar
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kAppBarSize),
        child: CustomSearchAppBar(
          searchBackButtonOnPressed: () {
            _globalController.isTestSearching.value = false;
          },
          title: ksTest,
          onChanged: (value) {},
          closeIconOnPressed: () {},
          filterButtonOnPressed: () {},
        ),
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
                  Image.asset(
                    mockTestImage,
                    width: width,
                    height: 150,
                  ),
                  kH20sizedBox,
                  CustomListViewTopRow(
                      title: ksMockTest,
                      viewAllOnPressed: () {
                        Get.toNamed(krMockTestScreen);
                      }),
                  kH10sizedBox,
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _mockTestController.mockTestArrowDownButton.value ? 5 : _mockTestController.mockTestList.length,
                    itemBuilder: (context, index) {
                      var item = _mockTestController.mockTestList[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: k5Padding),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(k10BorderRadius),
                          child: TextButton(
                            style: kTextButtonStyle,
                            onPressed: () async {
                              // ll(index);
                             
                            },
                            child: CustomListItems(
                              backgroundImage: AssetImage(item['image']),
                              itemTitle: item['title'],
                              subTittle1: item['examTime'],
                              subTittle2: item['rating'],
                              priceWidget: PriceWidgetContainer(price: item['price'], isDiscountAvailable: true, priceWithoutDiscount: ks990Tk),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  _mockTestController.mockTestArrowDownButton.value
                      ? IconButton(
                          padding: const EdgeInsets.only(top: k0Padding, bottom: k0Padding),
                          constraints: const BoxConstraints(),
                          onPressed: () {
                            _mockTestController.mockTestArrowDownButton.value = false;
                          },
                          icon: _mockTestController.mockTestList.length == _mockTestController.mockTestList.length
                              ? const Icon(Icons.keyboard_arrow_down_outlined)
                              : const SizedBox(),
                        )
                      : const SizedBox(),
                  kH20sizedBox,
                  CustomListViewTopRow(
                    title: ksMcqTest,
                    viewAllOnPressed: () {},
                  ),
                  kH10sizedBox,
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _mockTestController.mcqTestArrowDownButton.value ? 5 : _mockTestController.mcqTestList.length,
                    itemBuilder: (context, index) {
                      var item = _mockTestController.mcqTestList[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: k5Padding),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(k10BorderRadius),
                          child: TextButton(
                            style: kTextButtonStyle,
                            onPressed: () async {},
                            child: CustomListItems(
                              freeOrPaidWidget: CustomElevatedButton(
                                label: item['examType'],
                                onPressed: () {},
                                buttonColor: item['examType'].toString() == "Free" ? cGreenColor : cRedOrangeColor,
                                buttonWidth: h32,
                                buttonHeight: h20,
                                textStyle: p12MediumTextStyle(cWhiteColor),
                              ),
                              itemTitle: item['title'],
                              subTittle1: item['examMarks'],
                              subTittle2: item['examTime'],
                              subTittle3: item['examQuestionNumber'],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  _mockTestController.mcqTestArrowDownButton.value
                      ? IconButton(
                          padding: const EdgeInsets.only(top: k0Padding, bottom: k0Padding),
                          constraints: const BoxConstraints(),
                          onPressed: () {
                            _mockTestController.mcqTestArrowDownButton.value = false;
                          },
                          icon: _mockTestController.mcqTestList.length == _mockTestController.mcqTestList.length
                              ? const Icon(Icons.keyboard_arrow_down_outlined)
                              : const SizedBox(),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
