import 'dart:convert';

import 'package:json_path/json_path.dart';

String select(String selector, String payload) {
  final json = jsonDecode(payload);

  return jsonEncode(JsonPath(selector)
    .read(json)
    .map((result) => result.value).toList()
  );
}
