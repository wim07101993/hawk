import 'dart:async';

import 'package:behaviour/behaviour.dart';
import 'package:hawk/hawk.dart';

class HandlerFunctionWrapper<T> extends Behaviour<T, void> {
  HandlerFunctionWrapper({
    required this.handlerFunction,
    super.monitor,
  });

  final HandlerFunction<T> handlerFunction;

  @override
  Future<void> action(T input, BehaviourTrack? track) async {
    await handlerFunction;
  }

  @override
  String get description => 'executing handler function';

  @override
  FutureOr<Exception> onCatch(
    Object e,
    StackTrace stacktrace,
    BehaviourTrack? track,
  ) {
    if (e is Exception) {
      return e;
    }
    return Exception('An error happened while executing a handler function');
  }
}
