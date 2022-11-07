import 'package:json_annotation/json_annotation.dart';

enum OrderBy {
  @JsonValue('asc')
  asc,
  @JsonValue('desc')
  desc;

  @override
  String toString() {
    switch (this) {
      case OrderBy.asc:
        return 'Ascending';
      case OrderBy.desc:
        return 'Descending';
      default:
        return 'Ascending';
    }
  }
}

enum EmployeeSortBy {
  @JsonValue('id')
  id,
  @JsonValue('name')
  name,
  @JsonValue('email')
  email,
  @JsonValue('phone')
  department,
  @JsonValue('birthday')
  birthday,
  @JsonValue('country')
  country,
  @JsonValue('createdAt')
  createdAt,
  @JsonValue('phone')
  phone;

  @override
  String toString() {
    switch (this) {
      case EmployeeSortBy.id:
        return 'ID';
      case EmployeeSortBy.name:
        return 'Name';
      case EmployeeSortBy.email:
        return 'Email';
      case EmployeeSortBy.department:
        return 'Department';
      case EmployeeSortBy.birthday:
        return 'Birthday';
      case EmployeeSortBy.country:
        return 'Country';
      case EmployeeSortBy.createdAt:
        return 'Created At';
      case EmployeeSortBy.phone:
        return 'Phone';
      default:
        return 'ID';
    }
  }
}
