import 'package:hawk/hawk.dart';

class MessageHubImpl implements MessageHub {
  MessageHubImpl.withBehaviourStore({
    required this.behaviours,
  });

  factory MessageHubImpl() {
    return MessageHubImpl.withBehaviourStore(
      behaviours: BehaviourStoreImpl(),
    );
  }

  @override
  final BehaviourStore behaviours;

  @override
  void send<T>(T message) async {
    behaviours.get<T>().map((behaviour) async => await behaviour(message));
  }

  @override
  Future<ExceptionOr<TResponse>> sendAndWaitForResponse<TMessage, TResponse>(
    TMessage message,
  ) {
    return behaviours.getWithResponse<TMessage, TResponse>()(message);
  }
}
