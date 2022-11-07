import 'package:dartz/dartz.dart';
import 'package:vizmo_demo/domain/entities/params/get_checkin_params.dart';

import '../../core/error/app_error.dart';
import '../../data/models/checkin.dart';
import '../../data/models/employee.dart';

abstract class EmployeeRepository {
  /// Get all employees based on the given params
  Future<Either<AppError, List<Employee>>> getEmployees(
      Map<String, dynamic> params);

  /// Get a single employee based on the given params ideally the id as the api supports this.
  Future<Either<AppError, Employee>> getEmployee(Map<String, dynamic> params);

  /// Get all checkins for a given employee
  Future<Either<AppError, List<Checkin>>> getCheckins(GetCheckinParams params);

  /// Get a single checkin for a given employee with checkinId named as id in the params
  Future<Either<AppError, Checkin>> getCheckin(GetCheckinParams params);
}
