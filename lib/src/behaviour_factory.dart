import 'package:behaviour/behaviour.dart';

typedef BehaviourFactory<TMessage> = BehaviourInterface<TMessage, void>
    Function();

typedef RespondingBehaviourFactory<TMessage, TResponse>
    = BehaviourInterface<TMessage, TResponse> Function();
