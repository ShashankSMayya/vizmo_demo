import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TwoRowText extends StatelessWidget {
  final String title;
  final String info;

  const TwoRowText({Key? key, required this.title, required this.info})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.grey),
          ),
        ),
        const Gap(10),
        Text(':',
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.grey)),
        const Gap(10),
        Expanded(
          flex: 2,
          child: Text(
            info,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
