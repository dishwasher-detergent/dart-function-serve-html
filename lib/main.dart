import 'dart:async';
import 'dart:io';
import 'package:starter_template/utils.dart';
import 'package:path/path.dart' as p;

Future<dynamic> main(final context) async {
  final folder = p.join(p.dirname(Platform.script.toFilePath()), '../../');
  context.log(folder);
  final dir = Directory(folder);
  final List<FileSystemEntity> entities = await dir.list().toList();
  context.log(entities);

  if (context.req.method == 'GET') {
    return context.res.text(getStaticFile('index.html'), 200,
        {'Content-Type': 'text/html; charset=utf-8'});
  }

  return context.res.json({'ok': true});
}
