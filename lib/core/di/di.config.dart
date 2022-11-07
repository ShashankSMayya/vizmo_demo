// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/datasources/remote/employee_remote_data_source.dart' as _i7;
import '../../data/repositories/employee_repository_impl.dart' as _i9;
import '../../domain/repositories/employee_repository.dart' as _i8;
import '../../domain/usecases/employee/get_employees.dart' as _i10;
import '../../presentation/blocs/employee/employee_cubit.dart' as _i11;
import '../../presentation/blocs/employee_sort/employee_sort_cubit.dart' as _i3;
import '../api/api_client.dart' as _i6;
import '../routes/route_generator.dart' as _i4;
import 'di_module.dart' as _i12; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i3.EmployeeSortCubit>(() => _i3.EmployeeSortCubit());
  gh.lazySingleton<_i4.RouteGenerator>(() => _i4.RouteGenerator());
  gh.factory<String>(
    () => injectionModule.baseUrl,
    instanceName: 'baseUrl',
  );
  gh.lazySingleton<_i5.Dio>(
      () => injectionModule.dio(get<String>(instanceName: 'baseUrl')));
  gh.lazySingleton<_i6.ApiClient>(() => _i6.ApiClient(get<_i5.Dio>()));
  gh.lazySingleton<_i7.EmployeeRemoteDataSource>(
      () => _i7.EmployeeRemoteDataSourceImpl(get<_i6.ApiClient>()));
  gh.lazySingleton<_i8.EmployeeRepository>(
      () => _i9.EmployeeRepositoryImpl(get<_i7.EmployeeRemoteDataSource>()));
  gh.factory<_i10.GetEmployees>(
      () => _i10.GetEmployees(get<_i8.EmployeeRepository>()));
  gh.factory<_i11.EmployeeCubit>(
      () => _i11.EmployeeCubit(get<_i10.GetEmployees>()));
  return get;
}

class _$InjectionModule extends _i12.InjectionModule {}
