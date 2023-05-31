import 'package:flutter/material.dart';

abstract class Disposable {
  @mustCallSuper
  void dispose() {}
}

abstract class Disposer {
  void callOnDispose(VoidCallback callback);
}

extension DisposerDisposableExtension on Disposable {
  void disposeBy(Disposer disposer) => disposer.callOnDispose(dispose);
}

extension DisposerCallbackExtension on VoidCallback {
  void disposeBy(Disposer disposer) => disposer.callOnDispose(this);
}
