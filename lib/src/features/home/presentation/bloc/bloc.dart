import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../shared/http/failures.dart';
import '../../data/models/archetype.dart';
import '../../domain/usecases/get_archetypes_usecase.dart';

part 'event.dart';
part 'state.dart';

class BlocArchetypes extends Bloc<ArchetypeEvent, ArchetypesState> {
  BlocArchetypes({
    required this.getOrdersUseCase,
  }) : super(const InitialState(Model())) {
    on<GetArchetypesEvent>(_onGetArchetypesEvent);
  }

  final GetOrdersUseCase getOrdersUseCase;

  Future<void> _onGetArchetypesEvent(
    GetArchetypesEvent event,
    Emitter<ArchetypesState> emit,
  ) async {
    emit(
      LoadingGetArchetypeState(
        state.model,
      ),
    );
    
    final (Failure?, List<Archetype>) getOrders = await getOrdersUseCase.getArchetypes();

    final Failure? failure = getOrders.$1;
    final List<Archetype> data = getOrders.$2;

    if (failure != null) {
      emit(
        ErrorGetArchetypeState(
          model: state.model,
          message: getOrders.$1!.message,
        ),
      );
      return;
    } else {
      emit(
        LoadedGetArchetypeState(
          state.model.copyWith(
            listArchetype: data,
          ),
        ),
      );
    }
  }
}
