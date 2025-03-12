import 'dart:async';
import 'dart:io';
import 'package:dart-function-serve-html/utils.dart';

Future<dynamic> main(final context) async {
  if (context.req.method == 'GET') {
    return context.res.text(getStaticFile('index.html'), 200,
        {'Content-Type': 'text/html; charset=utf-8'});
  }

  return context.res.json({'ok': true});
}
