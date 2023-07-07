Duration? parseTimeString(String timeString) {
  final parts = timeString.split(':');
  if (parts.length == 1) {
    final seconds = int.tryParse(parts[0]);
    if (seconds != null) {
      return Duration(seconds: seconds);
    }
  } else if (parts.length == 2) {
    final minutes = int.tryParse(parts[0]);
    final seconds = int.tryParse(parts[1]);
    if (minutes != null && seconds != null) {
      return Duration(minutes: minutes, seconds: seconds);
    }
  } else if (parts.length == 3) {
    final hours = int.tryParse(parts[0]);
    final minutes = int.tryParse(parts[1]);
    final seconds = int.tryParse(parts[2]);
    if (hours != null && minutes != null && seconds != null) {
      return Duration(hours: hours, minutes: minutes, seconds: seconds);
    }
  }
  return null;
}
