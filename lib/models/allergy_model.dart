class AllergyData {
  final String name;
  final String reaction;
  final String severity;

  AllergyData(
      {required this.name, required this.reaction, required this.severity});

  factory AllergyData.fromJson(Map<String, dynamic> json) {
    return AllergyData(
      name: json['name'],
      reaction: json['reaction'],
      severity: json['severity'],
    );
  }
}
