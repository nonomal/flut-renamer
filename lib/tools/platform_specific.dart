import 'package:flutter/services.dart';

class PlatformFilePicker {
  static const MethodChannel _channel = MethodChannel('net.sunjiao.renamer/picker');

  static Future<List<Object?>?> dirAccess([String? startPath]) async {
    try {
      return await _channel.invokeMethod(
        'dirAccess',
        {
          'startPath': startPath,
        },
      );
    } on PlatformException {
      // TODO: show error message dialog
      rethrow;
    }
  }

  static Future<List<Object?>?> fileAccess(String startPath) async {
    try {
      return await _channel.invokeMethod(
        'fileAccess',
        {
          'startPath': startPath,
        },
      );
    } on PlatformException {
      // TODO: show error message dialog
      rethrow;
    }
  }

  static Future<bool> renameFile(String oldPath, String newPath) async {
    try {
      return await _channel.invokeMethod(
        'renameFile',
        {
          'oldPath': oldPath,
          'newPath': newPath,
        },
      );
    } on PlatformException {
      // TODO: show error message dialog
      rethrow;
    }
  }
}
