import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeedstudio_iot_garden/widgets/plant_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashBoardController extends GetxController {
  List plantCards = [];
  RxMap<dynamic, dynamic> plantCardMap = {}.obs;

  void addPlant(
      {required final bool isRestore,
      required final String plantName,
      required final String socketAddress,
      required final String port,
      required final int id}) {
    plantCardMap.addEntries([
      MapEntry(
        id,
        PlantCard(
            plantName: plantName,
            socketAddress: socketAddress,
            port: port,
            id: id),
      )
    ]);

    Future savePlant() async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('total', plantCardMap.length);
      await prefs.setInt('id$id', id);
      await prefs.setString('socketAddress$id', socketAddress);
      await prefs.setString('plantName$id', plantName);
      await prefs.setString('port$id', port);
    }

    if (!isRestore) {
      savePlant();
    }
  }

  Future restorePlant() async {
    final prefs = await SharedPreferences.getInstance();
    //prefs.clear();
    int? totalPlants = prefs.getInt('total');
    if (totalPlants != null) {
      for (int i = 0; totalPlants >= i; i++) {
        final String? plantName = prefs.getString('plantName$i');
        debugPrint('restoring $plantName');
        final String? socketAddress = prefs.getString('socketAddress$i');
        final String? port = prefs.getString('port$i');
        final int? id = prefs.getInt('id$i');

        if (port != null ||
            plantName != null ||
            socketAddress != null ||
            id != null) {
          addPlant(
              plantName: plantName.toString(),
              socketAddress: socketAddress.toString(),
              port: port.toString(),
              isRestore: true,
              id: id!);
        }
      }
    }
  }

  Future deletePlant(id) async {
    plantCardMap.remove(id);
    final prefs = await SharedPreferences.getInstance();
    debugPrint(id.toString());
    debugPrint('plantName ${prefs.getString('plantName$id')}');
    prefs.remove('plantName$id');
    prefs.remove('socketAddress$id');
    prefs.remove('port$id');
    prefs.remove('id$id');
  }
}
