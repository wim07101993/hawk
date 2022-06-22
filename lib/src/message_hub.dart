import 'package:hawk/src/handler_collection/handler_collection.dart';

abstract class MessageHub {
  HandlerCollection get handlers;

  Future<void> send<T>(T message);
}
