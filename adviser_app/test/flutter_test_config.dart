import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  setUpAll(() async {
    final robotFont = _loadNaterialFont('Roboto-Regular.ttf');

    final fontLoader = FontLoader('Roboto')..addFont(robotoFont);
    await fontLoader.load();
  });

  await testMain();
}

Future<ByteData> _loadMaterialFont(String fontName) {
  const FileSystem fs = LocalFileSystem();
  const Platform platform = LocalPlatform();

  final Directory flutterRoot =
      fs.directory(platform.environment['FLUTTER_ROOT']!);

  final File font = flutterRoot.childFile(
    fs.path.join(
      'bin',
      'cache',
      'artifacts',
      'material_fonts',
      fontName,
    ),
  );

  final Future<ByteData> bytes =
      Future<ByteData>.value(font.readAsBytesSync().buffer.asByteData());
  return bytes;
}
