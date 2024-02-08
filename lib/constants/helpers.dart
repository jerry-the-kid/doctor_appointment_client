import 'dart:math';

class Helpers {
  // // API Endpoints
  // static const String apiBaseUrl = 'https://api.example.com';
  // static const String loginEndpoint = '/auth/login';
  // static const String userEndpoint = '/user';

  // // Colors
  // static const primaryColor = Color(0xFF3498db);
  // static const secondaryColor = Color(0xFF2ecc71);

  // // Text Styles
  // static const headerTextStyle = TextStyle(
  //   fontSize: 20,
  //   fontWeight: FontWeight.bold,
  //   color: Colors.black,
  // );

  // // Other Constants
  // static const int maxRetryAttempts = 3;

  String addSpacesEveryIntervalCharacter(String text, {int interval = 4}) {
    if (text.isEmpty) return text; // Handle empty string case

    final chunks = <String>[];
    for (var i = 0; i < text.length; i += interval) {
      chunks.add(text.substring(i, min(i + interval, text.length)));
    }
    return chunks.join(' ');
  }

  bool isStringMMYYFormat(String string) {
    // Use a regular expression to match the format and month range
    return RegExp(r"^0[1-9]|1[0-2]/\d{2}$").hasMatch(string);
  }

  bool isAllNumbers(String string) {
    // Use a regular expression to match only digits
    return RegExp(r'^[0-9]+$').hasMatch(string);
  }

  DateTime startOfMonth =
      DateTime(DateTime.now().year, DateTime.now().month, 1);
  DateTime yesterday = DateTime.now().subtract(const Duration(days: 1));

  List<DateTime> generateDisabledDates() {
    List<DateTime> disabledDates = [];

    for (DateTime date = startOfMonth;
        date.isBefore(yesterday);
        date = date.add(const Duration(days: 1))) {
      disabledDates.add(date);
    }

    return disabledDates;
  }
}
