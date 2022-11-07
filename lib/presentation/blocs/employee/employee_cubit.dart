import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:vizmo_demo/core/error/app_error.dart';
import 'package:vizmo_demo/domain/entities/enums.dart';
import 'package:vizmo_demo/domain/entities/params/get_employee_params.dart';

import '../../../data/models/employee.dart';
import '../../../domain/usecases/employee/get_employees.dart';

part 'employee_state.dart';

@injectable
class EmployeeCubit extends Cubit<EmployeeState> {
  final GetEmployees _getEmployees;

  EmployeeCubit(this._getEmployees) : super(EmployeeInitial());

  int _page = 1;
  final int _limit = 10;
  OrderBy _orderBy = OrderBy.asc;
  EmployeeSortBy _sortBy = EmployeeSortBy.id;

  void getEmployees({
    bool? isFirstFetch,
    OrderBy? orderBy,
    EmployeeSortBy? sortBy,
  }) async {
    if (state is EmployeeLoading) {
      return;
    }
    List<Employee> oldEmployees = List.from(state.employees);
    if (isFirstFetch == true) {
      _page = 1;
      oldEmployees.clear();
    }
    _orderBy = orderBy ?? _orderBy;
    _sortBy = sortBy ?? _sortBy;
    emit(EmployeeLoading(oldEmployees: oldEmployees));
    final res = await _getEmployees(GetEmployeeParams(
        page: _page, limit: _limit, orderBy: _orderBy, sortBy: _sortBy));
    res.fold(
      (l) => emit(
          EmployeeLoadError(l.errorType, l.error, employees: oldEmployees)),
      (r) {
        if (r.isEmpty) {
          return emit(EmployeeLoaded(oldEmployees, isLastPage: true));
        }
        _page++;
        print('page: $_page');
        oldEmployees.addAll(r);
        emit(EmployeeLoaded(oldEmployees));
      },
    );
  }
}
