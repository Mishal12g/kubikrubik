import 'package:intl/intl.dart';

class Formattes {
  static String dateAndTime() {
    DateTime now = DateTime.now();

    String formattedDate = DateFormat('dd.MM.yyyy').format(now);
    String formattedTime = DateFormat('HH:mm').format(now);

    final dateString = "$formattedDate $formattedTime";

    return dateString;
  }

  static String formatDuration(int seconds) {
    int hours = seconds ~/ 3600;
    int minutes = (seconds ~/ 60) % 60;
    int remainingSeconds = seconds % 60;

    if (hours > 0) {
      return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
    } else {
      return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
    }
  }

  static int parseDuration(String timeString) {
    List<String> components = timeString.split(':');

    if (components.length == 2) {
      int minutes = int.tryParse(components[0]) ?? 0;
      int seconds = int.tryParse(components[1]) ?? 0;
      return minutes * 60 + seconds;
    } else if (components.length == 3) {
      int hours = int.tryParse(components[0]) ?? 0;
      int minutes = int.tryParse(components[1]) ?? 0;
      int seconds = int.tryParse(components[2]) ?? 0;
      return hours * 3600 + minutes * 60 + seconds;
    } else {
      return 0;
    }
  }
}
