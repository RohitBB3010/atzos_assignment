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

class TeamMember {
  String userName;
  String avatar;
  String? designation;

  TeamMember({required this.userName, required this.avatar, this.designation});

  factory TeamMember.fromJson(Map<String, dynamic> json) {
    return TeamMember(
      userName: json['username'] as String,
      avatar: json['avatar'] as String,
      designation: json['designation'] as String?,
    );
  }
}

// class Plan {
//   int id;
//   String? name;
//   String? type;
//   int sessions;
//   double fees;
//   double feesBackup;
//   int duration;
//   String? durationUnit;
//   String? paymentType;
//   int numberOfInstallment;
//   int installmentInterest;
//   String classType;
//   int maxClass;
//   int allowAllClasses;
//   String maxClassInfo;
//   List<String> levels;
//   int createdForId;
//   String createdForModule;
//   String note;
//   int privacy;
//   int autoRenew;
//   String renewType;
//   int makeUpClass;
//   String makeUpClassInfo;
//   int trialPlan;
//   int restrictStartDate;
//   int defaultDueState;
//   int status;

//   Plan({
//     required this.id,
//     required this.name,
//     required this.type,
//     required this.sessions,
//     required this.fees,
//     required this.feesBackup,
//     required this.duration,
//     required this.durationUnit,
//     required this.paymentType,
//     required this.numberOfInstallment,
//     required this.installmentInterest,
//     required this.classType,
//     required this.maxClass,
//     required this.allowAllClasses,
//     required this.maxClassInfo,
//     required this.levels,
//     required this.createdForId,
//     required this.createdForModule,
//     required this.note,
//     required this.privacy,
//     required this.autoRenew,
//     required this.renewType,
//     required this.makeUpClass,
//     required this.makeUpClassInfo,
//     required this.trialPlan,
//     required this.restrictStartDate,
//     required this.defaultDueState,
//     required this.status,
//   });

//   factory Plan.fromJson(Map<String, dynamic> json) {
//     return Plan(
//       id: int.parse(json['id'] as String),
//       name: json['name'] as String?,
//       type: json['type'] as String?,
//       sessions: int.parse(json['sessions'] as String),
//       fees: double.parse(json['fees'] as String),
//       feesBackup: double.parse(json['fees_backup'] as String),
//       duration: int.parse(json['duration'] as String),
//       durationUnit: json['duration_unit'] as String? ?? "",
//       paymentType: json['payment_type'] as String?,
//       numberOfInstallment: int.parse(json['no_of_installment']),
//       installmentInterest: int.parse(json['installment_interest']),
//       classType: json['class'] as String,
//       maxClass: json['max_class'] as int,
//       allowAllClasses: json['allow_all_classes'] as int,
//       maxClassInfo: json['max_class_info'] as String,
//       levels: List<String>.from(json['levels'] ?? []),
//       createdForId: json['created_for_id'] as int,
//       createdForModule: json['created_for_module'] as String,
//       note: json['note'] as String,
//       privacy: json['privacy'] as int,
//       autoRenew: json['autorenew'] as int,
//       renewType: json['autorenew_type'] as String,
//       makeUpClass: json['makeup_class'] as int,
//       makeUpClassInfo: json['makeup_class_info'] as String,
//       trialPlan: json['trial_plan'] as int,
//       restrictStartDate: json['restrict_start_date'] as int,
//       defaultDueState: json['default_due_date'] as int,
//       status: json['status'] as int,
//     );
//   }
// }

class Plan {
  int? duration;
  int? sessions;
  String name;
  String? durationUnit;
  double? fees;

  Plan(
      {this.duration,
      this.sessions,
      required this.name,
      this.durationUnit,
      this.fees});

  factory Plan.fromJson(Map<String, dynamic> json) {
    return Plan(
      duration: int.parse(json['duration']),
      sessions: int.parse(json['sessions']),
      name: json['name'] as String,
      durationUnit: json['duration_unit'] as String?,
      fees: double.parse(json['fees']),
    );
  }
}

class BasicData {
  String phoneNumber;
  String email;
  String website;
  String address;
  Map<String, String> socialMediaLinks;
  List<AdditionalInfo> additionalInfo;
  String terms;
  String privacyPolicy;
  String countryCode;

  BasicData(
      {required this.phoneNumber,
      required this.email,
      required this.additionalInfo,
      required this.address,
      required this.website,
      required this.socialMediaLinks,
      required this.terms,
      required this.privacyPolicy,
      required this.countryCode});

  factory BasicData.fromJson(Map<String, dynamic> json) {
    return BasicData(
      website: json['website'],
      phoneNumber: json['phone'],
      email: json['email'],
      countryCode: json['country_code'],
      address: json['address'],
      privacyPolicy: json['privacy_policy'],
      terms: json['terms'],
      additionalInfo: jsonToInfoList(json['additional_info']),
      socialMediaLinks: jsonStringToMap(json['social_link']),
    );
  }

  static Map<String, String> jsonStringToMap(String jsonString) {
    Map<String, String> resultMap = {};
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    jsonMap.forEach((key, value) {
      resultMap[key] = value.toString();
    });

    return resultMap;
  }

  static List<AdditionalInfo> jsonToInfoList(String? jsonData) {
    if (jsonData == null) return [];

    List<dynamic> jsonDecodedData = jsonDecode(jsonData);
    if (jsonDecodedData == null) return [];

    List<AdditionalInfo> infoList = [];

    for (var jsonInfo in jsonDecodedData) {
      if (jsonInfo != null) {
        AdditionalInfo info = AdditionalInfo.fromJson(jsonInfo);
        infoList.add(info);
      }
    }

    return infoList;
  }
}

class AdditionalInfo {
  String title;
  String descpription;
  String visibleTo;

  AdditionalInfo(
      {required this.title,
      required this.visibleTo,
      required this.descpription});

  factory AdditionalInfo.fromJson(Map<String, dynamic> json) {
    return AdditionalInfo(
        title: json['title'],
        visibleTo: json['visible_to'],
        descpription: json['description']);
  }
}
