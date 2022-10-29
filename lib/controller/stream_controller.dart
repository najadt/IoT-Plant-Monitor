import 'package:get/get.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class StreamController extends GetxController {
  Stream? stream(socketAddress, port) {
    try {
      WebSocketChannel channel =
          WebSocketChannel.connect(Uri.parse('ws://$socketAddress:$port'));
      Stream stream = channel.stream;
      return stream;
    } catch (e) {
      return null;
    }
  }
}
