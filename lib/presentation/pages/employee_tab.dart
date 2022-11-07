import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vizmo_demo/core/routes/routes.dart';
import 'package:vizmo_demo/core/utils/error_getter.dart';
import 'package:vizmo_demo/presentation/blocs/employee/employee_cubit.dart';
import 'package:vizmo_demo/presentation/blocs/employee_sort/employee_sort_cubit.dart';
import 'package:vizmo_demo/presentation/widgets/employee_card.dart';

import '../../core/error/app_error.dart';

class EmployeeTab extends StatefulWidget {
  const EmployeeTab({Key? key}) : super(key: key);

  @override
  State<EmployeeTab> createState() => _EmployeeTabState();
}

class _EmployeeTabState extends State<EmployeeTab>
    with AutomaticKeepAliveClientMixin {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final empCubit = context.read<EmployeeCubit>();
    // print(_scrollController.position.pixels);
    // print('Max ${_scrollController.position.maxScrollExtent}');

    //Used for pagination && if the last page is not true we call getEmployees Again
    if (_scrollController.position.maxScrollExtent -
                _scrollController.position.pixels <
            100 &&
        !empCubit.state.isLastPage) {
      empCubit.getEmployees();
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return RefreshIndicator(
      //On Refresh we call getEmployees again and reset the state to newFetch
      onRefresh: () =>
          context.read<EmployeeCubit>().getEmployees(isFirstFetch: true),
      child: BlocListener<EmployeeSortCubit, EmployeeSortState>(
        listener: (context, state) {
          context.read<EmployeeCubit>().getEmployees(
              isFirstFetch: true,
              orderBy: state.orderByParam,
              sortBy: state.sortBy);
        },
        child: BlocBuilder<EmployeeCubit, EmployeeState>(
          builder: (context, state) {
            // we use these to show the loading or error part in the end of infinite scroll
            // If [isLoading] is true we show the loading indicator at the end of the list
            // If [loadError] is true we show the error message at the end of the list and option to retry the previous call
            bool isLoading = false;
            bool loadError = false;
            AppErrorType errorType = AppErrorType.api;
            if (state is EmployeeLoading && state.employees.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is EmployeeLoadError && state.employees.isEmpty) {
              return Center(
                child: Text(
                  ErrorGetter.getError(state.errorType, state.error),
                ),
              );
            }
            state is EmployeeLoading ? isLoading = true : null;
            state is EmployeeLoadError
                ? () {
                    loadError = true;
                    errorType = state.errorType;
                  }
                : null;

            final employees = state.employees;

            return Column(
              children: [
                //Sort functionality
                Row(
                  children: [
                    TextButton.icon(
                      onPressed: () =>
                          Navigator.pushNamed(context, Routes.sort),
                      label: const Text('Sort'),
                      icon: const Icon(Icons.sort),
                    )
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    itemBuilder: (context, index) {
                      if (index < employees.length) {
                        final emp = employees[index];
                        return EmployeeCard(emp: emp);
                      } else {
                        // the part where we show the loading or error part in the end of infinite scroll
                        return loadError
                            ? _errorWidget(errorType)
                            : _loadingIndicator();
                      }
                    },
                    itemCount:
                        employees.length + (isLoading || loadError ? 1 : 0),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _loadingIndicator() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }

  Widget _errorWidget(AppErrorType appErrorType) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            appErrorType == AppErrorType.network
                ? 'No Internet Connection'
                : 'Something went wrong',
            textAlign: TextAlign.center,
          ),
          IconButton(
              onPressed: () => context.read<EmployeeCubit>().getEmployees(),
              icon: const Icon(
                Icons.refresh,
              ))
        ],
      );

  @override
  bool get wantKeepAlive => true;
}
