import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vizmo_demo/core/di/di.dart';
import 'package:vizmo_demo/core/routes/route_generator.dart';
import 'package:vizmo_demo/core/routes/routes.dart';
import 'package:vizmo_demo/presentation/blocs/employee/employee_cubit.dart';
import 'package:vizmo_demo/presentation/blocs/employee_sort/employee_sort_cubit.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<EmployeeCubit>()..getEmployees(),
        ),
        BlocProvider(
          create: (context) => getIt<EmployeeSortCubit>(),
        ),
      ],
      child: MaterialApp(
        title: 'Vizmo Demo',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        darkTheme: ThemeData.dark().copyWith(
          useMaterial3: true,
          textTheme: GoogleFonts.robotoTextTheme(),
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red),
        ),
        theme: ThemeData.light().copyWith(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red),
          textTheme: GoogleFonts.robotoTextTheme(),
        ),
        initialRoute: Routes.initial,
        onGenerateRoute: getIt<RouteGenerator>().onGenerateRoute,
      ),
    );
  }
}
