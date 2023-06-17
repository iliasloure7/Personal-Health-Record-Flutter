class ImmunizationData {
  String name;
  String date;
  String type;
  int dose;
  String instructions;

  ImmunizationData({
    required this.name,
    required this.date,
    required this.type,
    required this.dose,
    required this.instructions,
  });

  factory ImmunizationData.fromJson(Map<String, dynamic> json) {
    return ImmunizationData(
      name: json['name'],
      date: json['date'],
      type: json['type'],
      dose: json['dose'],
      instructions: json['instructions']
    );
  }
}