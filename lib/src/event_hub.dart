import 'package:hawk/hawk.dart';
import 'package:hawk/src/event_hub_impl.dart';

EventHub? _instance;

abstract class EventHub {
  factory EventHub.instance() => _instance ?? (_instance = EventHubImpl());

  HandlerStore get handlers;

  void send<T>(T event);

  Future<TResponse> sendAndWaitForResponse<TEvent, TResponse>(TEvent event);
}
