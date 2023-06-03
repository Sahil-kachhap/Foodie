extension TimeAgoExtension on DateTime {
  String toTimeAgo() {
    final now = DateTime.now();
    final difference = now.difference(this);

    final minutes = difference.inMinutes;

    if (minutes < 1) {
      return 'just now';
    } else if (minutes < 60) {
      return '$minutes minutes ago';
    } else if (minutes < 1440) {
      final hours = (minutes / 60).floor();
      return '$hours hours ago';
    } else {
      final days = (minutes / 1440).floor();
      return '$days days ago';
    }
  }
}
