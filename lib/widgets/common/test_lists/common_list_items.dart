
import 'package:mock_test_app/utils/constants/imports.dart';

class CustomListItems extends StatelessWidget {
  const CustomListItems(
      {super.key,
      this.backgroundImage,
      required this.itemTitle,
      required this.subTittle1,
      required this.subTittle2,
      this.subTittle3,
      this.priceWidget,
      this.freeOrPaidWidget});
  final ImageProvider<Object>? backgroundImage;
  final String itemTitle;
  final String subTittle1;
  final String subTittle2;
  final String? subTittle3;
  final Widget? priceWidget;
  final Widget? freeOrPaidWidget;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: k8Padding),
      child: Container(
        width: width,
        height: 100,
        decoration: BoxDecoration(
          color: cWhiteColor,
          borderRadius: BorderRadius.circular(k10BorderRadius),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: k20Padding),
          child: Row(
            children: [
              backgroundImage != null
                  ? CircleAvatar(
                      radius: 30,
                      backgroundColor: cBackgroundNeutralColor2,
                      backgroundImage: backgroundImage,
                    )
                  : const SizedBox(),
              backgroundImage != null ? kW30sizedBox : const SizedBox(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  freeOrPaidWidget != null ? freeOrPaidWidget ?? const SizedBox() : const SizedBox(),
                  freeOrPaidWidget != null ? kH5sizedBox : const SizedBox(),
                  Text(
                    itemTitle,
                    style: p16MediumTextStyle(cTextPrimaryColor),
                  ),
                  kH5sizedBox,
                  Row(
                    children: [
                      Text(
                        subTittle1,
                        style: p12RegularTextStyle(cTextSecondaryColor),
                      ),
                      const DotContainer(),
                      Text(
                        subTittle2,
                        style: p12RegularTextStyle(cTextSecondaryColor),
                      ),
                      subTittle3 != null ? const DotContainer() : const SizedBox(),
                      subTittle3 != null
                          ? Text(
                              subTittle3!,
                              style: p12RegularTextStyle(cTextSecondaryColor),
                            )
                          : const SizedBox(),
                      kW5sizedBox,
                      backgroundImage != null ? Image.asset(starImage) : const SizedBox(),
                      kW10sizedBox,
                      priceWidget ?? const SizedBox(),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              CustomRoundedCircleIconButton(
                onPress: () {},
                icon: Icons.arrow_right_alt_outlined,
                iconColor: cIconColor,
                size: kIconSize18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}