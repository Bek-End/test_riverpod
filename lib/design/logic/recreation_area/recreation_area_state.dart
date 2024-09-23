part of 'recreation_area_bloc.dart';

sealed class RecreationAreaState extends Equatable {
  const RecreationAreaState();

  @override
  List<Object> get props => [];
}

final class ProfileLoadingState extends RecreationAreaState {}

final class RecreationAreaCompletedState extends RecreationAreaState {
  const RecreationAreaCompletedState(this.recreationAreas);

  final List<RecreationAreaEntity> recreationAreas;

  @override
  List<Object> get props => [...super.props, recreationAreas];
}
