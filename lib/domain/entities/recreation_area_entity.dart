import 'package:equatable/equatable.dart';
import 'package:test_riverpod/common/enums/house_type.dart';
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
    required this.info,
    required this.descr,
    required this.houseType,
    required this.minPeopleCount,
    required this.maxPeopleCount,
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
  final String info;
  final String descr;
  final HouseType houseType;
  final int minPeopleCount;
  final int maxPeopleCount;
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
        info,
        descr,
        houseType,
        minPeopleCount,
        maxPeopleCount,
        entertainments,
        facilities,
        bedPlaces,
      ];
}
