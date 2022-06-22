import 'package:hawk/hawk.dart';
import 'package:hawk/src/handler_collection/handler_function_wrapper.dart';

class HandlerCollectionImpl implements HandlerCollection {
  final List _handlers = [];

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

  Iterable<Handler<T>> get<T>() sync* {
    for (final handler in _handlers) {
      if (handler is HandlerFunction<T>) {
        yield HandlerFunctionWrapper(handlerFunction: handler);
      } else if (handler is Handler<T>) {
        yield handler;
      } else if (handler is HandlerFactory<T>) {
        yield handler();
      } else {
        assert(false, 'The handler should be one of the types listed above');
      }
    }
  }
}
