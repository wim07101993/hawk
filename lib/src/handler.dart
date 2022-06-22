import 'dart:async';

import 'package:behaviour/behaviour.dart';

typedef HandlerFunction<T> = FutureOr<T> Function(T message);

typedef HandlerFactory<T> = Handler<T> Function();

typedef Handler<T> = Behaviour<T, void>;
