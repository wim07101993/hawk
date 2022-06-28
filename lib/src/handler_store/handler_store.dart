import 'package:hawk/hawk.dart';

abstract class HandlerStore {
  void add<T>(Handler<T> handler);
  void remove<T>(Handler<T> handler);

  void addFactory<T>(HandlerFactory<T> factory);
  void removeFactory<T>(HandlerFactory<T> factory);

  Iterable<Handler<T>> get<T>();

  void addResponding<TMessage, TResponse>(
    RespondingHandler<TMessage, TResponse> handler,
  );
  void removeResponding<TMessage, TResponse>(
    RespondingHandler<TMessage, TResponse> handler,
  );

  void addRespondingFactory<TMessage, TResponse>(
    RespondingHandlerFactory<TMessage, TResponse> factory,
  );
  void removeRespondingFactory<TMessage, TResponse>(
    RespondingHandlerFactory<TMessage, TResponse> factory,
  );

  RespondingHandler<TMessage, TResponse> getResponding<TMessage, TResponse>();
}
