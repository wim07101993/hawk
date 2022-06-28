import 'package:hawk/hawk.dart';

class EventHubImpl implements EventHub {
  EventHubImpl.withHandlerStore({
    required this.handlers,
  });

  factory EventHubImpl() {
    return EventHubImpl.withHandlerStore(
      handlers: HandlerStoreImpl(),
    );
  }

  @override
  final HandlerStore handlers;

  @override
  void send<T>(T event) async {
    handlers.get<T>().map((handler) async => await handler(event));
  }

  @override
  Future<TResponse> sendAndWaitForResponse<TEvent, TResponse>(TEvent event) {
    return handlers.getResponding<TEvent, TResponse>()(event);
  }
}
