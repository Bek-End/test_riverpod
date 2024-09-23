part of 'recreation_area_bloc.dart';

sealed class RecreationAreaEvent extends Equatable {
  const RecreationAreaEvent();

  @override
  List<Object> get props => [];
}

final class RecreationAreaGetEvent extends RecreationAreaEvent {}

final class RecreationAreaFavoriteEvent extends RecreationAreaEvent {
  const RecreationAreaFavoriteEvent(this.recreationAreaEntity);

  final RecreationAreaEntity recreationAreaEntity;

  @override
  List<Object> get props => [...super.props, recreationAreaEntity];
}
