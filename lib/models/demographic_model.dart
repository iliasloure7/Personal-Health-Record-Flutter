import 'package:assignment1/models/demographic_and_guardian_model.dart';

class DemographicData extends DemographicAndGuardianData {
  String gender;
  String martialStatus;
  String religion;
  String ethnicity;
  String language;
  String birthday;

  DemographicData(
      {required super.fullName,
      required super.address,
      required super.telephone,
      required this.gender,
      required this.martialStatus,
      required this.religion,
      required this.ethnicity,
      required this.language,
      required this.birthday});

  factory DemographicData.fromJson(Map<String, dynamic> json) {
    return DemographicData(
      fullName: json['fullName'],
      address: json['address'],
      telephone: json['telephone'],
      gender: json['gender'],
      martialStatus: json['martialStatus'],
      religion: json['religion'],
      ethnicity: json['ethnicity'],
      language: json['language'],
      birthday: json['birthday'],
    );
  }
}
