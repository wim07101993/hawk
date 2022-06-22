import 'package:hawk/hawk.dart';

abstract class HandlerCollection {
  void addFunction<T>(HandlerFunction<T> handler);
  void removeFunction<T>(HandlerFunction<T> handler);

  void add<T>(Handler<T> handler);
  void remove<T>(Handler<T> handler);

  void addFactory<T>(HandlerFactory<T> factory);
  void removeFactory<T>(HandlerFactory<T> factory);

  Iterable<Handler<T>> get<T>();
}
