typedef Handler<T> = RespondingHandler<T, void>;

typedef RespondingHandler<TEvent, TResponse> = Future<TResponse> Function(
  TEvent message,
);

typedef HandlerFactory<T> = Handler<T> Function();

typedef RespondingHandlerFactory<TEvent, TResponse>
    = RespondingHandler<TEvent, TResponse> Function();
