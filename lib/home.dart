import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hello_world/calendar.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'event_data.dart';
import 'main.dart';
import 'dues.dart';

class Home extends ConsumerWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void onTabTapped(int index) {
      ref.read(currentIndexProvider.state).state = index;
      if (ref.read(currentIndexProvider.state).state == 4 &&
          _scaffoldKey.currentState != null) {
        _scaffoldKey.currentState!.openEndDrawer();
      } else if (ref.read(currentIndexProvider.state).state == 2) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Calendar()),
        );
      } else if (ref.read(currentIndexProvider.state).state == 3) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Dues()),
        );
      }
    }

    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: const Text("Track Access"),
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
          actions: <Widget>[Container()],
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
          backgroundColor: Theme.of(context).primaryColor,
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
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
        body: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
              padding: const EdgeInsets.only(top: 20.0),
              child: const Hero(
                child: Image(
                  image: AssetImage('assets/NSRD-12in.png'),
                  height: 100.0,
                ),
                tag: "logo",
              ),
            ),
            Container(
                padding: const EdgeInsets.all(20),
                child: const Center(
                  child: Text(
                    'Hi Alex! Welcome to Track Access.',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                )),
            Container(
                padding: const EdgeInsets.all(20),
                alignment: Alignment.topLeft,
                child: const Text(
                  'Upcoming Events:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              clipBehavior: Clip.antiAlias,
              color: Theme.of(context).hintColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.event,
                        color: Theme.of(context).splashColor,
                      ),
                      title: Text(
                        'May Day Pub Crawl',
                        style: TextStyle(
                            color: Theme.of(context).splashColor,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'May 1, 2022 02:00 PM, Various Locations',
                        style: TextStyle(color: Theme.of(context).splashColor),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          "Because practice is more fun when you've been drinking.",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.start,
                      children: [
                        TextButton(
                            onPressed: () {
                              // Perform some action
                            },
                            child: Text(
                              'CHECK IN',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                              ),
                            )),
                        TextButton(
                          onPressed: () {
                            // Perform some action
                          },
                          child: Text(
                            'RSVP',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // Perform some action
                          },
                          child: Text(
                            'ADD TO CALENDAR',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              clipBehavior: Clip.antiAlias,
              color: Theme.of(context).hintColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.event,
                        color: Theme.of(context).splashColor,
                      ),
                      title: Text(
                        'Practice',
                        style: TextStyle(
                            color: Theme.of(context).splashColor,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'May 1, 2022 07:00 PM, Starlight Skatium',
                        style: TextStyle(color: Theme.of(context).splashColor),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'Practice session. Please sign in before we start.',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.start,
                      children: [
                        TextButton(
                            onPressed: () {
                              // Perform some action
                            },
                            child: Text(
                              'CHECK IN',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                              ),
                            )),
                        TextButton(
                          onPressed: () {
                            // Perform some action
                          },
                          child: Text(
                            'RSVP',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // Perform some action
                          },
                          child: Text(
                            'ADD TO CALENDAR',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              clipBehavior: Clip.antiAlias,
              color: Theme.of(context).hintColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.event,
                        color: Theme.of(context).splashColor,
                      ),
                      title: Text(
                        'Game vs. Capital City Crushers',
                        style: TextStyle(
                            color: Theme.of(context).splashColor,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'May 7, 2022 06:00 PM, Starlight Skatium',
                        style: TextStyle(color: Theme.of(context).splashColor),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          "Let's kick some ass, ladies!",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.start,
                      children: [
                        TextButton(
                            onPressed: () {
                              // Perform some action
                            },
                            child: Text(
                              'CHECK IN',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                              ),
                            )),
                        TextButton(
                          onPressed: () {
                            // Perform some action
                          },
                          child: Text(
                            'RSVP',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // Perform some action
                          },
                          child: Text(
                            'ADD TO CALENDAR',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ));
  }
}
