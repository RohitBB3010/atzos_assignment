class Skill {
  int id;
  String name;
  String sportId;

  Skill({required this.id, required this.name, required this.sportId});

  factory Skill.fromJson(Map<String, dynamic> json) {
    return Skill(
        id: int.parse(json['id']),
        name: json['name'],
        sportId: json['sport_id']);
  }
}

class CenterItem {
  int id;
  String title;
  String location;
  String googleFormattedAddress;
  double lat;
  double lon;
  String? stamp;
  String? logo;
  int entityId;
  String entityType;
  int status;

  CenterItem(
      {required this.id,
      required this.title,
      required this.location,
      required this.googleFormattedAddress,
      required this.lat,
      required this.lon,
      this.stamp,
      this.logo,
      required this.entityId,
      required this.entityType,
      required this.status});

  factory CenterItem.fromJson(Map<String, dynamic> json) {
    return CenterItem(
        id: int.parse(json['id']),
        title: json['title'],
        location: json['location'],
        googleFormattedAddress: json['google_formatted_address'],
        lat: double.parse(json['lat']),
        lon: double.parse(json['lon']),
        entityId: int.parse(json['entity_id']),
        entityType: json['entity_type'],
        status: int.parse(json['status']));
  }
}

class Enquiry {
  String name;
  String gender;
  String skill;
  String? center;

  Enquiry({
    required this.name,
    required this.gender,
    required this.skill,
    this.center,
  });

  Map<String, dynamic> enquiryToJson(Enquiry enquiry) => <String, dynamic>{
        'name': enquiry.name,
        'gender': enquiry.gender,
        'skill': enquiry.skill,
        'center': enquiry.center
      };
}
