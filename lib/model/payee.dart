class Payee {
  final String name;
  final String phone;

  Payee({required this.name, required this.phone});

  factory Payee.fromJson(Map<String, dynamic> json) {
    return Payee(
      name: json['name'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
    };
  }
}
