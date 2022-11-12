import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeedstudio_iot_garden/screens/settings/settings_controller.dart';
import 'package:seeedstudio_iot_garden/widgets/ad.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = GlobalKey<FormState>();
    SettingsController controller = Get.put(SettingsController());
    return Scaffold(
      bottomNavigationBar: const AdWidget(adType: 'banner'),
      appBar: AppBar(title: const Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Set the interval at which the data has to be fetched from the controller, By default the time is set to 1 sec for testing purpose. Choose a long time to save battery life of controller',
              style: TextStyle(height: 1.5, letterSpacing: 0.4),
            ),
            const Text(
              'Take effect on next restart',
              style: TextStyle(height: 1.5, letterSpacing: 0.4),
            ),
            const SizedBox(
              height: 15,
            ),
            Form(
                key: formkey,
                child: TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Refresh interval in seconds'),
                    suffixIcon: Icon(Icons.timer),
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
                      controller.intervalTime.value = int.parse(value);
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
                        controller.saveRefreshInterval();
                        Get.back();
                      }
                    },
                    icon: const Icon(Icons.save),
                    label: const Text('Save')),
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
