import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:vizmo_demo/core/error/api_calls_with_error.dart';
import 'package:vizmo_demo/core/error/app_error.dart';
import 'package:vizmo_demo/data/datasources/remote/employee_remote_data_source.dart';
import 'package:vizmo_demo/data/models/checkin.dart';
import 'package:vizmo_demo/data/models/employee.dart';
import 'package:vizmo_demo/domain/entities/params/get_checkin_params.dart';
import 'package:vizmo_demo/domain/repositories/employee_repository.dart';

@LazySingleton(as: EmployeeRepository)
class EmployeeRepositoryImpl implements EmployeeRepository {
  final EmployeeRemoteDataSource _remoteDataSource;

  EmployeeRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<AppError, Checkin>> getCheckin(Map<String, dynamic> params) {
    // TODO: implement getCheckin
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, List<Checkin>>> getCheckins(GetCheckinParams params) {
    return ApiCallWithError.call(
        () => _remoteDataSource.getCheckins(params));
  }

  @override
  Future<Either<AppError, Employee>> getEmployee(Map<String, dynamic> params) {
    return ApiCallWithError.call(() => _remoteDataSource.getEmployee(params));
  }

  @override
  Future<Either<AppError, List<Employee>>> getEmployees(
      Map<String, dynamic> params) {
    return ApiCallWithError.call(() => _remoteDataSource.getEmployees(params));
  }
}
