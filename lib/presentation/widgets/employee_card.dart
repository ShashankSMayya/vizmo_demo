import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:vizmo_demo/data/models/employee.dart';

import '../../core/routes/route_arguments.dart';
import '../../core/routes/routes.dart';

/// Used to show the employee details in the listview.
/// takes in the [Employee] as a parameter
class EmployeeCard extends StatelessWidget {
  final Employee emp;

  const EmployeeCard({Key? key, required this.emp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(emp.name),
        subtitle: Text(emp.email),
        leading: Hero(
          tag: emp.id,
          child: CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(emp.avatar),
          ),
        ),
        onTap: () => Navigator.pushNamed(
          context,
          Routes.employeeDetails,
          arguments: EmployeeRouteArguments(emp),
        ),
      ),
    );
  }
}
