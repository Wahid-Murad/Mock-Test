import 'package:mock_test_app/utils/constants/imports.dart';

class HomeController extends GetxController {
  //*image Slider
  final RxList slider1ImageList = RxList(slider1ImageLists);
  final RxInt slider1CurrentIndex = RxInt(0);
  final CarouselController slider1carouselController = CarouselController();
  //*popular Mock test
  final RxList popularMockTestList = RxList(popularMockTestLists);
  final RxBool popularMockTestArrowDownButton = RxBool(true);
  //*Gif image slider
  final RxList gifSliderImageList = RxList(gifSliderImageLists);
  final RxInt gifSliderCurrentIndex = RxInt(0);
  final CarouselController gifcarouselController = CarouselController();
  //*MCQ Test
  final RxList mcqTestList = RxList(mcqTestLists);
  final RxBool mcqTestArrowDownButton = RxBool(true);
  //*Audio Book Image List
  final RxList audioBookList = RxList(audioBookLists);

  //  final screens = [
  //   Get.toNamed(krHomeScreen),
  //   Get.toNamed(krLogin),
  //   Get.toNamed(krOtpScreen),
  //   Get.toNamed(krHomeScreen),
  // ];
  // final screens = [
  //   HomeScreen(),
  //   LoginScreen(),
  //   OTPScreen(),
  //   HomeScreen(),
  // ];
}
