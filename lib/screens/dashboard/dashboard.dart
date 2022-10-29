import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeedstudio_iot_garden/widgets/app_drawer.dart';
import 'package:seeedstudio_iot_garden/widgets/ad.dart';
import 'package:seeedstudio_iot_garden/screens/add_plant/add_plant.dart';
import 'package:seeedstudio_iot_garden/controller/dashboard_controller.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

//   final BannerAd myBanner = BannerAd(
  @override
  Widget build(BuildContext context) {
    //final AdWidget adWidget = AdWidget(ad: myBanner);
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    Get.put(DashBoardController());
    Get.find<DashBoardController>().restorePlant();
    return Scaffold(
      bottomNavigationBar: const AdWidget(adType: 'banner'),
      key: scaffoldKey,
      //drawer: ,
      endDrawer: const AppDrawer(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Get.to(() => AddPlant()),
        label: const Text('Add Plant'),
        icon: const Icon(Icons.forest),
      ),
      appBar: AppBar(
        titleSpacing: 0,
        leading: const Icon(Icons.park),
        title: const Text('IoT Plant Monitor'),
        actions: [
          IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => scaffoldKey.currentState!.openEndDrawer())
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: GetX<DashBoardController>(builder: (controller) {
                if (controller.plantCardMap.isNotEmpty) {
                  controller.plantCards = controller.plantCardMap.entries
                      .map((e) => e.value)
                      .toList();
                  return ListView.builder(
                    padding: const EdgeInsets.only(bottom: 58),
                    itemCount: controller.plantCardMap.length,
                    itemBuilder: (BuildContext context, int index) {
                      return controller.plantCards[index];
                    },
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/nothing.png',
                            //colorBlendMode: BlendMode.softLight,
                            height: 200,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const Text(
                            'Add a plant to monitor the sensor data',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 15),
                          ),
                          const SizedBox(
                            height: 40,
                          )
                        ],
                      ),
                    ),
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}

// Path _buildBoatPath1() {
//     return Path()
//       ..moveTo(50, 0)
//       ..lineTo(100, 100)
//       ..lineTo(200, 100)
//       ..lineTo(250, 0)

//       //..lineTo(15, 50)
//       ..close();
//   }


// if (snapshot.hasData) {
          //   output = (0.00 +
          //       ((0.99 - 0.00) / (100 - 0)) *
          //           (int.parse(snapshot.data) - 0));
          //   print(output);
          // }
