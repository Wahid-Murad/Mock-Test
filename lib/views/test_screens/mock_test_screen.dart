import 'package:mock_test_app/controllers/common_controller/global_controller.dart';
import 'package:mock_test_app/controllers/mock_test_controller.dart';
import 'package:mock_test_app/utils/constants/imports.dart';

class MockTestScreen extends StatelessWidget {
  MockTestScreen({super.key});
  final GlobalController _globalController = Get.find<GlobalController>();
  final MockTestController _mockTestController = Get.find<MockTestController>();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: cWhiteColor,
        //*AppBar
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kAppBarSize),
          child: CustomSearchAppBar(
            searchBackButtonOnPressed: () {
              _globalController.isTestSearching.value = false;
            },
            title: ksMockTest,
            onChanged: (value) {},
            closeIconOnPressed: () {
              _globalController.testSearchController.clear();
            },
            filterButtonOnPressed: () {},
          ),
        ),
        bottomNavigationBar: CustomBottomNavigationBar(),
        body: Column(
          children: [
            TabBar(
              // unselectedLabelStyle: p12RegularTextStyle(cTextSecondaryColor),
              indicatorColor: cBlackColor,
              unselectedLabelColor: cGreyColor,
              tabs: [
                Tab(
                  child: Text(
                    ksPopular,
                    style: p16RegularTextStyle(cTextPrimaryColor),
                  ),
                ),
                Tab(
                  child: Text(
                    ksGovt,
                    style: p16RegularTextStyle(cTextPrimaryColor),
                  ),
                ),
                Tab(
                  child: Text(
                    ksPrivate,
                    style: p16RegularTextStyle(cTextPrimaryColor),
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(physics: const AlwaysScrollableScrollPhysics(), children: [
                //*Popular Test List in tabbar
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: _mockTestController.popularMockTestList.length,
                  itemBuilder: (context, index) {
                    var item = _mockTestController.popularMockTestList[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: k5Padding),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(k10BorderRadius),
                        child: TextButton(
                          style: kTextButtonStyle,
                          onPressed: () async {
                            // ll(index);
                            _mockTestController.popularMockTestDetailsMapData(index);
                            Get.toNamed(krMockTestDetailsScreen);
                          },
                          child: CustomListItems(
                              backgroundImage: AssetImage(item['image']),
                              itemTitle: item['title'],
                              subTittle1: item['examTime'],
                              subTittle2: item['rating'],
                              priceWidget: PriceWidgetContainer(
                                price: item['price'],
                                isDiscountAvailable: true,
                                priceWithoutDiscount: ks990Tk,
                              )),
                        ),
                      ),
                    );
                  },
                ),
                //*Govt. Test List in tabbar
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: _mockTestController.govtTestList.length,
                  itemBuilder: (context, index) {
                    var item = _mockTestController.govtTestList[index];
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
                //*private Test List in tabbar
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: _mockTestController.privateTestList.length,
                  itemBuilder: (context, index) {
                    var item = _mockTestController.privateTestList[index];
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
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
