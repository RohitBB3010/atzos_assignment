// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_classes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingClass _$BookingClassFromJson(Map<String, dynamic> json) => BookingClass(
      id: json['id'] as int,
      banner: json['banner'] as String?,
      level: (json['level'] as List<dynamic>?)?.map((e) => e as int).toList(),
      location: json['location'] as String?,
      title: json['title'] as String?,
      createdForId: json['createdForId'] as int,
      sportId: json['sportId'] as int,
      sportName: json['sportName'] as String?,
      icon: json['icon'] as String?,
      daysOfWeek: (json['daysOfWeek'] as List<dynamic>)
          .map((e) => DateTime.parse(e as String))
          .toList(),
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
    );

Map<String, dynamic> _$BookingClassToJson(BookingClass instance) =>
    <String, dynamic>{
      'banner': instance.banner,
      'level': instance.level,
      'location': instance.location,
      'id': instance.id,
      'title': instance.title,
      'createdForId': instance.createdForId,
      'sportId': instance.sportId,
      'sportName': instance.sportName,
      'icon': instance.icon,
      'daysOfWeek':
          instance.daysOfWeek.map((e) => e.toIso8601String()).toList(),
      'lat': instance.lat,
      'lon': instance.lon,
    };

TrialClass _$TrialClassFromJson(Map<String, dynamic> json) => TrialClass(
      id: json['id'] as int,
      banner: json['banner'] as String?,
      level: (json['level'] as List<dynamic>?)?.map((e) => e as int).toList(),
      location: json['location'] as String?,
      title: json['title'] as String?,
      createdForId: json['createdForId'] as int,
      sportId: json['sportId'] as int,
      sportName: json['sportName'] as String?,
      icon: json['icon'] as String?,
      daysOfWeek: (json['daysOfWeek'] as List<dynamic>)
          .map((e) => DateTime.parse(e as String))
          .toList(),
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$TrialClassToJson(TrialClass instance) =>
    <String, dynamic>{
      'banner': instance.banner,
      'level': instance.level,
      'location': instance.location,
      'id': instance.id,
      'title': instance.title,
      'createdForId': instance.createdForId,
      'sportId': instance.sportId,
      'sportName': instance.sportName,
      'icon': instance.icon,
      'daysOfWeek':
          instance.daysOfWeek.map((e) => e.toIso8601String()).toList(),
      'lat': instance.lat,
      'lon': instance.lon,
    };

InstallmentData _$InstallmentDataFromJson(Map<String, dynamic> json) =>
    InstallmentData(
      amount: (json['amount'] as num).toDouble(),
      dueNo: json['dueNo'] as int,
      dueUnit: json['dueUnit'] as String,
    );

Map<String, dynamic> _$InstallmentDataToJson(InstallmentData instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'dueNo': instance.dueNo,
      'dueUnit': instance.dueUnit,
    };

MakeUpClassInfo _$MakeUpClassInfoFromJson(Map<String, dynamic> json) =>
    MakeUpClassInfo(
      no_of_makeup_classes: json['no_of_makeup_classes'] as int,
      makeup_class_type: json['makeup_class_type'] as String,
    );

Map<String, dynamic> _$MakeUpClassInfoToJson(MakeUpClassInfo instance) =>
    <String, dynamic>{
      'no_of_makeup_classes': instance.no_of_makeup_classes,
      'makeup_class_type': instance.makeup_class_type,
    };

Plan _$PlanFromJson(Map<String, dynamic> json) => Plan(
      id: json['id'] as int,
      name: json['name'] as String,
      type: json['type'] as String,
      sessions: json['sessions'] as int,
      fees: (json['fees'] as num).toDouble(),
      feesBackup: (json['feesBackup'] as num?)?.toDouble(),
      duration: json['duration'] as int,
      durationUnit: json['durationUnit'] as String,
      paymentType: json['paymentType'] as String,
      installmentData: (json['installmentData'] as List<dynamic>)
          .map((e) => InstallmentData.fromJson(e as Map<String, dynamic>))
          .toList(),
      noOfInstallment: json['noOfInstallment'] as int,
      installmentInterest: json['installmentInterest'] as int,
      hasClass: json['hasClass'] as bool,
      maxClass: json['maxClass'] as int,
      allowAllClasses: json['allowAllClasses'] as bool,
      maxClassInfo: json['maxClassInfo'] as String,
      levels:
          (json['levels'] as List<dynamic>?)?.map((e) => e as String).toList(),
      createdForId: json['createdForId'] as int,
      createdForModule: json['createdForModule'] as String,
      note: json['note'] as String,
      privacy: json['privacy'] as bool,
      autorenew: json['autorenew'] as bool,
      autorenewType: json['autorenewType'] as String,
      makeupClass: json['makeupClass'] as bool,
      makeupClassInfo: json['makeupClassInfo'] == null
          ? null
          : MakeUpClassInfo.fromJson(
              json['makeupClassInfo'] as Map<String, dynamic>),
      trialPlan: json['trialPlan'] as bool,
      restrictStartDate: json['restrictStartDate'] as int,
      restrictDateData: json['restrictDateData'] as Map<String, dynamic>?,
      defaultDueDate: json['defaultDueDate'],
      status: json['status'] as int,
    );

Map<String, dynamic> _$PlanToJson(Plan instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'sessions': instance.sessions,
      'fees': instance.fees,
      'feesBackup': instance.feesBackup,
      'duration': instance.duration,
      'durationUnit': instance.durationUnit,
      'paymentType': instance.paymentType,
      'installmentData': instance.installmentData,
      'noOfInstallment': instance.noOfInstallment,
      'installmentInterest': instance.installmentInterest,
      'hasClass': instance.hasClass,
      'maxClass': instance.maxClass,
      'allowAllClasses': instance.allowAllClasses,
      'maxClassInfo': instance.maxClassInfo,
      'levels': instance.levels,
      'createdForId': instance.createdForId,
      'createdForModule': instance.createdForModule,
      'note': instance.note,
      'privacy': instance.privacy,
      'autorenew': instance.autorenew,
      'autorenewType': instance.autorenewType,
      'makeupClass': instance.makeupClass,
      'makeupClassInfo': instance.makeupClassInfo,
      'trialPlan': instance.trialPlan,
      'restrictStartDate': instance.restrictStartDate,
      'restrictDateData': instance.restrictDateData,
      'defaultDueDate': instance.defaultDueDate,
      'status': instance.status,
    };
