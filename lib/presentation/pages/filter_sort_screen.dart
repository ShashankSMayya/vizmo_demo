import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vizmo_demo/domain/entities/enums.dart';

import '../blocs/employee_sort/employee_sort_cubit.dart';

class FilterSortScreen extends StatefulWidget {
  const FilterSortScreen({Key? key}) : super(key: key);

  @override
  State<FilterSortScreen> createState() => _FilterSortScreenState();
}

class _FilterSortScreenState extends State<FilterSortScreen> {
  OrderBy _orderBy = OrderBy.asc;
  EmployeeSortBy _employeeSortBy = EmployeeSortBy.id;

  @override
  void didChangeDependencies() {
    final empSortCubit = context.read<EmployeeSortCubit>();
    _orderBy = empSortCubit.state.orderByParam;
    _employeeSortBy = empSortCubit.state.sortBy;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sort by'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order by',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Wrap(
              children: List.generate(
                OrderBy.values.length,
                (index) => Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2.0, horizontal: 6),
                  child: ChoiceChip(
                      selectedColor: Theme.of(context).primaryColor,
                      label: Text(
                        OrderBy.values[index].toString(),
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            color: _orderBy == OrderBy.values[index]
                                ? Colors.white
                                : Colors.black),
                      ),
                      onSelected: (value) {
                        setState(() {
                          _orderBy = OrderBy.values[index];
                        });
                      },
                      selected: _orderBy == OrderBy.values[index]),
                ),
              ),
            ),
            const Divider(),
            Text('Sort by', style: Theme.of(context).textTheme.titleMedium),
            Wrap(
              children: List.generate(
                EmployeeSortBy.values.length,
                (index) => Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2.0, horizontal: 6),
                  child: ChoiceChip(
                      selectedColor: Theme.of(context).primaryColor,
                      label: Text(
                        EmployeeSortBy.values[index].toString(),
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            color:
                                _employeeSortBy == EmployeeSortBy.values[index]
                                    ? Colors.white
                                    : Colors.black),
                      ),
                      onSelected: (value) {
                        setState(() {
                          _employeeSortBy = EmployeeSortBy.values[index];
                        });
                      },
                      selected:
                          _employeeSortBy == EmployeeSortBy.values[index]),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton.icon(
        onPressed: () {
          context
              .read<EmployeeSortCubit>()
              .sort(orderBy: _orderBy, sortBy: _employeeSortBy);
          Navigator.of(context).pop();
        },
        icon: const Icon(
          Icons.check,
        ),
        label: const Text('Apply'),
      ),
    );
  }
}
