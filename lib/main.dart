import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

void main() => runApp(RecurrenceAppointment());
class RecurrenceAppointment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AppointmentDetails(),
    );
  }
}
class AppointmentDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ScheduleExample();
}
class ScheduleExample extends State<AppointmentDetails> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: SfCalendar(
          dataSource: _getDataSource(),
          view: CalendarView.week,
          onTap: calendarTapped,
          allowedViews: [
            CalendarView.day,
            CalendarView.week,
            CalendarView.workWeek,
            CalendarView.month,
            CalendarView.timelineDay,
            CalendarView.timelineWeek,
            CalendarView.timelineWorkWeek,
            CalendarView.timelineMonth,
            CalendarView.schedule
          ],
          monthViewSettings: MonthViewSettings(showAgenda: true),
        ),
      ),
    );
  }
  _DataSource _getDataSource() {
    final List<Appointment> appointments = <Appointment>[];
    final DateTime exceptionDate = DateTime(2021, 07, 20);
    final Appointment normalAppointment = Appointment(
      startTime: DateTime(2021, 07, 11, 10),
      endTime: DateTime(2021, 07, 11, 12),
      subject: 'Planning',
      id: '01',
      color: Colors.green,
      recurrenceExceptionDates: <DateTime>[exceptionDate],
    );
    appointments.add(normalAppointment);
    final Appointment recurrenceAppointment = Appointment(
      startTime: DateTime(2021, 07, 12, 10),
      endTime: DateTime(2021, 07, 12, 12),
      subject: 'Scrum meeting',
      id: '02',
      recurrenceRule: 'FREQ=DAILY;INTERVAL=1;COUNT=10',
      color: Colors.purple,
      recurrenceExceptionDates: <DateTime>[exceptionDate],
    );
    appointments.add(recurrenceAppointment);
    final Appointment exceptionAppointment = Appointment(
        startTime: exceptionDate.add(const Duration(hours: 14)),
        endTime: exceptionDate.add(const Duration(hours: 15)),
        subject: 'Meeting',
        id: '03',
        color: Colors.pinkAccent,
        recurrenceId: recurrenceAppointment.id);
    appointments.add(exceptionAppointment);
    return _DataSource(appointments);
  }
  void calendarTapped(CalendarTapDetails calendarTapDetails) {
    if (calendarTapDetails.targetElement == CalendarElement.appointment) {
      _showDialog(calendarTapDetails);
    }
  }
  _showDialog(CalendarTapDetails details) async {
    Appointment appointment = details.appointments![0];
    await showDialog(
      context: context,
      // ignore: deprecated_member_use
      builder: (BuildContext context) {
        return new AlertDialog(
          title: Container(
            child: Text("Appointment Details"),
          ),
          contentPadding: const EdgeInsets.all(16.0),
          content: Text("Subject: " +
              appointment.subject +
              "\nId: " +
              appointment.id.toString() +
              "\nRecurrenceId: " +
              appointment.recurrenceId.toString()+ "\nAppointment type: "+appointment.appointmentType.toString()),
          actions: <Widget>[
            new TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                })
          ],
        );
      },
    );
  }
}
class _DataSource extends CalendarDataSource {
  _DataSource(List<Appointment> source) {
    appointments = source;
  }
}