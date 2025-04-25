import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

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
    final List<Archetype> getOrders = await getOrdersUseCase.getArchetypes();

    emit(
      LoadedGetArchetypeState(
        state.model.copyWith(
          listArchetype: getOrders,
        ),
      ),
    );
  }
}
