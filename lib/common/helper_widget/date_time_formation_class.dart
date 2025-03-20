import 'package:intl/intl.dart';

class DateTimeFormationClass {
  // Format date to "dd MMMM yyyy" (e.g., 25 January 2025)
  static String formatDate(DateTime? dateTime) {
    try {
      if (dateTime == null) return ''; // Return empty string if null
      return DateFormat('dd MMMM yyyy').format(dateTime);
    } catch (e) {
      return ''; // Fallback if formatting fails
    }
  }

  static String formatTime(String startTime, String endTime) {
    try {
      final start = DateFormat('HH:mm').parse(startTime);
      final end = DateFormat('HH:mm').parse(endTime);
      return '${DateFormat('h:mm a').format(start)} - ${DateFormat('h:mm a').format(end)}';
    } catch (e) {
      return '$startTime - $endTime'; // Fallback if parsing fails
    }
  }

  static String formatDateTime(DateTime dateTime) {
    return DateFormat('dd MMM yyyy, h:mm a').format(dateTime); // e.g., 25 Jan 2025, 2:00 PM
  }
}