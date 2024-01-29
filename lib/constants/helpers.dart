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
