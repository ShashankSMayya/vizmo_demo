import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:vizmo_demo/data/models/employee.dart';
import 'package:vizmo_demo/presentation/blocs/checkin/checkin_cubit.dart';
import 'package:vizmo_demo/presentation/widgets/employee_details_card.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EmployeeDetailsCard(emp: employee),
            const Gap(20),
            BlocBuilder<CheckinCubit, CheckinState>(
              builder: (context, state) {
                if (state is CheckinError) {
                  return Text(state.error ?? 'Something went wrong');
                }
                if (state is CheckinLoading) {
                  return const Center(
                      child: CircularProgressIndicator.adaptive());
                }
                if (state is CheckinLoaded) {
                  return Column(
                    children: [
                      Text(
                        'Checkin Data',
                        style: Theme.of(context).textTheme.titleLarge,
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
    );
  }
}
