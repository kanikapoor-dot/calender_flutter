import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calender extends StatefulWidget {
  const Calender({Key? key}) : super(key: key);

  @override
  _CalenderState createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calender'),
        centerTitle: true,
      ),
      body: TableCalendar(
        focusedDay: focusedDay,
        firstDay: DateTime(1900),
        lastDay: DateTime(2100),
        calendarFormat: format,
        onFormatChanged: (CalendarFormat _format) {
          setState(() {
            format = _format;
          });
        },
        daysOfWeekVisible: true,
        onDaySelected: (DateTime selectDay,DateTime focusDay){
          setState(() {
            selectedDay = selectDay;
            focusedDay = focusDay;
          });
        },
        selectedDayPredicate: (day){
          return isSameDay(selectedDay, day);
        },
      ),
    );
  }
}
