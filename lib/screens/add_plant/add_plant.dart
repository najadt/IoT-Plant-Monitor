import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeedstudio_iot_garden/widgets/ad.dart';
import 'package:seeedstudio_iot_garden/screens/add_plant/validation.dart';
import 'package:seeedstudio_iot_garden/controller/dashboard_controller.dart';

class AddPlant extends StatelessWidget {
  late String plantName;

  late String socketAddress;

  late String port;

  AddPlant({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = GlobalKey<FormState>();
    DashBoardController controller = Get.find<DashBoardController>();
    return Scaffold(
      bottomNavigationBar: const AdWidget(adType: 'banner'),
      appBar: AppBar(
        title: const Text('Add New Plant'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Form(
                  key: formkey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          label: Text('Plant Name'),
                          suffixIcon: Icon(Icons.park),
                          contentPadding: EdgeInsets.only(left: 10),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(14)),
                              borderSide: BorderSide(
                                color: Colors.grey,
                              )),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a plant name';
                          } else {
                            plantName = value;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          label: Text('Websocket Address'),
                          prefixText: 'wss://',
                          suffixIcon: Icon(Icons.public),
                          contentPadding: EdgeInsets.only(left: 10),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(14)),
                              borderSide: BorderSide(
                                color: Colors.grey,
                              )),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the websocket address';
                          } else {
                            socketAddress = value;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          label: Text('Port'),
                          suffixIcon: Icon(Icons.numbers),
                          contentPadding: EdgeInsets.only(left: 10),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(14)),
                              borderSide: BorderSide(
                                color: Colors.grey,
                              )),
                        ),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              !value.isValidPort) {
                            return 'Please enter the websocket port';
                          } else {
                            port = value;
                          }
                          return null;
                        },
                      ),
                    ],
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
                          controller.addPlant(
                              port: port,
                              plantName: plantName,
                              socketAddress: socketAddress,
                              isRestore: false,
                              id: controller.plantCards.length);
                          Get.back();
                        }
                      },
                      icon: const Icon(Icons.add),
                      label: const Text('Add')),
                  ElevatedButton.icon(
                      // style: ButtonStyle(
                      //     backgroundColor:
                      //         MaterialStateProperty.all(Colors.red)),
                      onPressed: () => Get.back(),
                      icon: const Icon(Icons.cancel),
                      label: const Text('Cancel')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
