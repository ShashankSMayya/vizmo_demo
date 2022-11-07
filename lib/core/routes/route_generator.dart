import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:vizmo_demo/core/routes/routes.dart';

import '../../presentation/pages/filter_sort_screen.dart';
import '../../presentation/pages/home_screen.dart';

@lazySingleton
class RouteGenerator {
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initial:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.sort:
        return MaterialPageRoute(builder: (_) => const FilterSortScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
