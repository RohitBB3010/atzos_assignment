import 'package:atzos_assignment/screens/home_page/home_page_classes.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String getDayOfWeek(int dayInt) {
  switch (dayInt) {
    case 0:
      return 'Su';
    case 1:
      return 'Mo';
    case 2:
      return 'Tu';
    case 3:
      return 'We';
    case 4:
      return 'Th';
    case 5:
      return 'Fr';
    case 6:
      return 'Sa';
    default:
      return 'Invalid day index';
  }
}

String convertTimeFormat(String timeString) {
  final parsedTime = DateFormat.Hm().parse(timeString);
  final formattedTime = DateFormat('hh:mm a').format(parsedTime);
  return formattedTime;
}

String returnCustomDate(String startTime, String endTime) {
  return '${convertTimeFormat(startTime)} - ${convertTimeFormat(endTime)}';
}

Map<String, List<String>> groupDaysByTime(List<Day> daysOfWeek) {
  Map<String, List<String>> groupedDayTimes = {};

  for (final day in daysOfWeek) {
    if (day.day != null && day.startTime != null && day.endTime != null) {
      String timeRange = returnCustomDate(day.startTime!, day.endTime!);
      if (!groupedDayTimes.containsKey(timeRange)) {
        groupedDayTimes[timeRange] = [];
      }
      groupedDayTimes[timeRange]!.add(getDayOfWeek(day.day!));
    }
  }

  return groupedDayTimes;
}

List<Widget> createTimeRangeWidgets(Map<String, List<String>> timeRanges) {
  final formattedString = formatTimeRanges(timeRanges);
  final List<String> splitRanges = formattedString.split(' ');

  return splitRanges
      .map((range) => AutoSizeText(
            range,
            style: TextStyle(fontSize: 16),
          ))
      .toList();
}

String formatTimeRanges(Map<String, List<String>> timeRanges) {
  String outputString = "";
  for (final timeRange in timeRanges.keys) {
    final days = timeRanges[timeRange]!;

    final parts = timeRange.split(" - ");
    final startTime = parts[0];
    final endTime = parts[1];

    outputString +=
        "$startTime - $endTime ${days.join(' ')} "; // Use join with space
  }
  return outputString.trim();
}
