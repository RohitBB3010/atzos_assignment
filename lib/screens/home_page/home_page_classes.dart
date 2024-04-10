import 'package:json_annotation/json_annotation.dart';

part 'home_page_classes.g.dart';

@JsonSerializable()
class BookingClass {
  final String? banner;
  final List<int>? level;
  final String? location;
  final int id;
  final String? title;
  final int createdForId;
  final int sportId;
  final String? sportName;
  final String? icon;
  final List<DateTime> daysOfWeek;
  final double lat;
  final double lon;

  factory BookingClass.fromJson(Map<String, dynamic> json) =>
      _$BookingClassFromJson(json);

  BookingClass({
    required this.id,
    this.banner,
    this.level,
    this.location,
    this.title,
    required this.createdForId,
    required this.sportId,
    this.sportName,
    this.icon,
    required this.daysOfWeek,
    required this.lat,
    required this.lon,
  });

  Map<String, dynamic> toJson() => _$BookingClassToJson(this);
}

@JsonSerializable()
class TrialClass {
  final String? banner;
  final List<int>? level;
  final String? location;
  final int id;
  final String? title;
  final int createdForId;
  final int sportId;
  final String? sportName;
  final String? icon;
  final List<DateTime> daysOfWeek;
  final double? lat;
  final double? lon;

  factory TrialClass.fromJson(Map<String, dynamic> json) =>
      _$TrialClassFromJson(json);

  TrialClass({
    required this.id,
    this.banner,
    this.level,
    this.location,
    this.title,
    required this.createdForId,
    required this.sportId,
    this.sportName,
    this.icon,
    required this.daysOfWeek,
    this.lat,
    this.lon,
  });

  Map<String, dynamic> toJson() => _$TrialClassToJson(this);
}

@JsonSerializable()
class InstallmentData {
  final double amount;
  final int dueNo;
  final String dueUnit;

  factory InstallmentData.fromJson(Map<String, dynamic> json) =>
      _$InstallmentDataFromJson(json);

  InstallmentData({
    required this.amount,
    required this.dueNo,
    required this.dueUnit,
  });

  Map<String, dynamic> toJson() => _$InstallmentDataToJson(this);
}

@JsonSerializable()
class MakeUpClassInfo {
  int no_of_makeup_classes;
  String makeup_class_type;

  factory MakeUpClassInfo.fromJson(Map<String, dynamic> json) =>
      _$MakeUpClassInfoFromJson(json);

  MakeUpClassInfo({
    required this.no_of_makeup_classes,
    required this.makeup_class_type,
  });

  Map<String, dynamic> toJson() => _$MakeUpClassInfoToJson(this);
}

@JsonSerializable()
class Plan {
  final int id;
  final String name;
  final String type;
  final int sessions;
  final double fees;
  final double? feesBackup;
  final int duration;
  final String durationUnit;
  final String paymentType;
  final List<InstallmentData> installmentData;
  final int noOfInstallment;
  final int installmentInterest;
  final bool hasClass; // Assuming 'class' tag is empty but represents a class
  final int maxClass;
  final bool allowAllClasses;
  final String maxClassInfo;
  final List<String>? levels; // Assuming 'levels' tag might be empty
  final int createdForId;
  final String createdForModule;
  final String note;
  final bool privacy;
  final bool autorenew;
  final String autorenewType;
  final bool makeupClass;
  final MakeUpClassInfo? makeupClassInfo;
  final bool trialPlan;
  final int restrictStartDate;
  final Map<String, dynamic>? restrictDateData; // Assuming data might be empty
  final dynamic defaultDueDate; // Data type can vary
  final int status;

  factory Plan.fromJson(Map<String, dynamic> json) => _$PlanFromJson(json);

  Plan({
    required this.id,
    required this.name,
    required this.type,
    required this.sessions,
    required this.fees,
    this.feesBackup,
    required this.duration,
    required this.durationUnit,
    required this.paymentType,
    required this.installmentData,
    required this.noOfInstallment,
    required this.installmentInterest,
    required this.hasClass,
    required this.maxClass,
    required this.allowAllClasses,
    required this.maxClassInfo,
    this.levels,
    required this.createdForId,
    required this.createdForModule,
    required this.note,
    required this.privacy,
    required this.autorenew,
    required this.autorenewType,
    required this.makeupClass,
    this.makeupClassInfo,
    required this.trialPlan,
    required this.restrictStartDate,
    this.restrictDateData,
    this.defaultDueDate,
    required this.status,
  });

  Map<String, dynamic> toJson() => _$PlanToJson(this);
}
