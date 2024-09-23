import 'package:test_riverpod/common/constant/assets.dart';

enum HouseType { all, house1, glamping, house2 }

extension HouseTypeExtentions on HouseType {
  String get icon {
    switch (this) {
      case HouseType.all:
        return Assets.menu2;
      case HouseType.house1:
        return Assets.houses[1];
      case HouseType.glamping:
        return Assets.houses[1];
      case HouseType.house2:
        return Assets.houses[2];
    }
  }

  String get label {
    switch (this) {
      case HouseType.all:
        return 'Все';
      case HouseType.house1:
        return 'Кэмпинги';
      case HouseType.glamping:
        return 'Глэмпинги';
      case HouseType.house2:
        return 'Базы отдыха';
    }
  }
}
