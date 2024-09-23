import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:test_riverpod/common/constant/app_colors.dart';
import 'package:test_riverpod/common/constant/app_text_styles.dart';
import 'package:test_riverpod/common/constant/assets.dart';
import 'package:test_riverpod/common/extentions/string_extentions.dart';
import 'package:test_riverpod/design/widgets/circle_icon_widget.dart';
import 'package:test_riverpod/domain/entities/recreation_area_entity.dart';

@RoutePage()
class DetailRecreationAreaScreen extends StatefulWidget {
  const DetailRecreationAreaScreen({
    super.key,
    required this.recreationArea,
  });

  final RecreationAreaEntity recreationArea;

  @override
  State<DetailRecreationAreaScreen> createState() =>
      _DetailRecreationAreaScreenState();
}

class _DetailRecreationAreaScreenState
    extends State<DetailRecreationAreaScreen> {
  final _pageCtrl = PageController();

  RecreationAreaEntity get _recreationArea => widget.recreationArea;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 250,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                PageView.builder(
                  controller: _pageCtrl,
                  itemCount: _recreationArea.photos.length,
                  itemBuilder: (context, index) {
                    return Image.asset(
                      _recreationArea.photos[index],
                      width: double.infinity,
                      fit: BoxFit.fitWidth,
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: SmoothPageIndicator(
                    controller: _pageCtrl,
                    count: _recreationArea.photos.length,
                    effect: const ScrollingDotsEffect(
                      dotWidth: 8,
                      dotHeight: 8,
                      dotColor: AppColors.white,
                      activeDotColor: AppColors.white,
                    ),
                  ),
                ),
                Positioned(
                  top: 4,
                  left: 20,
                  child: InkWell(
                    onTap: () => context.router.maybePop(),
                    child: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(Assets.arrowLeft),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 12,
                  right: 17,
                  child: InkWell(
                    onTap: () {},
                    child: SafeArea(child: SvgPicture.asset(Assets.heart)),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 16),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(_recreationArea.name, style: AppTextStyles.h2),
                      const SizedBox(height: 16),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(Assets.mapImage),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              _recreationArea.address.replaceAll(',', ',\n'),
                              style: AppTextStyles.littleAddress,
                            ),
                          ),
                          const SizedBox(width: 96),
                          CircleIconWidget(icon: Assets.track, onTap: () {}),
                        ],
                      ),
                      const SizedBox(height: 38),
                      Row(
                        children: List.generate(
                          _ActionType.values.length,
                          (index) {
                            final item = _ActionType.values[index];
                            return Expanded(
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(color: AppColors.black25),
                                ),
                                child: Center(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SvgPicture.asset(item.icon),
                                      const SizedBox(height: 8),
                                      Text(
                                        item.label,
                                        style: AppTextStyles.lable,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 24,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.black5,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          _recreationArea.info,
                          style: AppTextStyles.p,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        _recreationArea.descr,
                        style: AppTextStyles.p.copyWith(color: AppColors.black),
                      ),
                      const SizedBox(height: 8),
                      InkWell(
                        onTap: () {},
                        child: const Text('Подробнее', style: AppTextStyles.p),
                      ),
                      const SizedBox(height: 32),
                      const Text('Развлечения', style: AppTextStyles.h2),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
                SizedBox(
                  height: 176,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _recreationArea.entertainments.length,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemBuilder: (_, index) {
                      final item = _recreationArea.entertainments[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.asset(
                                item.urlMedia,
                                width: 140,
                                height: 140,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              item.name,
                              style: AppTextStyles.p.copyWith(
                                color: AppColors.black,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 32),
                      const Text('Удобства', style: AppTextStyles.h2),
                      GridView.builder(
                        primary: false,
                        shrinkWrap: true,
                        itemCount: _recreationArea.facilities.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 9,
                          childAspectRatio: 2.8,
                        ),
                        itemBuilder: (_, index) {
                          final item = _recreationArea.facilities[index];
                          return Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 40,
                                    height: 40,
                                    child: Center(
                                      child: SvgPicture.asset(item.urlIcon),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(item.name, style: AppTextStyles.lable),
                                ],
                              ),
                              const SizedBox(height: 8),
                              const Divider(),
                            ],
                          );
                        },
                      ),
                      const SizedBox(height: 32),
                      const Text('Спальные места', style: AppTextStyles.h2),
                      const SizedBox(height: 20),
                      Column(
                        children: List.generate(
                          _recreationArea.bedPlaces.length,
                          (index) {
                            final item = _recreationArea.bedPlaces[index];
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(item.urlIcon),
                                    const SizedBox(width: 8),
                                    Expanded(
                                        child: Text(
                                      item.name,
                                      style: AppTextStyles.p.copyWith(
                                        color: AppColors.black,
                                      ),
                                    )),
                                    const SizedBox(width: 8),
                                    Text(
                                      '${item.count}',
                                      style: AppTextStyles.p.copyWith(
                                        color: AppColors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                if (item != _recreationArea.bedPlaces.last)
                                  const Divider(),
                              ],
                            );
                          },
                        ),
                      )
                    ],
                  ),
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
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${_recreationArea.minPeopleCount}-${_recreationArea.maxPeopleCount} гостей',
                      style: AppTextStyles.p,
                    ),
                    Text(
                      'от ${_recreationArea.price.toInt().toString().addSeparator()} ₽ ',
                      style: AppTextStyles.button,
                    ),
                  ],
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: FilledButton(
                    onPressed: () {},
                    child: Center(
                      child: Text(
                        'Забронировать',
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
      ),
    );
  }
}

enum _ActionType { call, sms, share }

extension _ActionTypeExtentions on _ActionType {
  String get icon {
    switch (this) {
      case _ActionType.call:
        return Assets.phone;
      case _ActionType.sms:
        return Assets.messageCircle;
      case _ActionType.share:
        return Assets.logOut;
    }
  }

  String get label {
    switch (this) {
      case _ActionType.call:
        return 'Позвонить';
      case _ActionType.sms:
        return 'Написать';
      case _ActionType.share:
        return 'Поделиться';
    }
  }
}
