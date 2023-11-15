import 'package:mock_test_app/utils/constants/imports.dart';

class CustomImageSlider extends StatelessWidget {
  const CustomImageSlider({super.key, required this.sliderImageList, required this.carouselController, required this.currentIndex});
  final List sliderImageList;
  final CarouselController carouselController;
  final RxInt currentIndex;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {},
          child: CarouselSlider(
            items: sliderImageList.map((element) => Image.asset(element['image'])).toList(),
            carouselController: carouselController,
            options: CarouselOptions(
                scrollPhysics: const BouncingScrollPhysics(),
                autoPlay: true,
                aspectRatio: 2,
                disableCenter: true,
                viewportFraction: 1,
                enlargeCenterPage: false,
                onPageChanged: (index, reason) {
                  currentIndex.value = index;
                }),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: sliderImageList.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => carouselController.animateToPage(entry.key),
                  child: Container(
                    width: 8,
                    height: 8,
                    margin: const EdgeInsets.symmetric(horizontal: k5Padding),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(k10BorderRadius),
                      color: currentIndex.value == entry.key ? cPrimaryColor : cBackgroundNeutralColor2,
                    ),
                  ),
                );
              }).toList())),
        ),
      ],
    );
  }
}
