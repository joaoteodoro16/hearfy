class FormatUtil {
  FormatUtil._();

  static String formatTimeMilliSecondsToMinutes(int milliseconds) {
    int totalSeconds = (milliseconds / 1000).round();

    int minutes = (totalSeconds ~/ 60);
    int seconds = (totalSeconds % 60);

    return "$minutes:${seconds.toString().padLeft(2, '0')}";
  }
}
