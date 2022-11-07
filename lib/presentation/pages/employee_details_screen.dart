import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:vizmo_demo/core/utils/error_getter.dart';
import 'package:vizmo_demo/data/models/employee.dart';
import 'package:vizmo_demo/presentation/blocs/checkin/checkin_cubit.dart';
import 'package:vizmo_demo/presentation/widgets/checkin_card.dart';
import 'package:vizmo_demo/presentation/widgets/employee_details_card.dart';

/// Used to show the employee details and checkin details
/// takes in the [Employee] as a parameter
class EmployeeDetailsScreen extends StatelessWidget {
  final Employee employee;

  const EmployeeDetailsScreen({Key? key, required this.employee})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          employee.name,
          maxLines: 1,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              EmployeeDetailsCard(emp: employee),
              const Gap(20),
              BlocBuilder<CheckinCubit, CheckinState>(
                builder: (context, state) {
                  if (state is CheckinError) {
                    return Center(
                      child: Text(
                          ErrorGetter.getError(state.errorType, state.error)),
                    );
                  }
                  if (state is CheckinLoading) {
                    return const Center(
                        child: CircularProgressIndicator.adaptive());
                  }
                  if (state is CheckinLoaded) {
                    if (state.checkins.isEmpty) {
                      return const Center(
                        child: Text('No checkins found'),
                      );
                    }
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Checkin Data',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const Gap(20),
                        // could improve further by converting the whole list to custom scroll view
                        // or using slivers so that scroll performance can be improved.
                        ...state.checkins.map(
                          (e) => CheckinCard(checkin: e),
                        ),
                      ],
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
