import 'package:flutter/material.dart';

class TimeStampTimeAgo extends StatelessWidget {
  final timeStampData;
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

  TimeStampTimeAgo(
      {Key key,
        @required this.timeStampData,
        this.textColor: Colors.black,
        this.textFontSize: 14,
        this.textFontWeight: FontWeight.w400,
        this.fontFamily: "roboto",
        this.yearAgo: 'years ago',
        this.monthAgo: 'months ago',
        this.dayAgo: 'days ago',
        this.hourAgo: 'hours ago',
        this.minuteAgo: 'minutes ago',
        this.minuteLater: 'minutes later',
        this.hourLater: 'hours later',
        this.dayLater: 'days later',
        this.monthLater: 'months later',
        this.yearLater: 'years later'})
      : assert(timeStampData != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    //TimeStamp to DateTime
    DateTime convertDateTime = DateTime.fromMillisecondsSinceEpoch(
        timeStampData.millisecondsSinceEpoch);

    //Minute
    int minute = DateTime.now().difference(convertDateTime).inMinutes;
    int convertPositiveMinute =
        DateTime.now().difference(convertDateTime).inMinutes * -1;

    //Hour
    int hour = DateTime.now().difference(convertDateTime).inHours;
    int convertPositiveHour =
        DateTime.now().difference(convertDateTime).inHours * -1;

    //Day
    int day = DateTime.now().difference(convertDateTime).inDays;
    int convertPositiveDay = (day * -1) + 1;

    //Convert Duration
    Duration duration = DateTime.now().difference(convertDateTime);

    //Month
    int month = (duration.inDays / 30).floor();
    int convertPositiveMonth = (duration.inDays / 30 * -1).floor();

    //Year
    int differenceInYear = (duration.inDays / 365).floor();
    int convertPositiveDifferenceInYear = (duration.inDays / 365 * -1).floor();

    if (hour >= 8760) {
      return Text(
        '$differenceInYear' + ' $yearAgo',
        style: buildTextStyle(),
      );
    } else if (hour >= 720 && hour < 8760) {
      return Text(
        '$month' + ' $monthAgo',
        style: buildTextStyle(),
      );
    } else if (hour >= 24 && hour < 720) {
      return Text(
        '$day' + ' $dayAgo',
        style: buildTextStyle(),
      );
    } else if (hour >= 1 && hour < 24) {
      return Text(
        '$hour' + ' $hourAgo',
        style: buildTextStyle(),
      );
    } else if (minute >= 0 && minute <= 60) {
      return Text(
        '$minute' + ' $minuteAgo',
        style: buildTextStyle(),
      );
    } else if (minute <= 0 && minute >= -60) {
      return Text(
        '$convertPositiveMinute' + ' $minuteLater',
        style: buildTextStyle(),
      );
    } else if (hour <= 0 && hour >= -24) {
      return Text(
        '$convertPositiveHour' + ' $hourLater',
        style: buildTextStyle(),
      );
    } else if (hour < -24 && hour >= -720) {
      return Text(
        '$convertPositiveDay' + ' $dayLater',
        style: buildTextStyle(),
      );
    } else if (hour <= -720 && hour >= -8760) {
      return Text(
        '$convertPositiveMonth ' + ' $monthLater',
        style: buildTextStyle(),
      );
    } else if (hour < -8760) {
      return Text(
        '$convertPositiveDifferenceInYear' + ' $yearLater',
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
