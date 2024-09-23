import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:test_riverpod/design/logic/recreation_area/recreation_area_bloc.dart';

class BlocScope extends StatelessWidget {
  const BlocScope({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final getIt = GetIt.I;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                getIt.get<RecreationAreaBloc>()..add(RecreationAreaGetEvent())),
      ],
      child: child,
    );
  }
}
