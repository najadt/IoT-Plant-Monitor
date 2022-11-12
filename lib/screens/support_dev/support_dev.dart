import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class DonationPage extends StatelessWidget {
  const DonationPage({super.key});

  @override
  Widget build(BuildContext context) {
    BoxDecoration containerDecoration = BoxDecoration(
      color: Colors.white,
      border: Border.all(
        width: 1,
        color: const Color.fromARGB(255, 255, 255, 255),
      ),
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      boxShadow: const [
        BoxShadow(
          color: Colors.black12,
          offset: Offset(2, 2),
          blurRadius: 6,
        )
      ],
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Support Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Support the developer',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              padding: const EdgeInsets.all(8.0),
              width: double.infinity,
              height: 180,
              decoration: containerDecoration,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('UPI Payment (only in India)',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('UPI ID: najad@sbi'),
                      SizedBox(
                        height: 20,
                        child: CopyToClipBoardElevatedButton(
                            copytext: 'najad@sbi'),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('GooglePay/PhonePay: 9633645334'),
                      SizedBox(
                        height: 20,
                        child: CopyToClipBoardElevatedButton(
                            copytext: '9633645334'),
                      ),
                    ],
                  ),
                  const Expanded(child: SizedBox()),
                  Image.asset('assets/upi_payments.png')
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              padding: const EdgeInsets.all(8.0),
              width: double.infinity,
              height: 150,
              decoration: containerDecoration,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Paypal (rest of the world)',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const Divider(),
                  const Text('PayPal ID: onajad@gmail.com'),
                  const Expanded(child: SizedBox()),
                  GestureDetector(
                    onTap: payPalLauncher,
                    child: Image.asset(
                      'assets/paypal_donate_button.png',
                      width: 180,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> payPalLauncher() async {
    Uri url = Uri.parse('https://www.paypal.com/paypalme/najadt');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }
}

class CopyToClipBoardElevatedButton extends StatelessWidget {
  final String copytext;
  const CopyToClipBoardElevatedButton({
    Key? key,
    required this.copytext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Clipboard.setData(ClipboardData(text: copytext)).then(
            (value) {
              const snackBar = SnackBar(
                content: Text('Copied to Clipboard'),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          );
        },
        child: const Text('copy'));
  }
}
