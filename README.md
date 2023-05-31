## Features

- [x] Notifier
- [x] Disposer
- [x] Disposable

## Usage

```dart

class Bloc with Notifier {
  Bloc(Listenable dependency) {
    dependency.subscribe((){
      counter++;
      notifyListeners();
    }).disposeBy(this);
  }

  int counter = 0;
}

```