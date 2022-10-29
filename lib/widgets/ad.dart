import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class AdWidget extends StatelessWidget {
  final String adType;

  const AdWidget({
    Key? key,
    required this.adType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String bannerImageURL = 'https://najad.dev/iot-plant-monitor/banner_ad.jpg';
    String drawerImageURL = 'https://najad.dev/iot-plant-monitor/drawer_ad.jpg';
    String bannerAdURL = 'https://najad.dev/banner-ad';
    String drawerAdURL = 'https://najad.dev/drawer-ad';

    return FutureBuilder<bool>(
        future: (adType == 'banner')
            ? checkURL(bannerImageURL)
            : checkURL(drawerImageURL),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!) {
              return GestureDetector(
                onTap: () => (adType == 'banner')
                    ? _launchUrl(bannerAdURL)
                    : _launchUrl(drawerAdURL),
                child: SizedBox(
                  height: (adType == 'banner') ? 50 : 300,
                  child: (adType == 'banner')
                      ? Image.network(
                          bannerImageURL,
                          width: double.infinity,
                        )
                      : Image.network(
                          drawerImageURL,
                        ),
                ),
              );
            } else {
              return const SizedBox();
            }
          }
          return const SizedBox();
        });
  }

  Future _launchUrl(url) async {
    if (!await launchUrl(Uri.parse(url),
        mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  Future<bool> checkURL(imageURL) async {
    try {
      final response = await http.get(Uri.parse(imageURL));

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      debugPrint('no internet $e');
    }
    return false;
  }
}
