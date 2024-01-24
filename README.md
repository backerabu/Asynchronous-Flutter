# asynchronous_flutter

A new Flutter project implementing asynchronous functions.

## Getting Started

Asynchronous programming is a fundamental concept in modern software development, especially in Flutter. It allows your program to handle multiple tasks in parallel, keeping your app responsive even when performing long-running tasks like network requests or file operations2.

In Dart and Flutter, you can use the async and await keywords to manage asynchronous operations. When you mark a function as async, you're telling Dart that the function may contain asynchronous code that should be executed in a separate, non-blocking task. The await keyword is used in conjunction with async to pause execution until the awaited Future completes1.

Here's an example of how to use async and await:
```
Future<int> fetchData() async {
 await Future.delayed(Duration(seconds: 3));
 return 42;
}

void main() {
 fetchData().then((data) => print(data));
}
```
In this example, the fetchData function is marked as async, so Dart knows that the function may contain asynchronous code. The fetchData function uses await to wait for a Future to complete, which simulates a long-running task like a network request. The then method is used to handle the result of the Future, which is the int value 422.

Streams in Flutter
A stream is a sequence of asynchronous events. In Flutter, streams are used to represent a continuous flow of data, like the flow of data from a server, or the flow of data from a user’s gestures. Streams are a powerful tool for building responsive apps, because they allow you to handle a continuous flow of data in an asynchronous way2.

To create a stream, you start with a StreamController. This constructs a controller that you can then use to manipulate the stream the controller manages. The controller's stream can be accessed through the stream property:

StreamController<double> controller = StreamController<double>();
Stream stream = controller.stream;
To get the values from a stream, you subscribe to the stream by calling the listen function and supplying it with a function to call back when there's a new value available:
```
stream.listen((value) {
 print('Value from controller: $value');
});
```
In this example, every time a new value is added to the stream, the listen function prints the new value3.

StreamBuilder in Flutter
StreamBuilder is a widget that builds itself based on the latest snapshot of interaction with a stream. It's mainly used in applications where the widget needs to rebuild itself to show the current snapshot of data5.

Here's an example of how to use StreamBuilder:
```
StreamBuilder<int>(
 stream: _counterController.counterStream,
 initialData: 0,
 builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
    if (snapshot.hasData) {
      return Text('${_counterController.counter}');
    } else {
      return Text('Empty data');
    }
 }
)
```
In this example, StreamBuilder listens to _counterController.counterStream. If the stream has data, it displays the counter value. Otherwise, it displays "Empty data"5.

FutureBuilder in Flutter
FutureBuilder is similar to StreamBuilder, but it works with Future objects instead of streams. It's useful when you have a single asynchronous operation that produces a value and you want to build your widget tree based on the result of that operation.

Here's an example of how to use FutureBuilder:
```
FutureBuilder<String>(
 future: fetchUsername(),
 builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return CircularProgressIndicator();
    } else if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    } else {
      return Text('Username: ${snapshot.data}');
    }
 },
)
```
In this example, FutureBuilder waits for the fetchUsername() future to complete. While it's waiting, it displays a loading indicator. If the future completes with an error, it displays the error message. Otherwise, it displays the username4.
