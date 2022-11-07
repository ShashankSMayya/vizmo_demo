import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:vizmo_demo/core/error/app_error.dart';
import 'package:vizmo_demo/core/usecase/usecase.dart';
import 'package:vizmo_demo/data/models/employee.dart';
import 'package:vizmo_demo/domain/entities/params/get_employee_params.dart';

import '../../repositories/employee_repository.dart';

@injectable
class GetEmployees extends UseCase<List<Employee>, GetEmployeeParams> {
  final EmployeeRepository _employeeRepository;

  GetEmployees(this._employeeRepository);

  @override
  Future<Either<AppError, List<Employee>>> call(GetEmployeeParams params) =>
      _employeeRepository.getEmployees(params.toJson());
}
