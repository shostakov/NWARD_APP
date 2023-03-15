import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'event_data.dart';
import 'home.dart';
import 'style.dart';
import 'main.dart';
import 'dues.dart';

class Calendar extends ConsumerWidget {
  Calendar({Key? key}) : super(key: key);

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
      } else if (ref.read(currentIndexProvider.state).state == 3) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Dues()),
        );
      }
    }

    void onCalendarTapped(CalendarTapDetails details) {
      if (details.targetElement == CalendarElement.appointment ||
          details.targetElement == CalendarElement.agenda) {
        final Appointment appointmentDetails = details.appointments![0];
        ref.read(apptIdProvider.state).state = appointmentDetails.id.toString();
      }
    }

    List<Appointment> _getDataSource() {
      final List<Appointment> meetings = <Appointment>[];
      final DateTime today = DateTime.now();
      final DateTime startTime =
          DateTime(today.year, today.month, today.day, 9, 0, 0);
      final DateTime endTime = startTime.add(const Duration(hours: 2));
      meetings.add(Appointment(
          subject: 'Conference',
          startTime: startTime,
          endTime: endTime,
          color: (Theme.of(context).splashColor),
          id: '1'));
      meetings.add(Appointment(
          subject: 'Practice',
          location: 'Starlight Skatium',
          startTime: DateTime(2022, 5, 1, 19),
          endTime: DateTime(2022, 5, 1, 21),
          color: (Theme.of(context).primaryColorLight),
          id: '2'));
      meetings.add(Appointment(
          subject: 'May Day Pub Crawl',
          startTime: DateTime(2022, 5, 1, 14),
          endTime: DateTime(2022, 5, 1, 17),
          color: (Theme.of(context).hintColor),
          id: '3'));
      meetings.add(Appointment(
          subject: 'Some Other Thing',
          startTime: DateTime(2022, 5, 1, 17),
          endTime: DateTime(2022, 5, 1, 19),
          color: (Theme.of(context).splashColor),
          id: '4'));

      return meetings;
    }

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text("Calendar"),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: const Icon(Icons.add),
              )),
        ],
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
      body: SfCalendar(
        onTap: onCalendarTapped,
        showNavigationArrow: true,
        headerHeight: (MediaQuery.of(context).size.height / 15),
        headerStyle: CalendarHeaderStyle(
          textAlign: TextAlign.center,
          textStyle: headerTextStyle,
        ),
        viewHeaderStyle: ViewHeaderStyle(
            dateTextStyle: bodyTextStyle, dayTextStyle: bodyTextStyle),
        todayTextStyle: bodyTextStyle,
        selectionDecoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).primaryColor)),
        initialSelectedDate: DateTime.now(),
        todayHighlightColor: Theme.of(context).primaryColorLight,
        backgroundColor: Colors.white,
        view: CalendarView.month,
        monthViewSettings: MonthViewSettings(
            showAgenda: true,
            agendaViewHeight: (MediaQuery.of(context).size.height / 3),
            agendaItemHeight: (MediaQuery.of(context).size.height / 15),
            agendaStyle: AgendaStyle(
              appointmentTextStyle: apptTextStyle,
              dateTextStyle: bodyTextStyle,
              dayTextStyle: bodyTextStyle,
            ),
            monthCellStyle: MonthCellStyle(
                textStyle: bodyTextStyle,
                trailingDatesTextStyle: otherMonthTextStyle,
                leadingDatesTextStyle: otherMonthTextStyle)),
        dataSource: MeetingDataSource(_getDataSource()),
      ),
    );
  }
}
