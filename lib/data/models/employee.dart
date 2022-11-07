//{ "createdAt": "2021-07-07T16:08:06.216Z", "name": "Everett Konopelski", "avatar": "http://placeimg.com/640/480", "email": "Taya_Doyle@yahoo.com", "phone": "(790) 287-1649", "department": [ "b" ], "birthday": "1997-05-06T14:11:31.947Z", "country": "Pitcairn Islands", "id": "1" }

import 'package:json_annotation/json_annotation.dart';

part 'employee.g.dart';

@JsonSerializable()
class Employee {
  final DateTime createdAt;
  final String name;
  final String avatar;
  final String email;
  final String phone;
  final List<String> department;
  final DateTime birthday;
  final String country;
  final String id;

  Employee({
    required this.createdAt,
    required this.name,
    required this.avatar,
    required this.email,
    required this.phone,
    required this.department,
    required this.birthday,
    required this.country,
    required this.id,
  });

  factory Employee.fromJson(Map<String, dynamic> json) =>
      _$EmployeeFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeToJson(this);
}
