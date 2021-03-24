import 'package:flutter/material.dart';
import 'package:media_query_watcher/src/media_query_watcher.dart';

void main() {
  runApp(MaterialApp(home: App()));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext contexto) {
    return Scaffold(
      body: MediaQueryWatcher(
        key: UniqueKey(),
        widthWatchThreshholds: [
          400.0,
          600.0,
          1000,
        ],
        heightWatchThreshholds: [1200.0, 600.0],
        child: Builder(
          builder: (context) => Column(
            children: [
              StreamBuilder<double>(
                  initialData: 2.0,
                  stream: MediaQueryWatcher.of(context).heightStream,
                  builder: (_, state) {
                    print("streambuilder rebuilt " + state.toString());
                    return Text(state.toString());
                  }),
              StreamBuilder<double>(
                  initialData: 2.0,
                  stream: MediaQueryWatcher.of(context).widthStream,
                  builder: (_, state) {
                    print("streambuilder rebuilt " + state.toString());
                    return Text(state.toString());
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
