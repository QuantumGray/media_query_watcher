import 'dart:async';
import 'util_list_sort.dart';
import 'package:flutter/material.dart';

class MediaQueryWatcher extends InheritedWidget {
  MediaQueryWatcher({
    Key? key,
    required this.widthWatchThreshholds,
    required this.heightWatchThreshholds,
    required Widget child,
  }) : super(key: key, child: _MediaQueryWatcherInternal(child)) {
    // ### SORT thresholds ###
    widthWatchThreshholds = widthWatchThreshholds..quickSort();
    heightWatchThreshholds = heightWatchThreshholds..quickSort();
    // ### listen to mediaquerystream ###
    _mediaQueryInputStreamController.stream.distinct().listen((Size _size) {
      for (var i = 0; i < heightWatchThreshholds.length; i++) {
        if (i == heightWatchThreshholds.length - 1) {
          inputSink.add(_size);
          heightWatchIndex = i;
          break;
        }
        if (_size.width < heightWatchThreshholds[i] &&
            _size.width > heightWatchThreshholds[i + 1]) {
          if (i != heightWatchIndex) {
            inputSink.add(_size);
            heightWatchIndex = i;
          }
        }
      }
    });
  }

  int? widthWatchIndex;
  int? heightWatchIndex;

  List<double> widthWatchThreshholds;
  List<double> heightWatchThreshholds;
  // final Widget child;

  final StreamController<Size> _mediaQueryInputStreamController =
      StreamController<Size>.broadcast();

  EventSink get inputSink => _mediaQueryInputStreamController.sink;

  Stream<Size> get sizeStream => _mediaQueryInputStreamController.stream;
  Stream<double> get widthStream => _mediaQueryInputStreamController.stream
      .map<double>((_size) => _size.width);
  Stream<double> get heightStream => _mediaQueryInputStreamController.stream
      .map<double>((_size) => _size.height);

  static MediaQueryWatcher of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MediaQueryWatcher>()!;
  }

  @override
  bool updateShouldNotify(covariant MediaQueryWatcher oldWidget) {
    return false;
  }

  void deactivate() {
    _mediaQueryInputStreamController.close();
  }
}

class _MediaQueryWatcherInternal extends StatelessWidget {
  const _MediaQueryWatcherInternal(this.child);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    MediaQueryWatcher.of(context).inputSink.add(
          _size,
        );
    return child;
  }
}
