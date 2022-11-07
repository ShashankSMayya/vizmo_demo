import 'package:json_annotation/json_annotation.dart';

part 'get_checkin_params.g.dart';

@JsonSerializable()
class GetCheckinParams {
  ///the employee id associated with the checkins
  final String employeeId;

  ///id of the specific checkin
  final String? id;

  GetCheckinParams({required this.employeeId, this.id});

  factory GetCheckinParams.fromJson(Map<String, dynamic> json) =>
      _$GetCheckinParamsFromJson(json);

  Map<String, dynamic> toJson() => _$GetCheckinParamsToJson(this);
}
