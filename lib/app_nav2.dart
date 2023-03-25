import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'calendar.dart';
import 'dues.dart';
import 'main.dart';
import 'home.dart';
import 'package:flutter/material.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
late BuildContext buildContext;
late WidgetRef wRef;

void onTabTapped(int index) {
  wRef.read(currentIndexProvider.notifier).state = index;
  if (wRef.read(currentIndexProvider.notifier).state == 2) {
    Navigator.push(
      buildContext,
      MaterialPageRoute(builder: (context) => const Calendar()),
    );
  } else if (wRef.read(currentIndexProvider.notifier).state == 3) {
    Navigator.push(
      buildContext,
      MaterialPageRoute(builder: (context) => const Dues()),
    );
  } else if (wRef.read(currentIndexProvider.notifier).state == 0) {
    Navigator.push(
        buildContext, MaterialPageRoute(builder: (context) => const Home()));
  }
}

class BottomMenu extends ConsumerWidget {
  const BottomMenu({Key? key}) : super(key: key);

  @override
  build(BuildContext context, WidgetRef ref) {
    return BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: ref.watch(currentIndexProvider),
        selectedIconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        unselectedIconTheme: IconThemeData(color: Theme.of(context).hintColor),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.check), label: 'Attend'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month), label: 'Calendar'),
          BottomNavigationBarItem(
              icon: Icon(Icons.monetization_on), label: 'Dues'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Notices'),
        ]);
  }
}

class SideDrawer extends ConsumerWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  build(BuildContext context, WidgetRef ref) {
    return Drawer(
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
                Icon(Icons.notifications),
                Text(
                  ' Notices',
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
            visible: ref.read(isAdminProvider.notifier).state,
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
    );
  }
}
