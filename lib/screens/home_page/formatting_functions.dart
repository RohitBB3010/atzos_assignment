import 'package:atzos_assignment/screens/home_page/home_page_classes.dart';

Map<List<String?>, List<int>> groupDaysByTime(List<Day> days) {
  Map<List<String?>, List<int>> groupedDays = {};

  if (days.isNotEmpty) {
    for (var day in days) {
      //String key = '${day.startTime} - ${day.endTime}';
      List<String?> key = [day.startTime, day.endTime];
      if (!groupedDays.containsKey(key)) {
        if (day.day != null) {
          groupedDays[key] = [day.day!];
        }
      } else {
        groupedDays[key]!.add(day.day!);
      }
    }
  }

  return groupedDays;
}

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

String getDateFormat(Map<List<String?>, List<int>> data) {
  // Define a list of day abbreviations
  List<String> dayAbbreviations = ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'];

  // Initialize variables to store start and end times
  late String startTime, endTime;

  // Parse start and end times from the first map entry
  for (var entry in data.keys) {
    startTime = entry[0]!;
    endTime = entry[1]!;
    break; // Stop after parsing the first entry
  }

  // Convert list of day indices to day abbreviations
  List<String> daysOfWeek = data.values
      .expand((days) => days.map((day) => dayAbbreviations[day]))
      .toList();

  // Concatenate day abbreviations and start-end times
  String formattedString = '${daysOfWeek.join(' ')} $startTime-$endTime';

  print(formattedString);
  return formattedString;
}
