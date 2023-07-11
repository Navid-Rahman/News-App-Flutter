import 'package:intl/intl.dart';

class FormattedDate {
  static String formattedDateText(String publishedAt) {
    final parsedData = DateTime.parse(publishedAt);

    String formattedDate = DateFormat("yyyy-MM-dd hh:mm:ss").format(parsedData);

    DateTime publishedDate =
        DateFormat("yyyy-MM-dd hh:mm:ss").parse(formattedDate);

    return "${publishedDate.day}/${publishedDate.month}/${publishedDate.year} ON ${publishedDate.hour}:${publishedDate.minute}";
  }
}
