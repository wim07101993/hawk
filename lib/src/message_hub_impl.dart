import 'package:hawk/hawk.dart';

class MessageHubImpl implements MessageHub {
  MessageHubImpl.withHandlerCollection({
    required this.handlers,
  });

  factory MessageHubImpl() {
    return MessageHubImpl.withHandlerCollection(
      handlers: HandlerCollectionImpl(),
    );
  }

  @override
  final HandlerCollection handlers;

  @override
  Future<void> send<T>(T message) async {
    final executions = handlers.get<T>().map((h) async => await h(message));
    Future.wait(executions);
  }
}
