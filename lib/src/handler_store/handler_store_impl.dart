import 'package:hawk/hawk.dart';

class HandlerStoreImpl implements HandlerStore {
  final List _handlers = [];
  final List _respondingBehaviour = [];

  void add<T>(Handler<T> handler) => _handlers.add(handler);

  void remove<T>(Handler<T> handler) => _handlers.remove(handler);

  void addFactory<T>(HandlerFactory<T> factory) => _handlers.add(factory);

  void removeFactory<T>(HandlerFactory<T> factory) => _handlers.remove(factory);

  Iterable<Handler<T>> get<T>() sync* {
    for (final handler in _handlers) {
      if (handler is Handler<T>) {
        yield handler;
      } else if (handler is HandlerFactory<T>) {
        yield handler();
      }
    }
  }

  void addResponding<TMessage, TResponse>(
    RespondingHandler<TMessage, TResponse> handler,
  ) {
    _respondingBehaviour.add(handler);
  }

  void removeResponding<TMessage, TResponse>(
    RespondingHandler<TMessage, TResponse> handler,
  ) {
    _respondingBehaviour.remove(handler);
  }

  void addRespondingFactory<TMessage, TResponse>(
    RespondingHandlerFactory<TMessage, TResponse> factory,
  ) {
    _respondingBehaviour.add(factory);
  }

  void removeRespondingFactory<TMessage, TResponse>(
    RespondingHandlerFactory<TMessage, TResponse> factory,
  ) {
    _respondingBehaviour.remove(factory);
  }

  RespondingHandler<TMessage, TResponse> getResponding<TMessage, TResponse>() {
    RespondingHandler<TMessage, TResponse>? handler;
    for (final h in _handlers) {
      if (h is RespondingHandler<TMessage, TResponse>) {
        if (handler != null) {
          throw Exception('Ambiguous responding handler for message $TMessage'
              ' and response $TResponse.');
        }
        handler = h;
      } else if (h is RespondingHandlerFactory<TMessage, TResponse>) {
        if (handler != null) {
          throw Exception('Ambiguous responding handler for message $TMessage'
              ' and response $TResponse.');
        }
      }
    }

    if (handler == null) {
      throw Exception('No handler was found for  message $TMessage and '
          'response $TResponse.');
    }

    return handler;
  }
}
