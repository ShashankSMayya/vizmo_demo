import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:vizmo_demo/core/error/app_error.dart';

import '../../../data/models/checkin.dart';
import '../../../domain/entities/params/get_checkin_params.dart';
import '../../../domain/usecases/employee/get_checkins.dart';

part 'checkin_state.dart';

@injectable
class CheckinCubit extends Cubit<CheckinState> {
  final GetCheckins _getCheckins;

  CheckinCubit(this._getCheckins) : super(CheckinInitial());

  void getCheckins({required String employeeId}) async {
    emit(CheckinLoading());
    final response =
        await _getCheckins(GetCheckinParams(employeeId: employeeId));
    emit(response.fold(
        (l) => CheckinError(l.errorType, l.error), (r) => CheckinLoaded(r)));
  }
}
