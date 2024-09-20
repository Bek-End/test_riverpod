import 'package:equatable/equatable.dart';

class FacilityModel extends Equatable {
  const FacilityModel({
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
