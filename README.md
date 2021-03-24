# media_query_watcher 👀

#### places a widget inside the widget tree that observes the apps MediaQueryState and exposes streams to listen to. Also MediaQueryBuilder lets you granularly build on changes to the MediaQueryState

````dart
    MediaQueryWatcher(
        // optional key
        key: UniqueKey(),
        // 
        widthWatchThreshholds: [
          400.0,
          600.0,
          1000,
        ],
        heightWatchThreshholds: [1200.0, 600.0],
        child: // CHILD
````