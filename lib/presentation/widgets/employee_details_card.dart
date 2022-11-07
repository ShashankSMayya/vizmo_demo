import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:vizmo_demo/core/extensions.dart';
import 'package:vizmo_demo/data/models/employee.dart';
import 'package:vizmo_demo/presentation/widgets/two_row_text.dart';

/// Used to show the employee details
/// takes in the [Employee] as a parameter
class EmployeeDetailsCard extends StatelessWidget {
  final Employee emp;

  const EmployeeDetailsCard({Key? key, required this.emp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: emp.id,
                  child: CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(emp.avatar),
                    radius: 40,
                  ),
                ),
                const Gap(20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        emp.name,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      const Gap(10),
                      TwoRowText(title: 'Email', info: emp.email),
                      const Gap(10),
                      TwoRowText(title: 'Phone', info: emp.phone),
                      const Gap(10),
                      TwoRowText(title: 'Country', info: emp.country),
                      const Gap(10),
                      TwoRowText(
                          title: 'Date of Birth',
                          info: emp.birthday.formattedDate),
                      const Gap(10),
                      TwoRowText(
                          title: 'Date of Joining',
                          info: emp.createdAt.formattedDate),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
