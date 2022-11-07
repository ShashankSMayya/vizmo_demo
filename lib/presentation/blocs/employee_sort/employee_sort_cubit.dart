import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:vizmo_demo/domain/entities/enums.dart';

part 'employee_sort_state.dart';

@injectable
class EmployeeSortCubit extends Cubit<EmployeeSortState> {
  EmployeeSortCubit() : super(const EmployeeSortApplied());

  void sort({required OrderBy orderBy, required EmployeeSortBy sortBy}) {
    emit(EmployeeSortApplied(orderBy: orderBy, sortBy: sortBy));
  }
}
