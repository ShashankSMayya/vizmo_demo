import 'package:intl/intl.dart';

extension FormattedDates on DateTime {
  String get formattedDate => DateFormat('dd MMM yyyy').format(this);

  String get formattedTime => DateFormat('HH:mm').format(this);

  String get formattedDateTime =>
      DateFormat('dd MMM yyyy hh:mm a').format(toLocal());
}
