import 'package:assignment1/models/demographic_and_guardian_model.dart';

class GuardianData extends DemographicAndGuardianData {
  String role;

  GuardianData({
    required super.fullName,
    required super.address,
    required super.telephone,
    required this.role,
  });

  factory GuardianData.fromJson(Map<String, dynamic> json) {
    return GuardianData(
        fullName: json['fullName'],
        address: json['address'],
        telephone: json['telephone'],
        role: json['role'],
    );
  }
}
