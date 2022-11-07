// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Checkin _$CheckinFromJson(Map<String, dynamic> json) => Checkin(
      checkin: DateTime.parse(json['checkin'] as String),
      location: json['location'] as String,
      purpose: json['purpose'] as String,
      id: json['id'] as String,
      employeeId: json['employeeId'] as String,
    );

Map<String, dynamic> _$CheckinToJson(Checkin instance) => <String, dynamic>{
      'checkin': instance.checkin.toIso8601String(),
      'location': instance.location,
      'purpose': instance.purpose,
      'id': instance.id,
      'employeeId': instance.employeeId,
    };
