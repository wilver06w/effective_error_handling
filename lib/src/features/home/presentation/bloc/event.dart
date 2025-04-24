part of 'bloc.dart';

abstract class OrdersEvent extends Equatable {
  const OrdersEvent();

  @override
  List<Object> get props => <Object>[];
}

class GetOrderListEvent extends OrdersEvent {
  const GetOrderListEvent({
    this.page = 1,
  });
  final int page;
}
