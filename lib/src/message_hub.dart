import 'package:hawk/hawk.dart';

abstract class MessageHub {
  BehaviourStore get behaviours;

  void send<T>(T message);

  Future<ExceptionOr<TResponse>> sendAndWaitForResponse<TMessage, TResponse>(
    TMessage message,
  );
}
