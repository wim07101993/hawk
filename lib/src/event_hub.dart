import 'package:hawk/hawk.dart';

EventHub? _instance;

abstract class EventHub {
  static EventHub get instance => _instance ?? (_instance = EventHubImpl());

  HandlerStore get handlers;

  void send<T>(T event);

  Future<TResponse> sendAndWaitForResponse<TEvent, TResponse>(TEvent event);
}
