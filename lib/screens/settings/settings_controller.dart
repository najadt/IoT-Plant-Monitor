import 'package:get/get.dart';
import 'package:seeedstudio_iot_garden/const.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsController extends GetxController {

   RxInt intervalTime = 1.obs;


  saveRefreshInterval() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setInt('refreshInterval', intervalTime.value);
  refreshInterval = Duration(seconds: intervalTime.value);
}
}
