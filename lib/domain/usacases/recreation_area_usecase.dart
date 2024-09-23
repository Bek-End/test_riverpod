import 'package:test_riverpod/data/repos/remote_repo.dart';
import 'package:test_riverpod/domain/entities/recreation_area_entity.dart';

class RecreationAreaUsecase {
  const RecreationAreaUsecase({
    required RemoteRepo remoteRepository,
  }) : _remoteRepository = remoteRepository;

  final RemoteRepo _remoteRepository;

  Future<List<RecreationAreaEntity>> getAllRecreationAreas() async {
    final recreationAreasList = <RecreationAreaEntity>[];

    final recreationAreas = await _remoteRepository.getAllRecreationAreas();

    for (var recreationArea in recreationAreas) {
      recreationAreasList.add(RecreationAreaEntity(
        id: recreationArea.id,
        name: recreationArea.name,
        photos: recreationArea.photos,
        viewCount: recreationArea.viewCount,
        price: recreationArea.price,
        address: recreationArea.address,
        descr: recreationArea.descr,
        minPeopleCount: recreationArea.minPeopleCount,
        maxPeopleCount: recreationArea.maxPeopleCount,
        entertainments: recreationArea.entertainments,
        facilities: recreationArea.facilities,
        bedPlaces: recreationArea.bedPlaces,
        info: recreationArea.info,
        houseType: recreationArea.houseType,
      ));
    }

    return recreationAreasList;
  }
}
