import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../generated/l10n.dart';
import '../../../shared/http/http_client.dart' hide ModularWatchExtension;
import '../../../shared/utils/loading.dart';
import '../data/models/archetype.dart';
import '../domain/usecases/get_archetypes_usecase.dart';
import 'bloc/bloc.dart';

part 'package:effective_error_handling/src/features/home/presentation/widgets/body.dart';
part 'package:effective_error_handling/src/features/home/presentation/widgets/my_card.dart';

class Page extends StatelessWidget {
  const Page({super.key});

  @override
  Widget build(BuildContext context) {
    final GetOrdersUseCase getOrdersUseCase = Modular.get<GetOrdersUseCase>();
    return BlocProvider<BlocArchetypes>(
      create: (BuildContext context) => BlocArchetypes(
        getOrdersUseCase: getOrdersUseCase,
      )..add(const GetArchetypesEvent()),
      child: const BlocListener<BlocArchetypes, ArchetypesState>(
        listener: _listener,
        child: Body(),
      ),
    );
  }
}

Future<void> _listener(BuildContext context, ArchetypesState state) async {
  if (state is LoadingGetArchetypeState) {
    AppLoading.show(context);
  } else if (state is ErrorGetArchetypeState) {
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(state.message),
        backgroundColor: Colors.red,
      ),
    );
  } else if (state is LoadedGetArchetypeState) {
    Navigator.pop(context);
  }
}
