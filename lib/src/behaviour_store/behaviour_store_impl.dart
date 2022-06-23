import 'package:hawk/hawk.dart';

class BehaviourStoreImpl implements BehaviourStore {
  final List _behaviours = [];
  final List _respondingBehaviour = [];

  void add<T>(BehaviourInterface<T, void> handler) => _behaviours.add(handler);

  void remove<T>(BehaviourInterface<T, void> handler) {
    _behaviours.remove(handler);
  }

  void addFactory<T>(BehaviourFactory<T> factory) => _behaviours.add(factory);

  void removeFactory<T>(BehaviourFactory<T> factory) {
    _behaviours.remove(factory);
  }

  Iterable<BehaviourInterface<T, void>> get<T>() sync* {
    for (final handler in _behaviours) {
      if (handler is BehaviourInterface<T, void>) {
        yield handler;
      } else if (handler is BehaviourFactory<T>) {
        yield handler();
      }
    }
  }

  void addResponding<TMessage, TResponse>(
    BehaviourInterface<TMessage, TResponse> handler,
  ) {
    _respondingBehaviour.add(handler);
  }

  void removeResponding<TMessage, TResponse>(
    BehaviourInterface<TMessage, TResponse> handler,
  ) {
    _respondingBehaviour.remove(handler);
  }

  void addRespondingFactory<TMessage, TResponse>(
    RespondingBehaviourFactory<TMessage, TResponse> factory,
  ) {
    _respondingBehaviour.add(factory);
  }

  void removeRespondingFactory<TMessage, TResponse>(
    RespondingBehaviourFactory<TMessage, TResponse> factory,
  ) {
    _respondingBehaviour.remove(factory);
  }

  BehaviourInterface<TMessage, TResponse>
      getWithResponse<TMessage, TResponse>() {
    return _respondingBehaviour
        .map((item) {
          if (item is BehaviourInterface<TMessage, TResponse>) {
            return item;
          } else if (item is RespondingBehaviourFactory<TMessage, TResponse>) {
            return item();
          } else {
            return null;
          }
        })
        .whereType<BehaviourInterface<TMessage, TResponse>>()
        .single;
  }
}
