import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vizmo_demo/presentation/blocs/employee/employee_cubit.dart';

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
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent - 200 &&
        !empCubit.state.isLastPage) {
      empCubit.getEmployees();
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<EmployeeCubit, EmployeeState>(
      builder: (context, state) {
        if (state is EmployeeLoading && state.employees.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is EmployeeLoadError && state.employees.isEmpty) {
          return Center(
            child: Text('Error: ${state.error ?? 'Something went wrong'}'),
          );
        }

        return ListView.builder(
          controller: _scrollController,
          itemBuilder: (context, index) {
            final emp = state.employees[index];
            return ListTile(
              title: Text(emp.name),
              subtitle: Text(emp.email),
              leading: CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(emp.avatar),
              ),
            );
          },
          itemCount: state.employees.length,
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
