import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_riverpod/common/constant/app_colors.dart';
import 'package:test_riverpod/common/constant/assets.dart';
import 'package:test_riverpod/data/models/bed_place_model.dart';
import 'package:test_riverpod/data/models/entertainment_model.dart';
import 'package:test_riverpod/data/models/facility_model.dart';
import 'package:test_riverpod/data/models/recreation_area_model.dart';
import 'package:test_riverpod/design/widgets/recreation_area_card_widget.dart';
import 'package:test_riverpod/design/widgets/text_form_field_widget.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _searchCtrl = TextEditingController();

  int _currMenuIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(28, 4, 20, 12),
              child: Row(
                children: [
                  SvgPicture.asset(Assets.menu),
                  const SizedBox(width: 16),
                  Expanded(
                    child: SizedBox(
                      height: 48,
                      child: TextFormFieldWidget(
                        controller: _searchCtrl,
                        hintText: 'Поиск',
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset(Assets.search),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: AppColors.black,
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(Assets.filter),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: FittedBox(
                child: Row(
                  children: List.generate(
                    _MenuType.values.length,
                    (index) {
                      final item = _MenuType.values[index];
                      return _Menu(
                        onTap: () => setState(() => _currMenuIndex = index),
                        icon: item.icon,
                        label: item.label,
                        isChecked: _currMenuIndex == index,
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemBuilder: (context, index) {
                  return RecreationAreaCardWidget(
                    recreationArea: _recreationAreaModel,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: FloatingActionButton.extended(
          backgroundColor: AppColors.black,
          onPressed: () {},
          label: const Text(
            'На карте',
            style:
                TextStyle(color: AppColors.white), // TODO remove static style
          ),
          icon: SvgPicture.asset(Assets.map),
        ),
      ),
    );
  }
}

class _Menu extends StatelessWidget {
  const _Menu({
    required this.icon,
    required this.label,
    required this.isChecked,
    required this.onTap,
  });

  final String icon;
  final String label;
  final bool isChecked;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
        decoration: BoxDecoration(
          color: isChecked ? AppColors.black10 : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 40,
              height: 40,
              child: Center(child: SvgPicture.asset(icon)),
            ),
            Text(label),
          ],
        ),
      ),
    );
  }
}

enum _MenuType { all, house1, glamping, house2 }

extension _MenuTypeExtentions on _MenuType {
  String get icon {
    switch (this) {
      case _MenuType.all:
        return Assets.menu2;
      case _MenuType.house1:
        return Assets.houses[1];
      case _MenuType.glamping:
        return Assets.houses[1];
      case _MenuType.house2:
        return Assets.houses[2];
    }
  }

  String get label {
    switch (this) {
      case _MenuType.all:
        return 'Все';
      case _MenuType.house1:
        return 'Кэмпинги';
      case _MenuType.glamping:
        return 'Глэмпинги';
      case _MenuType.house2:
        return 'Базы отдыха';
    }
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
