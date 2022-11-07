//{ "checkin": "2021-07-14T01:27:49.739Z", "location": "Rancho Cucamonga", "purpose": "deposit transaction at Turcotte - Dickinson using card ending with ***0555 for ZWL 600.08 in account ***59605509", "id": "1", "employeeId": "1" }

import 'package:json_annotation/json_annotation.dart';

part 'checkin.g.dart';

@JsonSerializable()
class Checkin {
  final DateTime checkin;
  final String location;
  final String purpose;
  final String id;
  final String employeeId;

  Checkin({
    required this.checkin,
    required this.location,
    required this.purpose,
    required this.id,
    required this.employeeId,
  });

  factory Checkin.fromJson(Map<String, dynamic> json) =>
      _$CheckinFromJson(json);

  Map<String, dynamic> toJson() => _$CheckinToJson(this);
}
