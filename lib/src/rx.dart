import 'package:flutter/foundation.dart';

extension RxListenableExtension on Listenable {
  VoidCallback subscribe(VoidCallback listener) {
    addListener(listener);
    return () => removeListener(listener);
  }
}
