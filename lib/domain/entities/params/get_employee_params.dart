import 'package:json_annotation/json_annotation.dart';

import '../enums.dart';

part 'get_employee_params.g.dart';

@JsonSerializable(includeIfNull: false)
class GetEmployeeParams {
  final String? id;

  /// Default page is 1
  final int page;

  /// Default limit is 10
  final int limit;

  /// if [order] is null, it will be set to [OrderBy.asc] indicating ascending order
  @JsonKey(name: 'order')
  final OrderBy? orderBy;

  /// Can be sorted by
  /// [EmployeeSortBy.id], [EmployeeSortBy.name], [EmployeeSortBy.email],
  /// [EmployeeSortBy.phone], [EmployeeSortBy.birthday], [EmployeeSortBy.country],
  /// [EmployeeSortBy.createdAt]
  final EmployeeSortBy? sortBy;

  //TODO add search by  email, phone, country
  final String? name;

  GetEmployeeParams({
    this.id,
    this.page = 1,
    this.limit = 10,
    this.orderBy,
    this.sortBy,
    this.name,
  })  : assert(page > 0, 'page must be greater than 0'),
        assert(limit > 0, 'limit must be greater than 0');

  Map<String, dynamic> toJson() => _$GetEmployeeParamsToJson(this);

  factory GetEmployeeParams.fromJson(Map<String, dynamic> json) =>
      _$GetEmployeeParamsFromJson(json);
}
