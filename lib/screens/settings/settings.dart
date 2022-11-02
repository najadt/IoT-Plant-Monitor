import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeedstudio_iot_garden/const.dart';
import 'package:seeedstudio_iot_garden/widgets/ad.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = GlobalKey<FormState>();
    late int intervalTime;
    return Scaffold(
      bottomNavigationBar: const AdWidget(adType: 'banner'),
      appBar: AppBar(title: const Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
                'Set the interval at which the data has to be fetched from the controller, By default the time is set to 1 sec for testing purpose. Choose a long time to save battery life of controller'),
            const SizedBox(
              height: 15,
            ),
            Form(
                key: formkey,
                child: TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Refresh interval in seconds'),
                    suffixIcon: Icon(Icons.hourglass_top),
                    contentPadding: EdgeInsets.only(left: 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(14)),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        )),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a valid number';
                    } else {
                      intervalTime = int.parse(value);
                    }
                    return null;
                  },
                )),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        saveRefreshInterval(intervalTime);
                        Get.back();
                      }
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('Add')),
                ElevatedButton.icon(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.cancel),
                    label: const Text('Cancel')),
              ],
            )
          ],
        ),
      ),
    );
  }
}

saveRefreshInterval(int intervalTime) {
  refreshInterval = Duration(seconds: intervalTime);
}
