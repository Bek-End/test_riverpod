import 'package:equatable/equatable.dart';

class BedPlaceEntity extends Equatable {
  const BedPlaceEntity({
    required this.id,
    required this.name,
    required this.urlIcon,
    required this.count,
  });

  final String id;
  final String name;
  final String urlIcon;
  final int count;

  @override
  List<Object?> get props => [id, name, urlIcon, count];
}
