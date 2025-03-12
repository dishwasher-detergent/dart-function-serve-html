import 'dart:io';
import 'package:path/path.dart' as p;

final staticFolder = p.join(p.dirname(Platform.script.toFilePath()), '../static');

/// Throws an error if any of the keys are missing from the object
/// @param obj - The object to check
/// @param keys - The list of keys to check for
/// @throws Exception
void throwIfMissing(Map<String, String> obj, List<String> keys) {
  final missing = <String>[];
  for (final key in keys) {
    if (!obj.containsKey(key) || obj[key] == null) {
      missing.add(key); 
    }
  }

  if (missing.isNotEmpty) {
    throw StateError('Missing environment variables: ${missing.join(', ')}');
  }
}

/// Returns the contents of a file in the static folder
/// @param {string} fileName
/// @returns {string} Contents of static/{fileName}
String getStaticFile(String fileName) {
  final file = File(p.join(staticFolder, fileName));
  return file.readAsStringSync();
}