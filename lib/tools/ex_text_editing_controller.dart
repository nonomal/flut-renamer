import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:toastification/toastification.dart';

final _regex = RegExp(r'\{([A-Za-z]+:[A-Za-z]+)\}');

extension ExTextEditingController on TextEditingController {
  void insertTag(String tag, BuildContext context) {
    final int cursorPos = selection.base.offset;
    final matches = _regex.allMatches(text);
    for (final match in matches) {
      if (cursorPos > match.start && cursorPos < match.end) {
        toastification.show(
          context: context,
          title: 'Do not insert a tag inside another tag.',
          autoCloseDuration: const Duration(seconds: 5),
        );
        return;
      }
    }
    value = value.copyWith(
      text: text.replaceRange(max(cursorPos, 0), max(cursorPos, 0), tag),
      selection:
          TextSelection.fromPosition(TextPosition(offset: max(cursorPos, 0) + tag.length)),
    );
  }
}
