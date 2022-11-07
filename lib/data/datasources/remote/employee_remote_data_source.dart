import 'package:injectable/injectable.dart';
import 'package:vizmo_demo/core/api/api_client.dart';
import 'package:vizmo_demo/core/api/api_constants.dart';
import 'package:vizmo_demo/data/models/checkin.dart';

import '../../models/employee.dart';

abstract class EmployeeRemoteDataSource {
  Future<List<Employee>> getEmployees(Map<String, dynamic> params);

  Future<Employee> getEmployee(Map<String, dynamic> params);

  Future<List<Checkin>> getCheckins(Map<String, dynamic> params);

  Future<Checkin> getCheckin(Map<String, dynamic> params);
}

@LazySingleton(as: EmployeeRemoteDataSource)
class EmployeeRemoteDataSourceImpl implements EmployeeRemoteDataSource {
  final ApiClient _client;

  EmployeeRemoteDataSourceImpl(this._client);

  @override
  Future<Checkin> getCheckin(Map<String, dynamic> params) {
    // TODO: implement getCheckin
    throw UnimplementedError();
  }

  @override
  Future<List<Checkin>> getCheckins(Map<String, dynamic> params) {
    // TODO: implement getCheckins
    throw UnimplementedError();
  }

  @override
  Future<Employee> getEmployee(Map<String, dynamic> params) async {
    final result =
        await _client.get(ApiConstants.employees, queryParams: params);
    return Employee.fromJson(result);
  }

  @override
  Future<List<Employee>> getEmployees(Map<String, dynamic> params) async {
    final result =
        await _client.get(ApiConstants.employees, queryParams: params);
    return (result as List).map((e) => Employee.fromJson(e)).toList();
  }
}
