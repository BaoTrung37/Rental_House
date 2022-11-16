import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

class JsonDateTimeConverter implements JsonConverter<DateTime, String> {
  const JsonDateTimeConverter();

  @override
  DateTime fromJson(String json) {
    var newJson = json;
    if (json.contains('.')) {
      newJson = json.substring(0, json.length - 1);
    }

    return DateTime.parse('${newJson}Z')
        .toLocal()
        .subtract(const Duration(hours: 7));
  }

  @override
  String toJson(DateTime json) =>
      DateFormat('yyyy-MM-dd HH:mm:ss').format(json);
}
