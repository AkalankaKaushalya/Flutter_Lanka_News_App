class Helper {
  // Helper method to format date
  static String formatDate(String dateString) {
    try {
      final DateTime parsedDate = DateTime.parse(dateString);
      final Duration difference = DateTime.now().difference(parsedDate);

      if (difference.inDays == 0) {
        return 'today';
      } else if (difference.inDays == 1) {
        return '1 day ago';
      } else if (difference.inDays <= 7) {
        return '${difference.inDays} days ago';
      } else if (difference.inDays <= 30) {
        return '${difference.inDays ~/ 7} weeks ago';
      } else if (difference.inDays <= 365) {
        return '${difference.inDays ~/ 30} months ago';
      } else {
        return '${difference.inDays ~/ 365} years ago';
      }
    } catch (e) {
      return dateString;
    }
  }
}
