// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_employee_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetEmployeeParams _$GetEmployeeParamsFromJson(Map<String, dynamic> json) =>
    GetEmployeeParams(
      id: json['id'] as String?,
      page: json['page'] as int? ?? 1,
      limit: json['limit'] as int? ?? 10,
      orderBy: $enumDecodeNullable(_$OrderEnumMap, json['order']),
      sortBy: $enumDecodeNullable(_$EmployeeSortByEnumMap, json['sortBy']),
    );

Map<String, dynamic> _$GetEmployeeParamsToJson(GetEmployeeParams instance) =>
    <String, dynamic>{
      'id': instance.id,
      'page': instance.page,
      'limit': instance.limit,
      'order': _$OrderEnumMap[instance.orderBy],
      'sortBy': _$EmployeeSortByEnumMap[instance.sortBy],
    };

const _$OrderEnumMap = {
  Order.asc: 'asc',
  Order.desc: 'desc',
};

const _$EmployeeSortByEnumMap = {
  EmployeeSortBy.id: 'id',
  EmployeeSortBy.name: 'name',
  EmployeeSortBy.email: 'email',
  EmployeeSortBy.department: 'phone',
  EmployeeSortBy.birthday: 'birthday',
  EmployeeSortBy.country: 'country',
  EmployeeSortBy.createdAt: 'createdAt',
  EmployeeSortBy.phone: 'phone',
};
