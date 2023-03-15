import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'event_data.dart';
import 'home.dart';
import 'style.dart';
import 'main.dart';
import 'calendar.dart';

class Dues extends ConsumerWidget {
  Dues({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void onTabTapped(int index) {
      ref.read(currentIndexProvider.state).state = index;
      if (ref.read(currentIndexProvider.state).state == 4 &&
          _scaffoldKey.currentState != null) {
        _scaffoldKey.currentState!.openEndDrawer();
      } else if (ref.read(currentIndexProvider.state).state == 0) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
      } else if (ref.read(currentIndexProvider.state).state == 2) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Calendar()),
        );
      }
    }

    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: const Text("Dues"),
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
          actions: const [],
        ),
        bottomNavigationBar: BottomNavigationBar(
            onTap: onTabTapped,
            currentIndex: ref.watch(currentIndexProvider),
            selectedIconTheme:
                IconThemeData(color: Theme.of(context).primaryColor),
            unselectedIconTheme:
                IconThemeData(color: Theme.of(context).hintColor),
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.check), label: 'Attend'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_month), label: 'Calendar'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.monetization_on), label: 'Dues'),
              BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'More'),
            ]),
        endDrawer: Drawer(
          backgroundColor: Theme.of(context).primaryColorLight,
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorLight,
                ),
                child: const Text(''),
              ),
              ListTile(
                title: Row(
                  children: const [
                    Icon(Icons.home),
                    Text(
                      ' Home',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: Row(
                  children: const [
                    Icon(Icons.check),
                    Text(
                      ' Attendance',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: Row(
                  children: const [
                    Icon(Icons.calendar_month),
                    Text(
                      ' Calendar',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: Row(
                  children: const [
                    Icon(Icons.monetization_on),
                    Text(
                      ' Dues',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: Row(
                  children: const [
                    Icon(Icons.access_time),
                    Text(
                      ' Volunteer Hours',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: Row(
                  children: const [
                    Icon(Icons.announcement),
                    Text(
                      ' Notifications',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              Visibility(
                visible: ref.read(isAdminProvider.state).state,
                child: ListTile(
                  title: const Text(
                    'Admin',
                    style: TextStyle(fontSize: 18),
                  ),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
              )
            ],
          ),
        ),
        backgroundColor: Theme.of(context).backgroundColor,
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
                    onTap: () {},
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
}
