part of 'bloc.dart';

abstract class ArchetypesState extends Equatable {
  const ArchetypesState(this.model);
  final Model model;

  @override
  List<Object?> get props => <Object?>[model];
}

class InitialState extends ArchetypesState {
  const InitialState(super.model);
}

class ErrorGetArchetypeState extends ArchetypesState {
  const ErrorGetArchetypeState({
    required Model model,
    required this.message,
  }) : super(model);
  final String message;
}

class LoadedGetArchetypeState extends ArchetypesState {
  const LoadedGetArchetypeState(super.model);
}


class LoadingGetArchetypeState extends ArchetypesState {
  const LoadingGetArchetypeState(super.model);
}

class Model extends Equatable {
  const Model({
    this.listArchetype,
  });

  final List<Archetype>? listArchetype;

  Model copyWith({
    List<Archetype>? listArchetype,
  }) {
    return Model(
      listArchetype: listArchetype ?? this.listArchetype,
    );
  }

  @override
  List<Object?> get props {
    return <Object?>[
      listArchetype,
    ];
  }
}
