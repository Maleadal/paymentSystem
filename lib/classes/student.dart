class Student {
  final String code;
  final String fullName;
  final int sex;
  final bool isPaid;

  const Student(
      {required this.isPaid,
      required this.code,
      required this.fullName,
      required this.sex});

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      isPaid: false,
      code: json['code'],
      fullName: json['full_name'],
      sex: json['sex'],
    );
  }
}
