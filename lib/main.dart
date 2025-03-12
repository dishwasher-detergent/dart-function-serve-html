import 'dart:async';
import 'dart:io';
import 'package:starter_template/utils.dart';
import 'package:path/path.dart' as p;

Future<dynamic> main(final context) async {
    final result = await Process.run('find', ['~', '-name', 'index.html'], 
      runInShell: true);
    
    if (result.exitCode == 0) {
      context.log(result.stdout);
    } else {
      context.error('Error: ${result.stderr}');
    }

  if (context.req.method == 'GET') {
    return context.res.text(getStaticFile('index.html'), 200,
        {'Content-Type': 'text/html; charset=utf-8'});
  }

  return context.res.json({'ok': true});
}
