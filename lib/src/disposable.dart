import 'package:flutter/material.dart';

abstract class Disposable {
  @protected
  @mustCallSuper
  void dispose() {}
}
