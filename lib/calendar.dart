import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hello_world/app_nav2.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'event_data.dart';
import 'style.dart';
import 'main.dart';

class Calendar extends ConsumerWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void onCalendarTapped(CalendarTapDetails details) {
      if (details.targetElement == CalendarElement.appointment ||
          details.targetElement == CalendarElement.agenda) {
        final Appointment appointmentDetails = details.appointments![0];
        ref.read(apptIdProvider.notifier).state =
            appointmentDetails.id.toString();
      }
    }

    List<Appointment> getDataSource() {
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

    final GlobalKey<ScaffoldState> newScaffoldKey = GlobalKey();

    return Scaffold(
      key: newScaffoldKey,
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
      bottomNavigationBar: const BottomMenu(),
      drawer: const SideDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,
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
        dataSource: MeetingDataSource(getDataSource()),
      ),
    );
  }
}
