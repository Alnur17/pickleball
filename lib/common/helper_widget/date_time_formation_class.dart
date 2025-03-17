// File: lib/common/utils/date_utils.dart
import 'package:intl/intl.dart';

class DateTimeFormationClass {
  // Format date to "dd MMMM yyyy" (e.g., 25 January 2025)
  static String formatDate(String dateString) {
    try {
      final dateTime = DateTime.parse(dateString);
      return DateFormat('dd MMMM yyyy').format(dateTime);
    } catch (e) {
      return dateString; // Return original string if parsing fails
    }
  }

  // Format time range to "h:mm a - h:mm a" (e.g., 2:00 PM - 3:00 PM)
  static String formatTime(String startTime, String endTime) {
    try {
      final start = DateFormat('HH:mm').parse(startTime);
      final end = DateFormat('HH:mm').parse(endTime);
      return '${DateFormat('h:mm a').format(start)} - ${DateFormat('h:mm a').format(end)}';
    } catch (e) {
      return '$startTime - $endTime'; // Fallback if parsing fails
    }
  }

  // Optional: Add more formatting methods as needed
  static String formatDateTime(DateTime dateTime) {
    return DateFormat('dd MMM yyyy, h:mm a').format(dateTime); // e.g., 25 Jan 2025, 2:00 PM
  }
}