import 'package:flutter/material.dart';
import 'package:vizmo_demo/data/models/employee.dart';
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
      body: Column(
        children: [
          EmployeeDetailsCard(emp: employee),
        ],
      ),
    );
  }
}
