part of 'checkin_cubit.dart';

abstract class CheckinState extends Equatable {
  const CheckinState();
}

class CheckinInitial extends CheckinState {
  @override
  List<Object> get props => [];
}

class CheckinLoading extends CheckinState {
  @override
  List<Object> get props => [];
}

class CheckinLoaded extends CheckinState {
  final List<Checkin> checkins;

  const CheckinLoaded(this.checkins);

  @override
  List<Object> get props => [checkins];
}

class CheckinError extends CheckinState {
  final AppErrorType errorType;
  final String? error;

  const CheckinError(this.errorType, this.error);

  @override
  List<Object?> get props => [errorType, error];
}
