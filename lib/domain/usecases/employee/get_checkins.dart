import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:vizmo_demo/core/error/app_error.dart';
import 'package:vizmo_demo/core/usecase/usecase.dart';
import 'package:vizmo_demo/data/models/checkin.dart';
import 'package:vizmo_demo/domain/entities/params/get_checkin_params.dart';
import 'package:vizmo_demo/domain/repositories/employee_repository.dart';

@injectable
class GetCheckins extends UseCase<List<Checkin>, GetCheckinParams> {
  final EmployeeRepository _repository;

  GetCheckins(this._repository);

  @override
  Future<Either<AppError, List<Checkin>>> call(GetCheckinParams params) =>
      _repository.getCheckins(params);
}
