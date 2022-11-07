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
      orderBy: $enumDecodeNullable(_$OrderByEnumMap, json['order']),
      sortBy: $enumDecodeNullable(_$EmployeeSortByEnumMap, json['sortBy']),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$GetEmployeeParamsToJson(GetEmployeeParams instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['page'] = instance.page;
  val['limit'] = instance.limit;
  writeNotNull('order', _$OrderByEnumMap[instance.orderBy]);
  writeNotNull('sortBy', _$EmployeeSortByEnumMap[instance.sortBy]);
  writeNotNull('name', instance.name);
  return val;
}

const _$OrderByEnumMap = {
  OrderBy.asc: 'asc',
  OrderBy.desc: 'desc',
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
