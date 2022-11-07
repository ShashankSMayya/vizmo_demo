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

  String _oldSearch = '';

  Future<void> getEmployees({
    bool? isFirstFetch,
    OrderBy? orderBy,
    EmployeeSortBy? sortBy,
  }) async {
    // prevent multiple calls to the api at once when user scrolls
    if (state is EmployeeLoading) {
      return;
    }
    List<Employee> oldEmployees = List.from(state.employees);
    // if this is the first fetch, reset the page number and clear the list
    if (isFirstFetch == true) {
      _page = 1;
      oldEmployees.clear();
    }
    // store orderBy and sortBy so that one next page call, we can use the same and maintain state.
    _orderBy = orderBy ?? _orderBy;
    _sortBy = sortBy ?? _sortBy;
    emit(EmployeeLoading(oldEmployees: oldEmployees));
    final res = await _getEmployees(GetEmployeeParams(
        page: _page, limit: _limit, orderBy: _orderBy, sortBy: _sortBy));
    res.fold(
      (l) => emit(
          EmployeeLoadError(l.errorType, l.error, employees: oldEmployees)),
      (r) {
        // if the api returns an empty list, we have reached the end of the list.
        // could also improve this by checking if the length of the list is less than the limit
        if (r.isEmpty) {
          return emit(EmployeeLoaded(oldEmployees, isLastPage: true));
        }
        _page++;
        // print('page: $_page');
        oldEmployees.addAll(r);
        emit(EmployeeLoaded(oldEmployees));
      },
    );
    return;
  }

  // used to search the employees by name in search screen
  // can add other parameters too.
  void searchEmployee({required String name}) async {
    // if the search query is the same as the previous one, don't call the api

    if (name == _oldSearch) return;
    _oldSearch = name;
    emit(const EmployeeLoading());
    final res = await _getEmployees(GetEmployeeParams(
      name: name,
    ));
    emit(res.fold((l) => EmployeeLoadError(l.errorType, l.error),
        (r) => EmployeeLoaded(r)));
  }
}
