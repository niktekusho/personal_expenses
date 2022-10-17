import 'package:intl/intl.dart';

/// Returns the date in the format 'yyyy-xx-xx'.
String formatDate(DateTime dateTime) {
  return DateFormat.yMEd().format(dateTime);
}
