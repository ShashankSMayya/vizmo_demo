import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:vizmo_demo/core/di/di.dart';
import 'package:vizmo_demo/core/routes/route_arguments.dart';
import 'package:vizmo_demo/core/routes/routes.dart';

import '../../presentation/blocs/checkin/checkin_cubit.dart';
import '../../presentation/pages/employee_details_screen.dart';
import '../../presentation/pages/filter_sort_screen.dart';
import '../../presentation/pages/home_screen.dart';

@lazySingleton
class RouteGenerator {
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initial:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const HomeScreen(),
        );
      case Routes.sort:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const FilterSortScreen(),
        );
      case Routes.employeeDetails:
        final args = settings.arguments as EmployeeRouteArguments;
        return MaterialPageRoute(
          settings: settings,
          builder: (_) =>
              BlocProvider(
                create: (context) => getIt<CheckinCubit>()..getCheckins(employeeId: args.employee.id),
                child: EmployeeDetailsScreen(employee: args.employee),
              ),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) =>
              Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
        );
    }
  }
}
