import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_riverpod/domain/entities/recreation_area_entity.dart';
import 'package:test_riverpod/domain/usacases/recreation_area_usecase.dart';

part 'recreation_area_event.dart';
part 'recreation_area_state.dart';

class RecreationAreaBloc
    extends Bloc<RecreationAreaEvent, RecreationAreaState> {
  RecreationAreaBloc(this._recreationAreaUsecase)
      : super(ProfileLoadingState()) {
    on<RecreationAreaGetEvent>(_getRecreationAreas);
    on<RecreationAreaFavoriteEvent>(_addFavoriteRecreationArea);
  }

  final RecreationAreaUsecase _recreationAreaUsecase;

  void _getRecreationAreas(
      RecreationAreaGetEvent event, Emitter<RecreationAreaState> emit) async {
    final recreationAreas = <RecreationAreaEntity>[];
    try {
      recreationAreas
          .addAll(await _recreationAreaUsecase.getAllRecreationAreas());
    } finally {
      emit(RecreationAreaCompletedState(recreationAreas));
    }
  }

  void _addFavoriteRecreationArea(RecreationAreaFavoriteEvent event,
      Emitter<RecreationAreaState> emit) async {}
}
