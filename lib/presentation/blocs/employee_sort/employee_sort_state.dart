part of 'employee_sort_cubit.dart';

abstract class EmployeeSortState extends Equatable {
  final OrderBy orderByParam;
  final EmployeeSortBy sortBy;

  const EmployeeSortState({
    this.orderByParam = OrderBy.asc,
    this.sortBy = EmployeeSortBy.id,
  });
}

class EmployeeSortApplied extends EmployeeSortState {
  const EmployeeSortApplied({OrderBy? orderBy, EmployeeSortBy? sortBy})
      : super(
            orderByParam: orderBy ?? OrderBy.asc,
            sortBy: sortBy ?? EmployeeSortBy.id);

  @override
  List<Object> get props => [orderByParam, sortBy];
}
