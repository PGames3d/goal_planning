import 'package:flutter/material.dart';

class CustomTimeRange {
  final TimeOfDay start;
  final TimeOfDay end;

  CustomTimeRange({required this.start, required this.end});

  @override
  String toString() {
    return '${_formatTimeOfDay(start)} - ${_formatTimeOfDay(end)}';
  }

  String _formatTimeOfDay(TimeOfDay time) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    final format = MaterialLocalizations.of(_context).formatTimeOfDay(time);
    return format;
  }

  static late BuildContext _context;

  static Future<CustomTimeRange?> selectCustomTimeRange(
      BuildContext context) async {
    _context = context;
    TimeOfDay? startTime = await _selectTime(context, true);
    if (startTime == null) return null;

    TimeOfDay? endTime = await _selectTime(context, false);
    if (endTime == null) return null;

    return CustomTimeRange(start: startTime, end: endTime);
  }

  static Future<TimeOfDay?> _selectTime(
      BuildContext context, bool isStartTime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      helpText:
          isStartTime ? 'Select event start time' : 'Select event end time',
    );

    return picked;
  }
}
