import 'package:json_annotation/json_annotation.dart';

enum Order {
  @JsonValue('asc')
  asc,
  @JsonValue('desc')
  desc,
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
  phone,
}
