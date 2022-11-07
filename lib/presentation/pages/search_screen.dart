import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vizmo_demo/core/routes/route_arguments.dart';
import 'package:vizmo_demo/core/routes/routes.dart';

import '../../core/utils/debouncer.dart';
import '../blocs/employee/employee_cubit.dart';

class SearchScreen extends SearchDelegate {
  final EmployeeCubit _employeeCubit;
  final Debouncer _debouncer;

  SearchScreen(this._employeeCubit, this._debouncer)
      : super(searchFieldLabel: 'Search');

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, '');
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return BlocBuilder<EmployeeCubit, EmployeeState>(
      bloc: _employeeCubit..searchEmployee(name: query),
      builder: (context, state) => _buildSearchResult(context, state),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return const Center(
        child: Text('Search for Employees by name'),
      );
    }

    _debouncer.run(() {
      _employeeCubit.searchEmployee(name: query);
    });
    return BlocBuilder<EmployeeCubit, EmployeeState>(
      bloc: _employeeCubit,
      builder: (context, state) => _buildSearchResult(context, state),
    );
  }

  Widget _buildSearchResult(BuildContext context, EmployeeState state) {
    if (state is EmployeeLoading) {
      return const Center(
        child: CircularProgressIndicator.adaptive(),
      );
    }
    if (state is EmployeeLoadError) {
      return const Center(
        child: Text('Something went wrong'),
      );
    }
    if (state.employees.isEmpty) {
      return const Center(
        child: Text('No results found'),
      );
    }
    return ListView.builder(
      itemBuilder: (context, index) {
        final emp = state.employees[index];
        return ListTile(
          title: Text(emp.name),
          onTap: () => Navigator.pushNamed(
            context,
            Routes.employeeDetails,
            arguments: EmployeeRouteArguments(emp),
          ),
        );
      },
      itemCount: state.employees.length,
    );
  }
}
