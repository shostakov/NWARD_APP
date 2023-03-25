import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hello_world/app_nav2.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _venmoUrl = Uri.parse('venmo://users/W-Bryan-Evans');
final Uri _venmoWebUrl = Uri.parse('https://venmo.com/W-Bryan-Evans');

class Dues extends ConsumerWidget {
  const Dues({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<ScaffoldState> newScaffoldKey = GlobalKey();

    return Scaffold(
        key: newScaffoldKey,
        appBar: AppBar(
          title: const Text("Dues"),
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
          actions: const [],
        ),
        bottomNavigationBar: const BottomMenu(),
        drawer: const SideDrawer(),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
              child: Text(
                'Please pay your dues with either Venmo or PayPal:',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
                child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.75,
              height: MediaQuery.of(context).size.height * 0.2,
              child: GestureDetector(
                child: Ink(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/Venmo-Logo.png"),
                          fit: BoxFit.contain)),
                  child: InkWell(
                    onTap: () {
                      _launchUrl(_venmoUrl, _venmoWebUrl);
                    },
                  ),
                ),
              ),
            )),
            Expanded(
                child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.75,
              height: MediaQuery.of(context).size.height * 0.2,
              child: GestureDetector(
                child: Ink(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/Paypal-Logo.png"),
                          fit: BoxFit.contain)),
                  child: InkWell(
                    onTap: () {},
                  ),
                ),
              ),
            )),
          ],
        ));
  }

  Future<void> _launchUrl(Uri appUri, Uri webUri) async {
    if (!await launchUrl(appUri)) {
      if (!await launchUrl(webUri)) {
        throw Exception('Could not launch $webUri');
      }
    }
  }
}
