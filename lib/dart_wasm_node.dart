import 'dart:async';
import 'dart:js_interop';

@JS()
external void onDartMessage(String message);

@JS()
external set onJSMessage(JSFunction handler);

void handler(String message) => print(message);

void main(argv) async {
  print(argv);

  onJSMessage = handler.toJS;

  var iterations = 0;

  Timer.periodic(Duration(seconds: 1), (timer) async {
    onDartMessage('Dart message $iterations');
    if (++iterations == 5) timer.cancel();
  });
}
