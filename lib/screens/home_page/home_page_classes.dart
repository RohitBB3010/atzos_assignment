import 'dart:convert';

class TrailBookClass {
  String? banner;
  List<int>? level;
  String location;
  int id;
  String title;
  int createdForId;
  int sportId;
  double lat;
  double lon;
  String sportName;
  String icon;
  List<Day>? daysOfWeek;

  TrailBookClass({
    required this.banner,
    required this.level,
    required this.location,
    required this.id,
    required this.title,
    required this.createdForId,
    required this.sportId,
    required this.lat,
    required this.lon,
    required this.sportName,
    required this.icon,
    required this.daysOfWeek,
  });

  factory TrailBookClass.fromJson(Map<String, dynamic> json) {
    return TrailBookClass(
      banner: json['banner'] as String?,
      level: parseLevel(json['level']),
      location: json['location'] as String,
      id: int.parse(json['id'] as String),
      title: json['title'] as String,
      createdForId: int.parse(json['created_for_id'] as String),
      sportId: int.parse(json['sport_id'] as String),
      lat: double.parse(json['lat'] as String),
      lon: double.parse(json['lon'] as String),
      sportName: json['sport_name'] as String,
      icon: json['icon'] as String,
      daysOfWeek: (parseDayList(json['days_of_week'])),
    );
  }

  static List<int>? parseLevel(String? levelString) {
    if (levelString == null) {
      return [];
    }
    try {
      final List<dynamic> parsedList = json.decode(levelString);
      List<int> returnData = [];
      parsedList.forEach((element) {
        returnData.add(int.parse(element));
      });
      return returnData;
    } catch (e) {
      return null;
    }
  }

  static List<Day>? parseDayList(String? data) {
    if (data == null) return null;

    List<dynamic>? jsonData;
    try {
      jsonData = jsonDecode(data);
    } catch (e) {
      return null;
    }

    if (jsonData == null) return null;

    List<Day>? daysList = [];
    for (var item in jsonData) {
      Day? day;
      try {
        day = Day(
          day: item['day'] as int?,
          sctid: item['sctid'] as int?,
          startTime: item['start_time'] as String?,
          endTime: item['end_time'] as String?,
        );
      } catch (e) {
        // Handle potential exception during Day object creation (optional)
      }
      if (day != null) {
        daysList.add(day);
      }
    }
    return daysList;
  }
}

class Day {
  int? day;
  int? sctid;
  String? startTime;
  String? endTime;

  Day({this.day, this.sctid, this.startTime, this.endTime});

  factory Day.fromJson(Map<String, dynamic> json) {
    return Day(
      day: json['day'] as int?,
      sctid: json['sctid'] as int?,
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
    );
  }
}
