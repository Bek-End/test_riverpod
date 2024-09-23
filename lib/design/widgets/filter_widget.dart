import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:test_riverpod/common/constant/app_colors.dart';
import 'package:test_riverpod/common/constant/app_text_styles.dart';
import 'package:test_riverpod/common/constant/assets.dart';
import 'package:test_riverpod/common/extentions/string_extentions.dart';
import 'package:test_riverpod/design/logic/filter/filter_parameters.dart';
import 'package:test_riverpod/design/logic/filter/filter_provider.dart';
import 'package:test_riverpod/design/widgets/bar_chart_widget.dart';

class FilterWidget extends ConsumerStatefulWidget {
  const FilterWidget({super.key});

  @override
  ConsumerState<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends ConsumerState<FilterWidget> {
  final _houses = [
    'A-Frame',
    'Сафари',
    'Базы отдыха',
    'Барн хаусы',
    'Сферы',
    'Модульные дома',
    'Шале',
    'Дома бочки',
  ];
  final _facilities = [
    'Мангал',
    'Парковка',
    'TB',
    'Кондиционер',
    'Кухня',
    'Wi-Fi',
    'Беседка',
  ];
  final _entertaintments = [
    'Водоем',
    'Джакузи',
    'Бильярд',
    'Фурако',
    'Бассеин',
    'Sup board',
    'Конные прогулки',
    'Велосипеды',
  ];
  final _panelExpansionsMode = [true, true, true, true, true, true];

  FilterParametes? _filterParametes;

  DateTime get _now => DateTime.now();

  @override
  void initState() {
    _filterParametes = ref.read(filterProvider) ?? const FilterParametes();
    super.initState();
  }

  void _expansionCallback(int index) {
    setState(() => _panelExpansionsMode[index] = !_panelExpansionsMode[index]);
  }

  String _dateRange() {
    if (_filterParametes?.startDate == null ||
        _filterParametes?.endDate == null) return 'Ближайшие';
    final date1 = _filterParametes?.startDate ?? _now;
    final date2 = _filterParametes?.endDate ?? _now;
    final ddMMMMyyyyFormat = DateFormat("dd MMMM yyyy");
    final ddMMMMFormat = DateFormat("dd MMMM");

    if (date1.year == date2.year) {
      if (date1.month == date2.month) {
        return '${date1.day}-${ddMMMMyyyyFormat.format(date2)}';
      }
      return '${ddMMMMFormat.format(date1)} - ${ddMMMMyyyyFormat.format(date2)}';
    }
    return '${ddMMMMyyyyFormat.format(date1)} - ${ddMMMMyyyyFormat.format(date2)}';
  }

  void _showDateRangePicker() {
    showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.utc(2100),
    ).then((value) {
      if (value == null) return;
      setState(() {
        _filterParametes = _filterParametes?.copyWith(
            startDate: value.start, endDate: value.end);
      });
    });
  }

  void _changePriceParameter(RangeValues values) {
    setState(() {
      _filterParametes = _filterParametes?.copyWith(
          minPrice: values.start.toInt(), maxPrice: values.end.toInt());
    });
  }

  void _changeDistanceParameter(double value) {
    setState(() {
      _filterParametes = _filterParametes?.copyWith(distantion: value.toInt());
    });
  }

  void _changeHousesParameter(int index) {
    setState(() {
      if ((_filterParametes?.houseNames ?? []).contains(_houses[index])) {
        _filterParametes = _filterParametes?.copyWith(
            houseNames: (_filterParametes?.houseNames ?? [])
              ..remove(_houses[index]));
      } else {
        _filterParametes = _filterParametes?.copyWith(
            houseNames: (_filterParametes?.houseNames ?? [])
              ..add(_houses[index]));
      }
    });
  }

  void _changePlaceCountParameter(RangeValues values) {
    setState(() {
      _filterParametes = _filterParametes?.copyWith(
          minPlaceCount: values.start.toInt(),
          maxPlaceCount: values.end.toInt());
    });
  }

  void _changeBabyPlaceCountParameter(int newBabyPlaceCount) {
    if (newBabyPlaceCount.isNegative) return;
    setState(() => _filterParametes =
        _filterParametes?.copyWith(babyPlaceCount: newBabyPlaceCount));
  }

  void _changeFacilitiesParameter(int index) {
    setState(() {
      if ((_filterParametes?.facilityNames ?? [])
          .contains(_facilities[index])) {
        _filterParametes = _filterParametes?.copyWith(
            facilityNames: (_filterParametes?.facilityNames ?? [])
              ..remove(_facilities[index]));
      } else {
        _filterParametes = _filterParametes?.copyWith(
            facilityNames: (_filterParametes?.facilityNames ?? [])
              ..add(_facilities[index]));
      }
    });
  }

  void _changeEntertainmentsParameter(int index) {
    setState(() {
      if ((_filterParametes?.entertainmentNames ?? [])
          .contains(_entertaintments[index])) {
        _filterParametes = _filterParametes?.copyWith(
            entertainmentNames: (_filterParametes?.entertainmentNames ?? [])
              ..remove(_entertaintments[index]));
      } else {
        _filterParametes = _filterParametes?.copyWith(
            entertainmentNames: (_filterParametes?.entertainmentNames ?? [])
              ..add(_entertaintments[index]));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    return Column(
      children: [
        Expanded(
          child: ListView(
            padding: mq.viewInsets + const EdgeInsets.fromLTRB(20, 16, 20, 24),
            shrinkWrap: true,
            children: [
              const Text('Фильтры', style: AppTextStyles.h2),
              const SizedBox(height: 22),
              const _RichText(title: 'Даты поездки', count: 212),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 16,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.black25),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(_dateRange(), style: AppTextStyles.button),
                    ),
                    const SizedBox(width: 12),
                    InkWell(
                      onTap: _showDateRangePicker,
                      child: SvgPicture.asset(Assets.calendar),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Divider(),
              ExpansionPanelList(
                elevation: 0,
                materialGapSize: 0,
                expandIconColor: AppColors.black,
                expansionCallback: (index, _) => _expansionCallback(index),
                children: [
                  ExpansionPanel(
                    isExpanded: _panelExpansionsMode[0],
                    backgroundColor: AppColors.white,
                    headerBuilder: (context, isExpanded) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (!_panelExpansionsMode[0])
                            const SizedBox(height: 24),
                          const _RichText(title: 'Ценовой диапазон', count: 12),
                          const SizedBox(height: 8),
                          Text(
                            '${(_filterParametes?.minPrice ?? 0).toString().addSeparator()} ₽ – ${(_filterParametes?.maxPrice ?? 1000000).toString().addSeparator()} ₽',
                            style: AppTextStyles.p.copyWith(
                              color: AppColors.black,
                            ),
                          ),
                          if (_panelExpansionsMode[0])
                            const Text(
                              'Средняя цена за сутки 12 000 ₽',
                              style: AppTextStyles.p,
                            ),
                          const SizedBox(height: 24),
                        ],
                      );
                    },
                    body: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.bottomCenter,
                          children: [
                            const Column(
                              children: [
                                BarChartWidget(),
                                SizedBox(height: 23),
                              ],
                            ),
                            RangeSlider(
                              min: 0,
                              max: 1000000,
                              onChanged: _changePriceParameter,
                              values: RangeValues(
                                (_filterParametes?.minPrice ?? 0).toDouble(),
                                (_filterParametes?.maxPrice ?? 1000000)
                                    .toDouble(),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        const Divider()
                      ],
                    ),
                  ),
                  ExpansionPanel(
                    isExpanded: _panelExpansionsMode[1],
                    backgroundColor: AppColors.white,
                    headerBuilder: (context, isExpanded) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (!_panelExpansionsMode[1])
                            const SizedBox(height: 24),
                          const _RichText(title: 'Отдаленость', count: 12),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              SvgPicture.asset(
                                Assets.send,
                                width: 12,
                                height: 12,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                '${(_filterParametes?.distantion ?? 1000000).toString().addSeparator()} км',
                                style: AppTextStyles.p.copyWith(
                                  color: AppColors.black,
                                ),
                              ),
                            ],
                          ),
                          if (!_panelExpansionsMode[1])
                            const SizedBox(height: 24),
                        ],
                      );
                    },
                    body: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.bottomCenter,
                          children: [
                            const Column(
                              children: [
                                SizedBox(height: 16),
                                BarChartWidget(),
                                SizedBox(height: 23),
                              ],
                            ),
                            Slider(
                              min: 0,
                              max: 1000000,
                              onChanged: _changeDistanceParameter,
                              value: (_filterParametes?.distantion ?? 1000000)
                                  .toDouble(),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        const Divider(),
                      ],
                    ),
                  ),
                  ExpansionPanel(
                    isExpanded: _panelExpansionsMode[2],
                    backgroundColor: AppColors.white,
                    headerBuilder: (context, isExpanded) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (!_panelExpansionsMode[2])
                            const SizedBox(height: 24),
                          const Text('Дома', style: AppTextStyles.h3),
                          if (!_panelExpansionsMode[2]) ...[
                            const SizedBox(height: 8),
                            Text((_filterParametes?.houseNames ?? [])
                                .join(', ')),
                          ],
                          const SizedBox(height: 24),
                        ],
                      );
                    },
                    body: GridView.builder(
                      itemCount: Assets.houses.length,
                      shrinkWrap: true,
                      primary: false,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 16,
                        childAspectRatio: 1.7,
                      ),
                      itemBuilder: (_, index) {
                        return InkWell(
                          onTap: () => _changeHousesParameter(index),
                          borderRadius: BorderRadius.circular(16),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 16,
                            ),
                            decoration: BoxDecoration(
                              color: !(_filterParametes?.houseNames ?? [])
                                      .contains(_houses[index])
                                  ? AppColors.white
                                  : AppColors.black10,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: AppColors.black25),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: Center(
                                    child: SvgPicture.asset(
                                      (Assets.houses[index]),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                _RichText(
                                  title: _houses[index],
                                  count: 12,
                                  style: AppTextStyles.lable,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  ExpansionPanel(
                    isExpanded: _panelExpansionsMode[3],
                    backgroundColor: AppColors.white,
                    headerBuilder: (context, isExpanded) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (!_panelExpansionsMode[3])
                            const SizedBox(height: 24),
                          const _RichText(title: 'Количество мест', count: 12),
                          const SizedBox(height: 8),
                          Text(
                            '${_filterParametes?.minPlaceCount ?? 1} – ${_filterParametes?.maxPlaceCount ?? 100}',
                            style: AppTextStyles.p.copyWith(
                              color: AppColors.black,
                            ),
                          ),
                          if (!_panelExpansionsMode[3]) ...[
                            Text(
                              'Место для младенца – ${_filterParametes?.babyPlaceCount ?? 0}',
                              style: AppTextStyles.p.copyWith(
                                color: AppColors.black,
                              ),
                            ),
                            const SizedBox(height: 24),
                          ]
                        ],
                      );
                    },
                    body: Column(
                      children: [
                        RangeSlider(
                          min: 1,
                          max: 100,
                          onChanged: _changePlaceCountParameter,
                          values: RangeValues(
                            (_filterParametes?.minPlaceCount ?? 1).toDouble(),
                            (_filterParametes?.maxPlaceCount ?? 100).toDouble(),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Text(
                                'Место для младенца',
                                style: AppTextStyles.p.copyWith(
                                  color: AppColors.black,
                                ),
                              ),
                            ),
                            FittedBox(
                              child: SizedBox(
                                width: 97,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        _changeBabyPlaceCountParameter(
                                            (_filterParametes?.babyPlaceCount ??
                                                    0) -
                                                1);
                                      },
                                      child:
                                          SvgPicture.asset(Assets.divideCircle),
                                    ),
                                    Text(
                                      '${_filterParametes?.babyPlaceCount ?? 0}',
                                      style: AppTextStyles.p.copyWith(
                                        color: AppColors.black,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        _changeBabyPlaceCountParameter(
                                            (_filterParametes?.babyPlaceCount ??
                                                    0) +
                                                1);
                                      },
                                      child:
                                          SvgPicture.asset(Assets.plusCircle),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  ExpansionPanel(
                    isExpanded: _panelExpansionsMode[4],
                    backgroundColor: AppColors.white,
                    headerBuilder: (context, isExpanded) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (!_panelExpansionsMode[4])
                            const SizedBox(height: 24),
                          const Text('Удобства', style: AppTextStyles.h3),
                          if (!_panelExpansionsMode[4]) ...[
                            const SizedBox(height: 8),
                            Text((_filterParametes?.facilityNames ?? [])
                                .join(', ')),
                          ],
                          const SizedBox(height: 24),
                        ],
                      );
                    },
                    body: GridView.builder(
                      itemCount: Assets.facilities.length,
                      shrinkWrap: true,
                      primary: false,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 16,
                        childAspectRatio: 1.7,
                      ),
                      itemBuilder: (_, index) {
                        return InkWell(
                          borderRadius: BorderRadius.circular(16),
                          onTap: () => _changeFacilitiesParameter(index),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 16,
                            ),
                            decoration: BoxDecoration(
                              color: !(_filterParametes?.facilityNames ?? [])
                                      .contains(_facilities[index])
                                  ? AppColors.white
                                  : AppColors.black10,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: AppColors.black25),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: Center(
                                    child: SvgPicture.asset(
                                      (Assets.facilities[index]),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                _RichText(
                                  title: _facilities[index],
                                  count: 12,
                                  style: AppTextStyles.lable,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  ExpansionPanel(
                    isExpanded: _panelExpansionsMode[5],
                    backgroundColor: AppColors.white,
                    headerBuilder: (context, isExpanded) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (!_panelExpansionsMode[5])
                            const SizedBox(height: 24),
                          const Text('Развлечения', style: AppTextStyles.h3),
                          if (!_panelExpansionsMode[5]) ...[
                            const SizedBox(height: 8),
                            Text((_filterParametes?.entertainmentNames ?? [])
                                .join(', '))
                          ],
                          const SizedBox(height: 24),
                        ],
                      );
                    },
                    body: GridView.builder(
                      itemCount: Assets.images.length,
                      shrinkWrap: true,
                      primary: false,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 16,
                      ),
                      itemBuilder: (_, index) {
                        if (!(_filterParametes?.entertainmentNames ?? [])
                            .contains(_entertaintments[index])) {
                          return InkWell(
                            borderRadius: BorderRadius.circular(16),
                            onTap: () => _changeEntertainmentsParameter(index),
                            child: Column(
                              children: [
                                Image.asset(
                                  Assets.images[index],
                                  width: double.infinity,
                                  fit: BoxFit.fitWidth,
                                ),
                                const SizedBox(height: 12),
                                _RichText(
                                  title: _entertaintments[index],
                                  count: 0,
                                  style: AppTextStyles.lable,
                                ),
                              ],
                            ),
                          );
                        }

                        return InkWell(
                          borderRadius: BorderRadius.circular(16),
                          onTap: () => _changeEntertainmentsParameter(index),
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(28, 28, 28, 0),
                            decoration: BoxDecoration(
                              color: AppColors.black10,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: AppColors.black25),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(Assets.images[index]),
                                const SizedBox(height: 16),
                                FittedBox(
                                  child: _RichText(
                                    title: _entertaintments[index],
                                    count: 12,
                                    style: AppTextStyles.lable,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(28, 16, 20, 20),
          decoration: BoxDecoration(
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 12,
                offset: const Offset(2, -4),
                color: AppColors.black.withOpacity(0.1),
              ),
            ],
          ),
          child: Row(
            children: [
              const Text('Очистить', style: AppTextStyles.p),
              const SizedBox(width: 24),
              Expanded(
                child: FilledButton(
                  onPressed: () => context.router.maybePop(),
                  child: Center(
                    child: Text(
                      'Показать 12 вариантов',
                      style: AppTextStyles.button.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _RichText extends StatelessWidget {
  const _RichText({
    required this.title,
    required this.count,
    this.style,
  });

  final String title;
  final int count;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: title,
        style: style ?? AppTextStyles.h3.copyWith(color: AppColors.black),
        children: [
          TextSpan(
            text: ' ($count)',
            style: (style ?? AppTextStyles.h3).copyWith(
              color: AppColors.black50,
            ),
          ),
        ],
      ),
    );
  }
}
