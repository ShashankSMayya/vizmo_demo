import 'package:dartz/dartz.dart';
import 'package:vizmo_demo/domain/entities/params/get_checkin_params.dart';

import '../../core/error/app_error.dart';
import '../../data/models/checkin.dart';
import '../../data/models/employee.dart';

abstract class EmployeeRepository {
  Future<Either<AppError, List<Employee>>> getEmployees(
      Map<String, dynamic> params);

  Future<Either<AppError, Employee>> getEmployee(Map<String, dynamic> params);

  Future<Either<AppError, List<Checkin>>> getCheckins(GetCheckinParams params);

  Future<Either<AppError, Checkin>> getCheckin(Map<String, dynamic> params);
}
