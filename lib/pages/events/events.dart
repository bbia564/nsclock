class Emitter {
  Map events = {};

  emit<T>(String event, [dynamic data]) {
    if (event.isEmpty) {
      return;
    }
    if (events[event] is List) {
      for (Function fn in events[event]) {
        if (data == null) {
          fn.call();
        } else {
          fn(data);
        }
      }
    }
    return this;
  }

  on(String event, Function fn) {
    if (events[event] is List) {
      events[event].add(fn);
    } else {
      events[event] = [fn];
    }

    return this;
  }

  off(String event, Function fn) {
    if (event.isNotEmpty) {
      List? listeners = events[event];
      if (listeners != null) {
        listeners.removeWhere((element) => element == fn);
      } else {
        events[event] = [];
      }
    }
    return this;
  }
}

class Events {
  static const setting = "setting";
}
