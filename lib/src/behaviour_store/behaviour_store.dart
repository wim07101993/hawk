import 'package:hawk/hawk.dart';

abstract class BehaviourStore {
  void add<T>(BehaviourInterface<T, void> handler);
  void remove<T>(BehaviourInterface<T, void> handler);

  void addFactory<T>(BehaviourFactory<T> factory);
  void removeFactory<T>(BehaviourFactory<T> factory);

  Iterable<BehaviourInterface<T, void>> get<T>();

  void addResponding<TMessage, TResponse>(
    BehaviourInterface<TMessage, TResponse> handler,
  );
  void removeResponding<TMessage, TResponse>(
    BehaviourInterface<TMessage, TResponse> handler,
  );

  void addRespondingFactory<TMessage, TResponse>(
    RespondingBehaviourFactory<TMessage, TResponse> factory,
  );
  void removeRespondingFactory<TMessage, TResponse>(
    RespondingBehaviourFactory<TMessage, TResponse> factory,
  );

  BehaviourInterface<TMessage, TResponse>
      getWithResponse<TMessage, TResponse>();
}
