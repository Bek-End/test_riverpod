import 'package:equatable/equatable.dart';

class EntertainmentEntity extends Equatable {
  const EntertainmentEntity({
    required this.id,
    required this.name,
    required this.urlMedia,
    required this.count,
  });

  final String id;
  final String name;
  final String urlMedia;
  final int count;

  @override
  List<Object?> get props => [id, name, urlMedia, count];
}
