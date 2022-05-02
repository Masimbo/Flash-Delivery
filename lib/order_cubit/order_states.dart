abstract class OrderStates{}

class OrderInitialStates extends OrderStates{}

class OrderSuccessState extends OrderInitialStates{
  String message;
  OrderSuccessState(this.message);
}

class OrderFailedState extends OrderInitialStates{}

class LoadingState extends OrderInitialStates{}