import 'package:mock_test_app/utils/constants/imports.dart';

class PriceWidgetContainer extends StatelessWidget {
  const PriceWidgetContainer({
    super.key,
    required this.price,
    this.isDiscountAvailable = false,
    this.priceWithoutDiscount,
  });
  final String price;
  final String? priceWithoutDiscount;
  final bool isDiscountAvailable;
  @override
  Widget build(BuildContext context) {
    return isDiscountAvailable
        ? Container(
            width: h50,
            height: h16,
            decoration: BoxDecoration(
              color: cGreenColor,
              borderRadius: BorderRadius.circular(k5BorderRadius),
            ),
            child: Stack(
              children: [
                Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: k8Padding),
                        child: Text(
                          priceWithoutDiscount!,
                          style: p10MediumLineThrowTextStyle(cWhiteColor),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: k8Padding),
                        child: Text(
                          price,
                          style: p12MediumTextStyle(cWhiteColor),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 2,
                  child: Text(
                    ksTaka,
                    style: p10RegularTextStyle(cWhiteColor),
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
          )
        : Container(
            width: h32,
            height: h16,
            decoration: BoxDecoration(
              color: cPrimaryShadeColor,
              borderRadius: BorderRadius.circular(k5BorderRadius),
            ),
            child: Stack(
              children: [
                Center(
                  child: Text(
                    price,
                    style: p12MediumTextStyle(cWhiteColor),
                    textAlign: TextAlign.center,
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 2,
                  child: Text(
                    ksTaka,
                    style: p10RegularTextStyle(cWhiteColor),
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
          );
  }
}
