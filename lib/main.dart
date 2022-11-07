import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vizmo_demo/core/di/di.dart';
import 'package:vizmo_demo/presentation/blocs/employee/employee_cubit.dart';
import 'package:vizmo_demo/presentation/pages/home_screen.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<EmployeeCubit>()..getEmployees(),
      child: MaterialApp(
        title: 'Vizmo Demo',
        home: HomeScreen(),
      ),
    );
  }
}
