import 'package:flutter/material.dart';

class TimeStampTimeAgo extends StatelessWidget {
  final DateTime timeStampData;
  final Color textColor;
  final double textFontSize;
  final FontWeight textFontWeight;
  final String fontFamily;
  final String yearAgo;
  final String monthAgo;
  final String dayAgo;
  final String hourAgo;
  final String minuteAgo;
  final String minuteLater;
  final String hourLater;
  final String dayLater;
  final String monthLater;
  final String yearLater;

  const TimeStampTimeAgo({
    Key? key,
    required this.timeStampData,
    this.textColor = Colors.black,
    this.textFontSize = 14,
    this.textFontWeight = FontWeight.w400,
    this.fontFamily = "roboto",
    this.yearAgo = 'years ago',
    this.monthAgo = 'months ago',
    this.dayAgo = 'days ago',
    this.hourAgo = 'hours ago',
    this.minuteAgo = 'minutes ago',
    this.minuteLater = 'minutes later',
    this.hourLater = 'hours later',
    this.dayLater = 'days later',
    this.monthLater = 'months later',
    this.yearLater = 'years later',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Zaman farkı hesaplaması için ilgili DateTime
    final DateTime dateTime = timeStampData;
    final Duration difference = DateTime.now().difference(dateTime);

    // Geçmiş için değerler
    final int minute = difference.inMinutes;
    final int hour = difference.inHours;
    final int day = difference.inDays;
    final int month = (difference.inDays / 30).floor();
    final int differenceInYear = (difference.inDays / 365).floor();

    // Gelecek için pozitif değerler
    final int convertPositiveMinute = -minute;
    final int convertPositiveHour = -hour;
    final int convertPositiveDay = -day + 1;
    final int convertPositiveMonth = (-difference.inDays / 30).floor();
    final int convertPositiveDifferenceInYear = (-difference.inDays / 365).floor();

    if (hour >= 8760) {
      return Text(
        '$differenceInYear $yearAgo',
        style: buildTextStyle(),
      );
    } else if (hour >= 720 && hour < 8760) {
      return Text(
        '$month $monthAgo',
        style: buildTextStyle(),
      );
    } else if (hour >= 24 && hour < 720) {
      return Text(
        '$day $dayAgo',
        style: buildTextStyle(),
      );
    } else if (hour >= 1 && hour < 24) {
      return Text(
        '$hour $hourAgo',
        style: buildTextStyle(),
      );
    } else if (minute >= 0 && minute <= 60) {
      return Text(
        '$minute $minuteAgo',
        style: buildTextStyle(),
      );
    } else if (minute < 0 && minute >= -60) {
      return Text(
        '$convertPositiveMinute $minuteLater',
        style: buildTextStyle(),
      );
    } else if (hour < 0 && hour >= -24) {
      return Text(
        '$convertPositiveHour $hourLater',
        style: buildTextStyle(),
      );
    } else if (hour < -24 && hour >= -720) {
      return Text(
        '$convertPositiveDay $dayLater',
        style: buildTextStyle(),
      );
    } else if (hour < -720 && hour >= -8760) {
      return Text(
        '$convertPositiveMonth $monthLater',
        style: buildTextStyle(),
      );
    } else if (hour < -8760) {
      return Text(
        '$convertPositiveDifferenceInYear $yearLater',
        style: buildTextStyle(),
      );
    } else {
      return Text(
        ' ',
        style: buildTextStyle(),
      );
    }
  }

  TextStyle buildTextStyle() => TextStyle(
        fontSize: textFontSize,
        color: textColor,
        fontWeight: textFontWeight,
        fontFamily: fontFamily,
      );
}
