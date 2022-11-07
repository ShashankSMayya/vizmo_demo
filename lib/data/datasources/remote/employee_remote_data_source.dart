import 'package:injectable/injectable.dart';
import 'package:vizmo_demo/core/api/api_client.dart';
import 'package:vizmo_demo/core/api/api_constants.dart';
import 'package:vizmo_demo/data/models/checkin.dart';
import 'package:vizmo_demo/domain/entities/params/get_checkin_params.dart';

import '../../models/employee.dart';

abstract class EmployeeRemoteDataSource {
  Future<List<Employee>> getEmployees(Map<String, dynamic> params);

  Future<Employee> getEmployee(Map<String, dynamic> params);

  Future<List<Checkin>> getCheckins(GetCheckinParams params);

  Future<Checkin> getCheckin(GetCheckinParams params);
}

@LazySingleton(as: EmployeeRemoteDataSource)
class EmployeeRemoteDataSourceImpl implements EmployeeRemoteDataSource {
  final ApiClient _client;

  EmployeeRemoteDataSourceImpl(this._client);

  @override
  Future<Checkin> getCheckin(GetCheckinParams params) async {
    final result = await _client.get(
        '${ApiConstants.employees}/${params.employeeId}/checkin/${params.id!}');
    return Checkin.fromJson(result);
  }

  @override
  Future<List<Checkin>> getCheckins(GetCheckinParams params) async {
    final result = await _client
        .get('${ApiConstants.employees}/${params.employeeId}/checkin');
    return (result as List).map((e) => Checkin.fromJson(e)).toList();
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
