import 'dart:io';
import 'dart:async';
import 'dart:convert';

import 'package:Dart_json_path/Dart_json_path.dart' as Dart_json_path;

void execute(String selector, String payload) {
  try {
    print(Dart_json_path.select(selector, payload));
  }
  on FormatException catch (e) {
    print(e);
    exit(2); // not supported
  }
  catch (e) {
    print(e);
    exit(1);
  }
}

void main(List<String> arguments) {
  var s = stdin
  .transform(utf8.decoder);

  String payload = '';
  StreamSubscription cmdSubscription = s.listen(
    (line) => payload += line,
    onDone: () => execute(arguments[0], payload),
    onError: (e) => print('error ${e}'));
}
