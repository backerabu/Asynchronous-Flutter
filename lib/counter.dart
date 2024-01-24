import 'dart:async';

class Counter {
  final _counterController = StreamController<int>.broadcast();
  Stream get counterStream => _counterController.stream;

  final _transformedCounterController = StreamController<int>();
  Stream get transformedCounterStream => _transformedCounterController.stream;
  int count = 0;
  Timer? timer;
  void startIncrement() {
    timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      count++;
      _counterController.add(count);
    });
  }

  void transform() {
    StreamTransformer<int, int> doubleTransformer =
        StreamTransformer<int, int>.fromBind((s) => s.map((e) => e * 2));
     counterStream.transform(doubleTransformer).listen((event) {
      _transformedCounterController.add(event);
     });
  }

  void dispose() {
    timer?.cancel();
  }
}
