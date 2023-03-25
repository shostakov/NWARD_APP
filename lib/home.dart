import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app_nav2.dart';

class Home extends ConsumerWidget {
  //final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  //final GlobalKey<ScaffoldState> _scaffoldKey = scaffoldKey;

  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    wRef = ref;
    buildContext = context;
    final GlobalKey<ScaffoldState> newScaffoldKey = GlobalKey();

    return Scaffold(
        key: newScaffoldKey,
        appBar: AppBar(
          title: const Text("Track Access"),
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
          actions: const [],
        ),
        bottomNavigationBar: const BottomMenu(),
        drawer: const SideDrawer(),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
              padding: const EdgeInsets.only(top: 20.0),
              child: const Hero(
                tag: "logo",
                child: Image(
                  image: AssetImage('assets/NSRD-12in.png'),
                  height: 100.0,
                ),
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
