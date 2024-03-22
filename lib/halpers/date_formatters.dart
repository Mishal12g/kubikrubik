import 'package:intl/intl.dart';

class DateFormattes {
  static String dateAndTime() {
    DateTime now = DateTime.now();

    String formattedDate = DateFormat('dd.MM.yyyy').format(now);
    String formattedTime = DateFormat('HH:mm').format(now);

    final dateString = "$formattedDate $formattedTime";

    return dateString;
  }
}
