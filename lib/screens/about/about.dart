import 'package:flutter/material.dart';
import 'package:seeedstudio_iot_garden/widgets/ad.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:const AdWidget(adType: 'banner'),
      appBar: AppBar(title: const Text('About')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "This application can connect to your ESP32 or ESP8266 or anyother Microcontroller which support websocket and receive sensor data and display it on your dashboard so that you can monitor your plant's health. ",
              style: TextStyle(height: 2, letterSpacing: 0.8),
              textAlign: TextAlign.left,
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  Image.asset(
                    'assets/websitelogo.png',
                    height: 50,
                  ),
                  TextButton(
                    onPressed: () => launchUrl(
                        Uri.parse('https://diyusthad.com'),
                        mode: LaunchMode.externalApplication),
                    child: Row(
                      children: const [
                        Text(
                          'Developed By DIY Usthad',
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.black),
                        ),
                        Icon(Icons.open_in_new)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
