import 'dart:async';

import 'package:js/js.dart';

@JS()
class Promise<T> {
  external Promise(void executor(void resolve(T result), Function reject));

  external Promise then(void onFulfilled(T result), [Function onRejected]);
}

Future<T> promiseToFutureInterop<T>(Promise<T> promise) {
  final c = Completer<T>();
  promise.then(allowInterop(c.complete), allowInterop(c.completeError));
  return c.future;
}
