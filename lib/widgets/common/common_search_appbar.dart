import 'package:mock_test_app/controllers/common_controller/global_controller.dart';
import 'package:mock_test_app/utils/constants/imports.dart';
import 'package:mock_test_app/widgets/common/common_circular_icon_button.dart';

class CustomSearchAppBar extends StatelessWidget {
  CustomSearchAppBar(
      {super.key,
      required this.title,
      required this.onChanged,
      required this.closeIconOnPressed,
      required this.searchBackButtonOnPressed,
      required this.filterButtonOnPressed});
  final String title;
  final GlobalController _globalController = Get.find<GlobalController>();
  final Function(String) onChanged;
  final VoidCallback closeIconOnPressed;
  final VoidCallback searchBackButtonOnPressed;
  final VoidCallback filterButtonOnPressed;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => _globalController.isTestSearching.value ? buildSearchAppBar() : buildInitialAppBar(),
    );
  }

  Widget buildInitialAppBar() {
    return AppBar(
      backgroundColor: cWhiteColor,
      elevation: 0,
      leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: cBlackColor,
            size: kIconSize16,
          )),
      centerTitle: true,
      title: Text(
        title,
        style: p16MediumTextStyle(cTextPrimaryColor),
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.search,
            size: kIconSize16,
            color: cBlackColor,
          ),
          onPressed: () {
            _globalController.isTestSearching.value = true;
            _globalController.testSearchController.clear();
          },
        ),
      ],
    );
  }

  Widget buildSearchAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kAppBarSize),
      child: AppBar(
        titleSpacing: 0.0,
        leading: IconButton(
          constraints: const BoxConstraints(),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: cBlackColor,
            size: kIconSize16,
          ),
          onPressed: searchBackButtonOnPressed,
        ),
        backgroundColor: cWhiteColor,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(bottom: k16Padding),
          child: SizedBox(
            width: width,
            child: TextField(
              controller: _globalController.testSearchController,
              decoration: InputDecoration(
                suffixIconConstraints: const BoxConstraints(),
                prefixIconConstraints: const BoxConstraints(),
                suffixIcon: const Padding(
                  padding: EdgeInsets.only(top: k20Padding, bottom: k8Padding, left: k0Padding),
                  child: CustomCircularIconButton(
                    containerWidth: h16,
                    containerHeight: h16,
                    icon: Icons.close,
                    containerColor: cGreyColor,
                    iconColor: cWhiteColor,
                    iconSize: kIconSize12,
                  ),
                ),
                hintText: ksSearchHere.tr,
                contentPadding: const EdgeInsets.only(top: k20Padding, bottom: k8Padding, left: k0Padding),
              ),
              onChanged: onChanged,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.filter_list,
              color: cBlackColor,
              size: kIconSize20,
            ),
            onPressed: filterButtonOnPressed,
          ),
        ],
      ),
    );
  }
}
