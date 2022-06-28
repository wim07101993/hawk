import 'package:hawk/hawk.dart';

abstract class EventHub {
  HandlerStore get handlers;

  void send<T>(T event);

  Future<TResponse> sendAndWaitForResponse<TEvent, TResponse>(TEvent event);
}
