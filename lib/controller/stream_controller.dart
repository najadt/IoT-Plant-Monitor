import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeedstudio_iot_garden/const.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class StreamController extends GetxController {
  Stream? stream(socketAddress, port) {
    
    try {
      WebSocketChannel channel =
          WebSocketChannel.connect(Uri.parse('ws://$socketAddress:$port'));
      Stream stream = channel.stream;

      Timer.periodic(refreshInterval, (Timer t) => channel.sink.add('#'));

      return stream;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
