import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:effective_error_handling/src/features/home/data/models/archetype.dart';
import 'package:effective_error_handling/src/features/home/domain/usecases/get_order_usecase.dart';
import 'package:equatable/equatable.dart';

part 'event.dart';
part 'state.dart';

class BlocOrders extends Bloc<OrdersEvent, OrdersState> {
  BlocOrders({
    required this.getOrdersUseCase,
  }) : super(const InitialState(Model())) {
    on<GetOrderListEvent>(_onGetOrderListEvent);
  }

  final GetOrdersUseCase getOrdersUseCase;

  Future<void> _onGetOrderListEvent(
    GetOrderListEvent event,
    Emitter<OrdersState> emit,
  ) async {
    emit(
      LoadingGetOrderState(
        state.model,
      ),
    );

    final getOrders = await getOrdersUseCase.getOrders();

    getOrders.fold((l) {
      emit(
        ErrorGetOrderState(
          model: state.model,
          message: l.message,
        ),
      );
    }, (r) {
      emit(
        LoadedGetOrderState(
          state.model.copyWith(
            listArchetype: r,
          ),
        ),
      );
    });
  }
}
