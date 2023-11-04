class DateTimeUtils {
  static int getTimezoneOffset() {
    return DateTime.now().timeZoneOffset.inMinutes;
  }
}
