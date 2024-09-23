import 'package:equatable/equatable.dart';

class FilterParametes extends Equatable {
  const FilterParametes({
    this.startDate,
    this.endDate,
    this.minPrice,
    this.maxPrice,
    this.distantion,
    this.houseNames,
    this.minPlaceCount,
    this.maxPlaceCount,
    this.facilityNames,
    this.entertainmentNames,
    this.babyPlaceCount,
  });

  final DateTime? startDate;
  final DateTime? endDate;
  final int? minPrice;
  final int? maxPrice;
  final int? distantion;
  final List<String>? houseNames;
  final int? minPlaceCount;
  final int? maxPlaceCount;
  final List<String>? facilityNames;
  final List<String>? entertainmentNames;
  final int? babyPlaceCount;

  FilterParametes copyWith({
    DateTime? startDate,
    DateTime? endDate,
    int? minPrice,
    int? maxPrice,
    int? distantion,
    List<String>? houseNames,
    int? minPlaceCount,
    int? maxPlaceCount,
    List<String>? facilityNames,
    List<String>? entertainmentNames,
    int? babyPlaceCount,
  }) {
    return FilterParametes(
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      minPrice: minPrice ?? this.minPrice,
      maxPrice: maxPrice ?? this.maxPrice,
      distantion: distantion ?? this.distantion,
      houseNames: houseNames ?? this.houseNames,
      minPlaceCount: minPlaceCount ?? this.minPlaceCount,
      maxPlaceCount: maxPlaceCount ?? this.maxPlaceCount,
      facilityNames: facilityNames ?? this.facilityNames,
      entertainmentNames: entertainmentNames ?? this.entertainmentNames,
      babyPlaceCount: babyPlaceCount ?? this.babyPlaceCount,
    );
  }

  @override
  List<Object?> get props => [
        startDate,
        endDate,
        minPrice,
        maxPrice,
        distantion,
        houseNames,
        minPlaceCount,
        maxPlaceCount,
        facilityNames,
        entertainmentNames,
      ];
}
