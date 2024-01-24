
import 'package:asynchronous_flutter/counter.dart';
import 'package:asynchronous_flutter/custome_appbar.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Counter counter = Counter();

  @override
  void dispose() {
    counter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: widget.title),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder(
                stream: counter.counterStream,
                builder: (context, v) {
                  return Text(
                    (v.data ?? "CLICK THE FAB").toString(),
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                }),
                 StreamBuilder(
                stream: counter.transformedCounterStream,
                builder: (context, v) {
                  return Text(
                    (v.data ?? "CLICK THE TRANSFORMER").toString(),
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                }),
          ],
        ),
      ),
      persistentFooterButtons: [
        FloatingActionButton(
          onPressed: () => counter.startIncrement(),
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
        FloatingActionButton(
          onPressed: () => counter.transform(),
          tooltip: 'Transform',
          child: const Icon(Icons.replay),
        ),
      ],
    );
  }
}
