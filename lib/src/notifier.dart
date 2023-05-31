import 'package:flutter/material.dart';
import 'package:foundation/src/disposable.dart';

class Notifier implements Disposable, Disposer, Listenable {
  final List<VoidCallback> _listeners = [];
  // iterable over in reverse on dispose
  final List<VoidCallback> _onDispose = [];

  @override
  void dispose() {
    _listeners.clear();

    final reversed = _onDispose.reversed.toList();
    _onDispose.clear();
    for (final onDispose in reversed) {
      onDispose();
    }
  }

  @override
  void addListener(VoidCallback listener) {
    _listeners.add(listener);
  }

  @override
  void callOnDispose(VoidCallback callback) {
    _onDispose.add(callback);
  }

  @override
  void removeListener(VoidCallback listener) {
    _listeners.remove(listener);
  }

  @protected
  void notifiyListeners() {
    final listeners = _listeners.toList();
    for (final listener in listeners) {
      listener();
    }
  }
}
