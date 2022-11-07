// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Employee _$EmployeeFromJson(Map<String, dynamic> json) => Employee(
      createdAt: DateTime.parse(json['createdAt'] as String),
      name: json['name'] as String,
      avatar: json['avatar'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      department: (json['department'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      birthday: DateTime.parse(json['birthday'] as String),
      country: json['country'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$EmployeeToJson(Employee instance) => <String, dynamic>{
      'createdAt': instance.createdAt.toIso8601String(),
      'name': instance.name,
      'avatar': instance.avatar,
      'email': instance.email,
      'phone': instance.phone,
      'department': instance.department,
      'birthday': instance.birthday.toIso8601String(),
      'country': instance.country,
      'id': instance.id,
    };
