import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../shared/http/failures.dart';
import '../../data/models/archetype.dart';
import '../../domain/usecases/get_order_usecase.dart';

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
    final Either<Failure, List<Archetype>> getOrders = await getOrdersUseCase.getOrders();

    getOrders.fold((Failure l) {
      emit(
        ErrorGetOrderState(
          model: state.model,
          message: l.message,
        ),
      );
    }, (List<Archetype> r) {
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
