import 'package:test_riverpod/common/enums/house_type.dart';
import 'package:test_riverpod/data/models/bed_place_model.dart';
import 'package:test_riverpod/data/models/entertainment_model.dart';
import 'package:test_riverpod/data/models/facility_model.dart';
import 'package:test_riverpod/data/models/recreation_area_model.dart';
import 'package:test_riverpod/data/repos/remote_repo.dart';

class RemoteRepositoryImpl implements RemoteRepo {
  @override
  Future<List<RecreationAreaModel>> getAllRecreationAreas() async {
    await Future.delayed(const Duration(seconds: 2));
    return List.generate(3, (index) => _recreationAreaModel);
  }
}

final _recreationAreaModel = RecreationAreaModel(
  id: 'id',
  name: 'Этнопарк INAYA',
  photos: List.generate(6, (index) => 'assets/images/image.png'),
  viewCount: 430,
  price: 15000,
  address: 'Республика Башкортостан, Мелеузовский район, д. Сергеевка • 831 км',
  info: 'На сообщения отвечает дольше других, связывайтесь по телефону',
  descr:
      'Единственный эко-отель в Башкирии и на всём Южном Урале, где можно пожить в настоящих башкирских юртах!\n\nМы ждем вас в гости с семьей или друзьями! Юрты, как и в древние времена, изготовлены из войлока и дерева, а для более комфортного проживания оборудованы печью-камином и электричеством. Они расположены на живописном берегу Нугушского водохранилища, вдали от повседневных забот, городского шума и суеты. Опыт проживания в юртах - это идеальный способ погрузиться за короткий срок в быт и культуру местного кочевого этноса - башкир.',
  houseType: HouseType.house1,
  minPeopleCount: 6,
  maxPeopleCount: 12,
  entertainments: const [
    EntertainmentModel(
      id: 'id0',
      name: 'Конные прогулки',
      urlMedia: 'assets/images/image_6.png',
      count: 1,
    ),
    EntertainmentModel(
      id: 'id1',
      name: 'Водоём',
      urlMedia: 'assets/images/image_0.png',
      count: 1,
    ),
    EntertainmentModel(
      id: 'id2',
      name: 'SUP-доски',
      urlMedia: 'assets/images/image_5.png',
      count: 1,
    ),
  ],
  facilities: const [
    FacilityModel(
      id: 'id0',
      name: 'Мангал',
      urlIcon: 'assets/icons/facility_0.svg',
      count: 1,
    ),
    FacilityModel(
      id: 'id1',
      name: 'Парковка',
      urlIcon: 'assets/icons/facility_1.svg',
      count: 1,
    ),
    FacilityModel(
      id: 'id2',
      name: 'ТВ',
      urlIcon: 'assets/icons/facility_2.svg',
      count: 1,
    ),
    FacilityModel(
      id: 'id3',
      name: 'Кондиционер',
      urlIcon: 'assets/icons/facility_3.svg',
      count: 1,
    ),
  ],
  bedPlaces: const [
    BedPlaceModel(
      id: 'id0',
      name: 'Двуспальная кровать',
      urlIcon: 'assets/icons/double_bed.svg',
      count: 3,
    ),
    BedPlaceModel(
      id: 'id1',
      name: 'Диван',
      urlIcon: 'assets/icons/sofa.svg',
      count: 1,
    ),
    BedPlaceModel(
      id: 'id2',
      name: 'Место для младенца',
      urlIcon: 'assets/icons/baby_place.svg',
      count: 1,
    ),
  ],
);
