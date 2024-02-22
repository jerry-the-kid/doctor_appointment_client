import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';

class Helpers {
  void showErrorSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
    ));
  }

  void handleFirebaseException(
      {required BuildContext context,
      required Function callBackFnc,
      Function? successCallBack,
      String? successMessage}) async {
    try {
      await EasyLoading.show(
        status: 'loading...',
        maskType: EasyLoadingMaskType.black,
      );
      await callBackFnc();
      if (successCallBack != null) {
        await successCallBack();
      }
    } on FirebaseAuthException catch (e) {
      print(e.code);
      if (!context.mounted) return;

      if (e.code == 'weak-password') {
        Helpers()
            .showErrorSnackbar(context, 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Helpers().showErrorSnackbar(
            context, 'The account already exists for that email.');
      } else if (e.code == 'too-many-requests') {
        Helpers().showErrorSnackbar(
            context, "Too many request. Please try again another time");
      } else if (e.code == 'unknown-error') {
        Helpers().showErrorSnackbar(context, "Unknown Error Please try again");
      } else if (e.code == "invalid-credential") {
        Helpers().showErrorSnackbar(
            context, 'Credential must be invalid. Please try again!');
      } else if (e.code == 'user-not-found') {
        Helpers().showErrorSnackbar(context, 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Helpers().showErrorSnackbar(
            context, 'Wrong password provided for that user.');
      } else {
        Helpers().showErrorSnackbar(context, e.message!);
      }
    } finally {
      await EasyLoading.dismiss();
      if (successMessage != null) {
        await EasyLoading.showSuccess(
          successMessage,
          maskType: EasyLoadingMaskType.black,
        );
      }
    }
  }

  String generateRandomKey() {
    const characters =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final random = Random();
    return String.fromCharCodes(Iterable.generate(
        12, (_) => characters.codeUnitAt(random.nextInt(characters.length))));
  }

  // Utils
  Map<String, String> uriToObject(Uri uri) {
    Map<String, String> queryParams = uri.queryParameters;

    Map<String, String> result = {};
    result['path'] = uri.path;
    result.addAll(queryParams);

    return result;
  }

  String capitalizeString(String string) {
    List<String> words = string.toLowerCase().split(' ');
    List<String> capitalizedWords = [];

    for (String word in words) {
      if (word.isNotEmpty) {
        String capitalizedWord = word[0].toUpperCase() + word.substring(1);
        capitalizedWords.add(capitalizedWord);
      }
    }

    return capitalizedWords.join(' ');
  }

  String addSpacesEveryIntervalCharacter(String text, {int interval = 4}) {
    if (text.isEmpty) return text; // Handle empty string case

    final chunks = <String>[];
    for (var i = 0; i < text.length; i += interval) {
      chunks.add(text.substring(i, min(i + interval, text.length)));
    }
    return chunks.join(' ');
  }

  bool isStringEmail(String text) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(text);
  }

  bool isStringMMYYFormat(String string) {
    return RegExp(r"^0[1-9]|1[0-2]/\d{2}$").hasMatch(string);
  }

  bool isAllNumbers(String string) {
    return RegExp(r'^[0-9]+$').hasMatch(string);
  }

  DateTime combineDateTimeAndTimeString(DateTime dateTime, String timeString) {
    List<String> timeComponents = timeString.split(":");
    int hour = int.parse(timeComponents[0]);
    int minute = int.parse(timeComponents[1].split(" ")[0]);
    String period = timeComponents[1].split(" ")[1];

    if (period == "PM" && hour != 12) {
      hour += 12;
    } else if (period == "AM" && hour == 12) {
      hour = 0;
    }

    return DateTime(dateTime.year, dateTime.month, dateTime.day, hour, minute);
  }

  bool isBeforeToday(DateTime inputDate) {
    DateTime today = DateTime.now();
    if (inputDate.isBefore(DateTime(today.year, today.month, today.day))) {
      return true;
    } else {
      return false;
    }
  }

  String formattedDate(
      {required String newPattern, required DateTime dateTime}) {
    return DateFormat(newPattern).format(dateTime);
  }

  DateTime parseShortDateString(String input) {
    List<String> parts = input.split('/');

    int month = int.parse(parts[0]);
    int year = int.parse(parts[1]);

    return DateTime(year + 2000, month, 1);
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
