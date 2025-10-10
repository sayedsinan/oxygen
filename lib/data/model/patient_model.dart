class Patient {
  final int id;
  final String name;
  final String gender;
  final String phone;

  Patient({
    required this.id,
    required this.name,
    required this.gender,
    required this.phone,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      id: json['id'],
      name: json['name'],
      gender: json['gender'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'gender': gender,
        'phone': phone,
      };
}
