import 'package:equatable/equatable.dart';
import 'package:test_riverpod/data/models/bed_place_model.dart';
import 'package:test_riverpod/data/models/entertainment_model.dart';
import 'package:test_riverpod/data/models/facility_model.dart';

class RecreationAreaEntity extends Equatable {
  const RecreationAreaEntity({
    required this.id,
    required this.name,
    required this.photos,
    required this.viewCount,
    required this.price,
    required this.address,
    required this.descr,
    required this.peopleCount,
    required this.entertainments,
    required this.facilities,
    required this.bedPlaces,
  });

  final String id;
  final String name;
  final List<String> photos;
  final int viewCount;
  final double price;
  final String address;
  final String descr;
  final int peopleCount;
  final List<EntertainmentModel> entertainments;
  final List<FacilityModel> facilities;
  final List<BedPlaceModel> bedPlaces;

  @override
  List<Object?> get props => [
        id,
        name,
        photos,
        viewCount,
        price,
        address,
        descr,
        peopleCount,
        entertainments,
        facilities,
        bedPlaces,
      ];
}
