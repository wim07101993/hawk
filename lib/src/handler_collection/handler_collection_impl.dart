import 'package:flutter_logging_extensions/flutter_logging_extensions.dart';
import 'package:hawk/hawk.dart';

class HandlerCollection {
  HandlerCollection({
    this.logger,
  }) : _handlers = [];

  final List _handlers;
  final Logger? logger;

  void addFunction<T>(HandlerFunction<T> handler) {
    _handlers.add(handler);
  }

  void removeFunction<T>(HandlerFunction<T> handler) {
    _handlers.remove(handler);
  }

  void add<T>(Handler<T> handler) {
    _handlers.add(handler);
  }

  void remove<T>(Handler<T> handler) {
    _handlers.remove(handler);
  }

  void addFactory<T>(HandlerFactory<T> factory) {
    _handlers.add(factory);
  }

  void removeFactory<T>(HandlerFactory<T> factory) {
    _handlers.remove(factory);
  }

  Iterable<HandlerFunction<T>> get<T>() sync* {
    for (final handler in _handlers) {
      if (handler is HandlerFunction<T>) {
        yield handler;
      } else if (handler is Handler<T>) {
        yield handler.handle;
      } else if (handler is HandlerFactory<T>) {
        yield handler().handle;
      } else {
        assert(false, 'The handler should be one of the types listed above');
        logger?.warning('Handler of unknown type: $handler');
      }
    }
  }
}
