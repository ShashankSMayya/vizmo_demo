import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:vizmo_demo/core/extensions.dart';
import 'package:vizmo_demo/data/models/checkin.dart';
import 'package:vizmo_demo/presentation/widgets/two_row_text.dart';

class CheckinCard extends StatelessWidget {
  final Checkin checkin;

  const CheckinCard({Key? key, required this.checkin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(checkin.location),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(10),
            Text(checkin.checkin.formattedDateTime),
            const Gap(20),
            TwoRowText(title: 'Purpose', info: checkin.purpose),
            const Gap(10),
          ],
        ),
        isThreeLine: true,
        leading: CircleAvatar(
          child: Text('#${checkin.id}'),
        ),
      ),
    );
  }
}
