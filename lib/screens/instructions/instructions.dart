import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class InstructionsPage extends StatelessWidget {
  const InstructionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //bottomNavigationBar:  AdWidget(adType: 'banner'),
      appBar: AppBar(title: const Text('Instuctions')),
      body: WebView(
        zoomEnabled: false,
        initialUrl: 'https://diyusthad.com/iot-plant-monitoring-app',
        navigationDelegate: (navigation) {
          if (!(navigation.url.startsWith('https://diyusthad.com/'))) {
            final Uri url = Uri.parse(navigation.url);
            debugPrint(navigation.url);
            _launchUrl(url);
            return NavigationDecision.prevent;
          }

          return NavigationDecision.navigate;
        },
      ),
    );
  }

  Future _launchUrl(url) async {
    if (!await launchUrl(url,mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }
}
