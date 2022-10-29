import 'package:flutter/material.dart';

import 'package:seeedstudio_iot_garden/widgets/ad.dart';

class OtherApps extends StatelessWidget {
  const OtherApps({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const AdWidget(
        adType: 'banner',
      ),
      appBar: AppBar(
        title: const Text('Other Apps'),
      ),
      body: FutureBuilder(
          future: null,
          builder: (context, snapshot) {
            return Column();
          }),
    );
  }
}
