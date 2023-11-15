import 'package:mock_test_app/controllers/home_controller.dart';
import 'package:mock_test_app/utils/constants/imports.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final HomeController _homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: CustomBottomNavigationBar(),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kHomeAppBarSize),
          child: CustomHomeScreenAppBar(
            notificationOnPressed: () {},
            profileOnPressed: () {
              Get.toNamed(krProfile);
            },
          ),
        ),
        drawer: const CustomDrawer(),
        body: Obx(() => SizedBox(
              width: width,
              height: height - (MediaQuery.of(context).padding.top + kAppBarSize),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(k20Padding).copyWith(bottom: k0Padding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomImageSlider(
                        sliderImageList: _homeController.slider1ImageList,
                        carouselController: _homeController.slider1carouselController,
                        currentIndex: _homeController.slider1CurrentIndex,
                      ),
                      kH15sizedBox,
                      Container(
                        width: width,
                        height: 210,
                        decoration: BoxDecoration(
                          color: cWhiteColor,
                          borderRadius: BorderRadius.circular(k10BorderRadius),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: k20Padding, horizontal: k16Padding),
                          child: Wrap(
                            alignment: WrapAlignment.start,
                            spacing: k25Padding,
                            runSpacing: k25Padding,
                            children: [
                              HomePageContainers(
                                containerColor: cRedOrangeColor,
                                icon: Icons.speaker,
                                text: ksMockTest,
                              ),
                              HomePageContainers(
                                containerColor: cGreenColor,
                                icon: Icons.radio_button_checked_outlined,
                                text: ksMcq,
                              ),
                              HomePageContainers(
                                containerColor: cSlateBlueColor,
                                icon: Icons.task_rounded,
                                text: ksWritting,
                              ),
                              HomePageContainers(
                                containerColor: cPrimaryShadeColor,
                                icon: Icons.add_task,
                                text: ksBook,
                              ),
                              HomePageContainers(
                                containerColor: cRadicalRedColor,
                                icon: Icons.speaker_notes,
                                text: ksNotes,
                              ),
                              HomePageContainers(
                                containerColor: cMediumShadeOrangeColor,
                                icon: Icons.tips_and_updates,
                                text: ksTips,
                              ),
                            ],
                          ),
                        ),
                      ),
                      kH20sizedBox,
                      CustomListViewTopRow(
                        title: ksPopularMockTest,
                        viewAllOnPressed: () {},
                      ),
                      kH20sizedBox,
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _homeController.popularMockTestArrowDownButton.value ? 5 : _homeController.popularMockTestList.length,
                        itemBuilder: (context, index) {
                          var item = _homeController.popularMockTestList[index];
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
                                  priceWidget: PriceWidgetContainer(
                                    price: item['price'],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      _homeController.popularMockTestArrowDownButton.value
                          ? IconButton(
                              padding: const EdgeInsets.only(top: k0Padding, bottom: k0Padding),
                              constraints: const BoxConstraints(),
                              onPressed: () {
                                _homeController.popularMockTestArrowDownButton.value = false;
                              },
                              icon: _homeController.popularMockTestList.length == _homeController.popularMockTestList.length
                                  ? const Icon(Icons.keyboard_arrow_down_outlined)
                                  : const SizedBox(),
                            )
                          : const SizedBox(),
                      kH15sizedBox,
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          ksOurMission,
                          style: p16MediumTextStyle(cTextPrimaryColor),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      kH20sizedBox,
                      CustomImageSlider(
                        sliderImageList: _homeController.gifSliderImageList,
                        carouselController: _homeController.gifcarouselController,
                        currentIndex: _homeController.gifSliderCurrentIndex,
                      ),
                      kH20sizedBox,
                      CustomListViewTopRow(
                        title: ksMcqTest,
                        viewAllOnPressed: () {},
                      ),
                      kH20sizedBox,
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _homeController.mcqTestArrowDownButton.value ? 5 : _homeController.mcqTestList.length,
                        itemBuilder: (context, index) {
                          var item = _homeController.mcqTestList[index];
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
                    
                      _homeController.mcqTestArrowDownButton.value
                          ? IconButton(
                              padding: const EdgeInsets.only(top: k0Padding, bottom: k0Padding),
                              constraints: const BoxConstraints(),
                              onPressed: () {
                                _homeController.mcqTestArrowDownButton.value = false;
                              },
                              icon: _homeController.popularMockTestList.length == _homeController.popularMockTestList.length
                                  ? const Icon(Icons.keyboard_arrow_down_outlined)
                                  : const SizedBox(),
                            )
                          : const SizedBox(),
                      kH20sizedBox,
                      CustomListViewTopRow(
                        title: ksAudioBook,
                        viewAllOnPressed: () {},
                      ),
                      //*Audio Book image
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for (int index = 0; index < _homeController.audioBookList.length; index++)
                              Image.asset(
                                _homeController.audioBookList[index]['audio_book_image'],
                                width: 120,
                                height: 140,
                              ),
                          ],
                        ),
                      ),
                      kH10sizedBox,
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}

class DotContainer extends StatelessWidget {
  const DotContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 4,
      height: 4,
      margin: const EdgeInsets.symmetric(horizontal: k5Padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(k10BorderRadius),
        color: cGreenColor,
      ),
    );
  }
}

class HomePageContainers extends StatelessWidget {
  const HomePageContainers({super.key, required this.containerColor, required this.text, required this.icon});
  final Color containerColor;
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: containerColor,
            borderRadius: BorderRadius.circular(90),
          ),
          child: Icon(
            icon,
            color: cWhiteColor,
            size: kIconSize24,
          ),
        ),
        kH8sizedBox,
        Text(
          text,
          style: p12RegularTextStyle(cTextPrimaryColor),
        ),
      ],
    );
  }
}
