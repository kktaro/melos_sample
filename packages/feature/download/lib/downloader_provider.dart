import 'dart:convert';
import 'dart:typed_data';

import 'package:file_saver/file_saver.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/downloader_provider.g.dart';

@riverpod
class Downloader extends _$Downloader {
  @override
  void build() {
    return;
  }

  Future<void> downloadImage(
    Uint8List imageBytes, {
    String fileName = 'screen',
  }) async {
    await FileSaver.instance.saveFile(
      name: '$fileName.jpg',
      bytes: imageBytes,
    );
  }

  Future<void> downlowdText(
    String message, {
    String fileName = 'comment',
  }) async {
    final messageBytes = utf8.encode(message);

    await FileSaver.instance.saveFile(
      name: '$fileName.txt',
      bytes: messageBytes,
    );
  }
}
