// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/datasources/remote/employee_remote_data_source.dart' as _i5;
import '../../data/repositories/employee_repository_impl.dart' as _i7;
import '../../domain/repositories/employee_repository.dart' as _i6;
import '../../domain/usecases/employee/get_employees.dart' as _i8;
import '../../presentation/blocs/employee/employee_cubit.dart' as _i9;
import '../api/api_client.dart' as _i4;
import 'di_module.dart' as _i10; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final injectionModule = _$InjectionModule();
  gh.factory<String>(
    () => injectionModule.baseUrl,
    instanceName: 'baseUrl',
  );
  gh.lazySingleton<_i3.Dio>(
      () => injectionModule.dio(get<String>(instanceName: 'baseUrl')));
  gh.lazySingleton<_i4.ApiClient>(() => _i4.ApiClient(get<_i3.Dio>()));
  gh.lazySingleton<_i5.EmployeeRemoteDataSource>(
      () => _i5.EmployeeRemoteDataSourceImpl(get<_i4.ApiClient>()));
  gh.lazySingleton<_i6.EmployeeRepository>(
      () => _i7.EmployeeRepositoryImpl(get<_i5.EmployeeRemoteDataSource>()));
  gh.factory<_i8.GetEmployees>(
      () => _i8.GetEmployees(get<_i6.EmployeeRepository>()));
  gh.factory<_i9.EmployeeCubit>(
      () => _i9.EmployeeCubit(get<_i8.GetEmployees>()));
  return get;
}

class _$InjectionModule extends _i10.InjectionModule {}
