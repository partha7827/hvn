import 'package:flutter/foundation.dart' show required;
import 'package:intl/intl.dart';

final _shortDateFormatter = DateFormat('d.MMM');
final _longDateFormatter = DateFormat('d-MM-y, H:mm');

List<String> formatSortDate({String stringDate}) {
  try {
    final date = DateTime.parse(stringDate);
    return _shortDateFormatter.format(date).split('.');
  } on Exception catch (_) {
    return ['Date Error'];
  }
}

String formatLongDate({@required String stringDate}) {
  try {
    final date = DateTime.parse(stringDate);
    return _longDateFormatter.format(date);
  } on Exception catch (_) {
    return 'Date Error';
  }
}
