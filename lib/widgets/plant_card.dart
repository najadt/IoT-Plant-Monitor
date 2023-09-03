import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
import 'package:seeedstudio_iot_garden/models/plant_model.dart';
import 'package:seeedstudio_iot_garden/controller/dashboard_controller.dart';
import 'package:seeedstudio_iot_garden/controller/stream_controller.dart';
import 'linear_progress_indicator.dart';

class PlantCard extends StatefulWidget {
  final String plantName;
  final String socketAddress;
  final String port;
  final int id;
  const PlantCard({
    Key? key,
    required this.plantName,
    required this.socketAddress,
    required this.port,
    required this.id,
  }) : super(key: key);

  @override
  State<PlantCard> createState() => _PlantCardState();
}

class _PlantCardState extends State<PlantCard> {
  @override
  Widget build(BuildContext context) {
    Get.put(StreamController());
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.plantName,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                PopupMenuButton<int>(
                  onSelected: ((value) {
                    if (value == 2) {
                      Get.find<DashBoardController>().deletePlant(widget.id);
                    }
                    if (value == 1) {
                      setState(() {});
                    }
                  }),
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 1,
                      child: Row(
                        children: [
                          Icon(Icons.cable),
                          SizedBox(
                            // sized box with width 10
                            width: 10,
                          ),
                          Text("Reconnect")
                        ],
                      ),
                    ),
                    const PopupMenuItem(
                      value: 2,
                      child: Row(
                        children: [
                          Icon(Icons.delete_forever),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Delete")
                        ],
                      ),
                    ),
                  ],
                  elevation: 2,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'assets/plants/${Random().nextInt(9)}.png',
                  height: 180,
                ),
                SizedBox(
                  height: 180,
                  child: StreamBuilder(
                    stream: Get.find<StreamController>()
                        .stream(widget.socketAddress, widget.port),
                    builder: (context, snapshot) {
                      double processedWaterLevel = 0;
                      if (snapshot.hasData) {
                        var dataMap = jsonDecode(snapshot.data);
                        var newPlant = Plant.fromJson(dataMap);
                        processedWaterLevel = (0.00 +
                            ((0.99 - 0.00) / (100 - 0)) *
                                (newPlant.waterLevel - 0));

                        //debugPrint(newPlant.waterLevel.toString());

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.water,
                                  color: Colors.blue,
                                ),
                                const Text('Water Level   '),
                                SizedBox(
                                  width: 80,
                                  height: 20,
                                  child: LiquidLinearProgressIndicator(
                                    //center: Text('%'),
                                    value:
                                        processedWaterLevel, // Defaults to 0.5.
                                    valueColor: const AlwaysStoppedAnimation(Colors
                                        .blue), // Defaults to the current Theme's accentColor.
                                    backgroundColor: const Color.fromARGB(
                                        65,
                                        33,
                                        149,
                                        243), // Defaults to the current Theme's backgroundColor.
                                    borderColor: Colors.blue,
                                    borderWidth: 0.0,
                                    borderRadius: 6.0,
                                    //center: Text('10%'),
                                    direction: Axis
                                        .horizontal, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.horizontal.
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.thermostat,
                                  color: Colors.red,
                                ),
                                const Text('Temperature '),
                                MyLinearIndicator(
                                  bgcolor:
                                      const Color.fromARGB(50, 244, 67, 54),
                                  color: Colors.red,
                                  value: newPlant.temperature,
                                  unit: '°C',
                                )
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.water_drop,
                                  color: Colors.blueAccent,
                                ),
                                const Text('Humidity        '),
                                MyLinearIndicator(
                                  bgcolor:
                                      const Color.fromARGB(50, 68, 137, 255),
                                  color: Colors.blueAccent,
                                  value: newPlant.humidity,
                                  unit: '%',
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                const Icon(Icons.speed, color: Colors.amber),
                                const Text('pH                   '),
                                MyLinearIndicator(
                                  bgcolor:
                                      const Color.fromARGB(50, 255, 193, 7),
                                  color: Colors.amber,
                                  value: newPlant.ph,
                                  unit: 'pH',
                                )
                              ],
                            ),
                          ],
                        );
                      } else if (snapshot.hasError) {
                        debugPrint(snapshot.hasError.toString());
                      }
                      return const Center(child: CircularProgressIndicator());
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
