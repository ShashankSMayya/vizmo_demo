part of 'employee_cubit.dart';

abstract class EmployeeState extends Equatable {
  final List<Employee> employees;
  final bool isLastPage;

  const EmployeeState({this.employees = const [], this.isLastPage = false});
}

class EmployeeInitial extends EmployeeState {
  @override
  List<Object> get props => [];
}

class EmployeeLoading extends EmployeeState {
  @override
  List<Object> get props => [];
}

class EmployeeLoaded extends EmployeeState {
  const EmployeeLoaded(List<Employee> employees, {bool isLastPage = false})
      : super(employees: employees, isLastPage: isLastPage);

  @override
  List<Object> get props => [employees, isLastPage];
}

class EmployeeLoadError extends EmployeeState {
  final AppErrorType errorType;
  final String? error;

  const EmployeeLoadError(this.errorType, this.error);

  @override
  List<Object?> get props => [errorType, error];
}
