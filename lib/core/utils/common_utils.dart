import 'dart:convert';
import 'dart:io';


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:intl/intl.dart';

import 'package:url_launcher/url_launcher.dart';

import '../../application/app_router.dart';

import '../../gen/colors.gen.dart';
import '../data/services/locator.dart';
import '../data/services/navigation_service.dart';
import '../presentation/widgets/basic/goal_text.dart';
import 'constants/app_strings.dart';


class CommonUtils {
  CommonUtils._();
  static const platform = MethodChannel("native_camera");
  static const MethodChannel _channel = MethodChannel('image_editor');


  static bool validatePassword(String value) {
    RegExp regex = RegExp(
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
    if (!regex.hasMatch(value)) {
      return false;
    } else {
      return true;
    }
  }

  static bool isValidDelta(String text) {
    try {
      // Attempt to decode the string as JSON
      final decodedJson = jsonDecode(text);

      // Check if the decoded JSON is a list
      if (decodedJson is List) {
        // Ensure each item in the list is a map and contains the 'insert' key
        for (var element in decodedJson) {
          if (element is Map && element.containsKey('insert')) {
            return true;
          }
        }
      }
    } catch (e) {
      // If decoding fails or the structure is incorrect, it's not a valid Delta
      return false;
    }
    return false;
  }

  static String formatUSPhoneNumber(String phoneNumber) {
    // Remove all non-digit characters
    String cleaned = phoneNumber.replaceAll(RegExp(r'\D'), '');

    // Check if the cleaned number has the correct length
    if (cleaned.length == 10) {
      // Format the number as (123) 456-7890
      String formatted =
          '(${cleaned.substring(0, 3)}) ${cleaned.substring(3, 6)}-${cleaned.substring(6)}';
      return formatted;
    } else {
      // Return the cleaned number if it doesn't have the correct length
      return cleaned;
    }
  }

  static DateTime getFirstDayOfMonth([DateTime? dateTime]) {
    DateTime now = dateTime ?? DateTime.now();
    return DateTime(now.year, now.month, 1);
  }

  static DateTime getLastDayOfMonth([DateTime? dateTime]) {
    var now = dateTime ?? DateTime.now();
    // Find the last day of the month.
    DateTime beginningNextMonth = (now.month < 12)
        ? DateTime(now.year, now.month + 1, 1)
        : DateTime(now.year + 1, 1, 1);
    return beginningNextMonth.subtract(const Duration(days: 1));
  }

  static bool isSameDayAs(DateTime dateTime, DateTime other) {
    return dateTime.year == other.year &&
        dateTime.month == other.month &&
        dateTime.day == other.day;
  }

  static String time24to12Hour(String? inputTime, {bool is24Hours = true}) {
    ///change is12Hour true if time needed to convert in 12 Hours format
    ///and false if time needed in 24 Hours format
    bool is12Hour = false;

    ///If sometimes required 12 hours time format
    ///Do not edit
    if (!is24Hours) {
      is12Hour = true;
    }

    if (inputTime != null && inputTime.isNotEmpty && is12Hour) {
      var timesArr = inputTime.split(":");
      if (timesArr.isNotEmpty) {
        int h = int.tryParse(timesArr[0]) ?? 0;
        int m = int.tryParse(timesArr[1]) ?? 0;
        String a = "AM";
        if (h == 0) {
          h = 12;
        } else if (h == 12) {
          a = "PM";
        } else if (h > 12) {
          a = "PM";
          h -= 12;
        }
        return "${h.toString().padLeft(2, '0')}:${m.toString().padLeft(2, '0')} $a";
      }
    } else if (inputTime != null && inputTime.isNotEmpty && !is12Hour) {
      var timesArr = inputTime.split(":");
      if (timesArr.isNotEmpty) {
        return "${timesArr[0]}:${timesArr[1]}";
      }
    }
    return "";
  }

  static String getTimeDifferenceInMinutes(String? startTime, String? endTime) {
    if (startTime == null || endTime == null) {
      return "0 Mins";
    }

    final startDateTime = DateTime(2020, 02, 20, 18, 00);
    final currentDateTime = DateTime(2020, 02, 20, 19, 00);

    final diffMn = currentDateTime.difference(startDateTime).inMinutes;
    return "$diffMn Mins";
  }

  static String calculateNoOfVisitsPending(
      String? noOfEntitledSessions, String? noOfSessionsBooked) {
    if (noOfEntitledSessions == null || noOfSessionsBooked == null) {
      return "";
    }

    if (noOfEntitledSessions == "0") {
      return "Unlimited visits";
    }

    return "${(int.tryParse(noOfEntitledSessions) ?? 0) - (int.tryParse(noOfSessionsBooked) ?? 0)} of $noOfEntitledSessions visits pending";
  }

  static String getInitials(String timeZone, [int limit = 2]) =>
      timeZone.isNotEmpty
          ? timeZone.trim().split(' ').map((l) => l[0]).take(limit).join()
          : '';

  static String getDateAndTime(
      {required String date, String format = 'MM-dd-yyyy'}) {
    try {
      var dateTime = DateTime.parse(date);
      var formatedDate = DateFormat(format).format(dateTime);

      return formatedDate;
    } catch (e) {
      // if (kDebugMode) {
      //   print(e.toString());
      // }
      return AppStrings.notApplicable;
    }
  }

  static String getServerDateFormat(
      {required String date, String format = 'MM/dd/yyyy'}) {
    try {
      // Parse the original date string
      DateFormat inputFormat = DateFormat(format);
      DateTime dateTime = inputFormat.parse(date);
      // Format the DateTime object to an ISO 8601 string
      String serverDateString = DateFormat('yyyy-MM-dd').format(dateTime);
      return serverDateString;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return AppStrings.notApplicable;
    }
  }

  static String getServerDateFormatFromDateTime({required DateTime date}) {
    try {
      String serverDateString = DateFormat('yyyy-MM-dd').format(date);
      return serverDateString;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return AppStrings.notApplicable;
    }
  }

  static String getDateWithFormat(
      {required String date, String format = 'dd/MM/yyyy'}) {
    try {
      // Parse the original date string
      DateFormat inputFormat = DateFormat("yyyy-MM-dd");
      DateTime dateTime = inputFormat.parse(date);
      // Format the DateTime object to an ISO 8601 string
      String serverDateString = DateFormat(format).format(dateTime);
      return serverDateString;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return AppStrings.notApplicable;
    }
  }

  static String getMonthDateAndYear({required String date}) {
    try {
      var dateTime = DateTime.parse(date);
      var formatedDate = DateFormat("MMM-dd-yyyy").format(dateTime);

      return formatedDate;
    } catch (e) {
      // if (kDebugMode) {
      //   print(e.toString());
      // }
      return AppStrings.notApplicable;
    }
  }

  /// "04-24-2024"
  static String monthDateAndYearFormat({required String date}) {
    try {
      // Parse the date string, ignoring the time part if present
      var dateTime = DateTime.parse(date.split(" ")[0]);
      // Format the date as MM-dd-yyyy
      var formattedDate = DateFormat('MM-dd-yyyy').format(dateTime);

      return formattedDate;
    } catch (e) {
      // Handle any format exceptions
      return AppStrings.notApplicable;
    }
  }

  /// March,21, 2024
  static String americanMonthDateAndYearFormat({required String date}) {
    try {
      var dateTime = DateTime.parse(date);
      var formatedDate = DateFormat('MMMM d, yyyy').format(dateTime);

      return formatedDate;
    } catch (e) {
      // if (kDebugMode) {
      //   print(e.toString());
      // }
      return AppStrings.notApplicable;
    }
  }

  static String startTimeEndTimeTimeZone(
      String startTimeStr, String endTimeStr, String timeZoneInput) {
    DateTime startTime = DateTime.parse('1970-01-01T$startTimeStr');
    DateTime endTime = DateTime.parse('1970-01-01T$endTimeStr');

    String formattedStartTime = DateFormat('hh:mma').format(startTime);
    String formattedEndTime = DateFormat('hh:mma').format(endTime);

    return '$formattedStartTime-$formattedEndTime $timeZoneInput';
  }

  static bool boolConverter(String? value) {
    if (value != null && value.isNotEmpty) {
      return value == "1";
    }
    return false;
  }

  static String boolToStringConverter(bool value) {
    return value ? "1" : "0";
  }

  static Future<void> launchAppUrl(String url) async {
    if (!await launchUrl(Uri.tryParse(url) ?? Uri())) {
      throw Exception('Could not launch $url');
    }
  }

  static String internationalPhoneFormat(String value) {
    String nums = value.replaceAll(RegExp(r'[\D]'), '');
    String internationalPhoneFormatted = nums.isNotEmpty
        ? '${nums.length > 1 ? ' (' : ''}${nums.substring(0, nums.length >= 3 ? 3 : null)}${nums.length > 3 ? ') ' : ''}${nums.length > 3 ? nums.substring(3, nums.length >= 6 ? 6 : null) + (nums.length > 6 ? '-${nums.substring(6, nums.length >= 10 ? 10 : null)}' : '') : ''}'
        : nums;
    return internationalPhoneFormatted;
  }

  /// we are calculating pagination index from this function
  static int calculatingTotalPagination(int totalLength) {
    const int itemsPerPage = 6;
    final int fullPages = totalLength ~/ itemsPerPage;
    final int remainingItems = totalLength % itemsPerPage;

    // if (remainingItems < 6 && remainingItems != 0) {
    //   return fullPages + 1;
    // } else if (totalLength > 6 ){
    //
    //   return 1;
    // }else {
    //
    //   return fullPages;
    // }
    if (remainingItems < 6 && remainingItems != 0) {
      return fullPages + 1;
    } else if (totalLength < 6 || totalLength == 6) {
      return 1;
    } else {
      return fullPages;
    }
  }

  static bool validateEmail(String? value) {
    RegExp regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!regex.hasMatch(value ?? "")) {
      return false;
    } else {
      return true;
    }
  }

  static Widget  verticalDivider({double? height,double? width,Color? color}){
    return Container(
      height: height ?? 48,
      width: width ?? 1,
      decoration:  BoxDecoration(
        color: color ?? ColorName.lightGrey.withOpacity(0.5),
      ),
    );
  }

  static Widget  horizontalDivider({double? height,double? width,Color? color}){
    return Container(
      height: height ?? 1,
      width: width,
      decoration:  BoxDecoration(
        color: color ?? ColorName.lightGrey.withOpacity(0.5),
      ),
    );
  }

  static Color getTextColor(BuildContext context,{Color? color}){
    return Theme.of(context).brightness == Brightness.dark ? ColorName.whiteColor : color ?? Theme.of(context).colorScheme.primary;
  }

  static void showMessage(BuildContext context,{required String message, int? duration,Color? color,SnackBarAction? action}){
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: color,action: action, content: GoalText(message, fontColor:Theme.of(context).brightness == Brightness.dark ? ColorName.blackColor : ColorName.whiteColor,),duration: Duration(seconds: duration ?? 2),));
  }


  static Future<File?> openCamera(String address) async {
    try {
      final imagePath = await platform.invokeMethod<String>('openCamera');

      if (imagePath?.isNotEmpty ?? false) {
        logger.i("Captured Image Path: $imagePath");
        String newPath = await addTextToImage(imagePath!,address) ?? "Not found";
        File newFile = File(newPath);
        int size  = await newFile.length();
        logger.i("new image path : $newPath \nSize : ${( size / 1024)} KB");
        return File(newPath);
      }

      logger.i("No image captured.");
    } catch (e, stackTrace) {
      logger.e("Error opening camera: $e", error: e, stackTrace: stackTrace);
    }
    return null;
  }

  static void deleteImageAfterUpload({required File capturedImage}) async {
    try {

      if (await capturedImage.exists()) {
        await capturedImage.delete();
        logger.i("✅ Image deleted successfully:");
      } else {
        logger.e("❌ File does not exist:");
      }
    } catch (e) {
      logger.e("❌ Error deleting file: $e");
    }
  }





  static Future<String?> addTextToImage(String imagePath, String text) async {
    try {
      final String? newPath = await _channel.invokeMethod('addTextToImage', {
        'imagePath': imagePath,
        'text': text,
      });
      return newPath;
    } catch (e) {
      logger.e("Error: $e");
      return null;
    }
  }




  static double toDouble(dynamic value) {
    if (value is double) {
      return value;
    } else if (value is int) {
      return value.toDouble();
    } else if (value is String) {
      return double.tryParse(value) ?? 0.0;
    }
    return 0.0;
  }
  static String getAmount(dynamic amount)=>NumberFormat.currency( locale: 'en_US', symbol: 'Rs.').format(toDouble(amount));
  static String getFormatedValue(dynamic amount){
    double value = toDouble(amount);
    if(value == 0) return "-";
    return NumberFormat.decimalPattern().format(value);
  }
}



extension E on String {
  String lastChars(int n) => substring(length - n);
  String capitalizeFirst() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }
}
