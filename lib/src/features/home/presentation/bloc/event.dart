part of 'bloc.dart';

abstract class ArchetypeEvent extends Equatable {
  const ArchetypeEvent();

  @override
  List<Object> get props => <Object>[];
}

class GetArchetypesEvent extends ArchetypeEvent {
  const GetArchetypesEvent({
    this.page = 1,
  });
  final int page;
}
