import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeedstudio_iot_garden/screens/about/about.dart';
import 'package:seeedstudio_iot_garden/screens/instructions/instructions.dart';
import 'package:seeedstudio_iot_garden/widgets/ad.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Drawer build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            //padding: EdgeInsets.all(0),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Image.asset(
              'assets/IPM_AndroidIcon.png',
              //width: double.infinity,
            ),
          ),
          ListTile(
              leading: const Icon(Icons.integration_instructions),
              title: const Text('Instructions'),
              onTap: () {
                Get.back();
                Get.to(() => const InstructionsPage());
              }),
          // ListTile(
          //     leading: const Icon(Icons.apps),
          //     title: const Text('Other Apps'),
          //     onTap: () {
          //       Get.back();
          //      // Get.to(() => null);
          //     }),
          ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About'),
              onTap: () {
                Get.back();
                Get.to(() => const AboutPage());
              }),

          const Padding(
              padding: EdgeInsets.all(20.0),
              child: AdWidget(
                adType: 'drawer',
              ))
        ],
      ),
    );
  }
}
