class Student {
  final String code;
  final String fullName;
  final int sex;

  const Student({
    required this.code,
    required this.fullName,
    required this.sex
  });
  
  factory Student.fromJson(Map<String, dynamic> json){
    return Student(code: json['code'], fullName: json['full_name'], sex: json['sex']);
  }
}