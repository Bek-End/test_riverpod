import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_riverpod/common/constant/app_colors.dart';
import 'package:test_riverpod/common/constant/app_text_styles.dart';
import 'package:test_riverpod/common/constant/assets.dart';
import 'package:test_riverpod/design/widgets/bar_chart_widget.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({super.key});

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
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
                    const Expanded(
                      child: Text(
                        'Ближайшие',
                        style: AppTextStyles.button,
                      ),
                    ),
                    const SizedBox(width: 12),
                    InkWell(
                      onTap: () {},
                      child: SvgPicture.asset(Assets.calendar),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Divider(),
              ExpansionPanelList(
                elevation: 0,
                expandIconColor: AppColors.black,
                children: [
                  ExpansionPanel(
                    isExpanded: true,
                    backgroundColor: AppColors.white,
                    headerBuilder: (context, isExpanded) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const _RichText(title: 'Ценовой диапазон', count: 12),
                          Text(
                            '6 000 ₽ – 34 000 ₽',
                            style: AppTextStyles.p.copyWith(
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      );
                    },
                    body: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.bottomCenter,
                      children: [
                        const Column(
                          children: [
                            BarChartWidget(),
                            SizedBox(height: 23),
                          ],
                        ),
                        Slider(
                          value: 0.22,
                          onChanged: (_) {},
                        ),
                      ],
                    ),
                  ),
                  ExpansionPanel(
                    isExpanded: true,
                    backgroundColor: AppColors.white,
                    headerBuilder: (context, isExpanded) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const _RichText(title: 'Отдаленость', count: 12),
                          Row(
                            children: [
                              SvgPicture.asset(Assets.send,
                                  width: 12, height: 12),
                              const SizedBox(width: 8),
                              Text(
                                '300 км',
                                style: AppTextStyles.p.copyWith(
                                  color: AppColors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                    body: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.bottomCenter,
                      children: [
                        const Column(
                          children: [
                            BarChartWidget(),
                            SizedBox(height: 23),
                          ],
                        ),
                        Slider(
                          value: 0.22,
                          onChanged: (_) {},
                        ),
                      ],
                    ),
                  ),
                  ExpansionPanel(
                    isExpanded: true,
                    backgroundColor: AppColors.white,
                    headerBuilder: (context, isExpanded) {
                      return const Text('Дома', style: AppTextStyles.h3);
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
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 16,
                          ),
                          decoration: BoxDecoration(
                            color: index.isEven
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
                              const _RichText(
                                title: 'A-Frame',
                                count: 12,
                                style: AppTextStyles.lable,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  ExpansionPanel(
                    isExpanded: true,
                    backgroundColor: AppColors.white,
                    headerBuilder: (context, isExpanded) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const _RichText(title: 'Количество мест', count: 12),
                          Text(
                            '2 – 16',
                            style: AppTextStyles.p.copyWith(
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      );
                    },
                    body: Column(
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
                            Slider(
                              value: 0.22,
                              onChanged: (_) {},
                            ),
                          ],
                        ),
                        const SizedBox(height: 29),
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
                                    SvgPicture.asset(Assets.divideCircle),
                                    Text(
                                      '1',
                                      style: AppTextStyles.p.copyWith(
                                        color: AppColors.black,
                                      ),
                                    ),
                                    SvgPicture.asset(Assets.plusCircle),
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
                    isExpanded: true,
                    backgroundColor: AppColors.white,
                    headerBuilder: (context, isExpanded) {
                      return const Text('Удобства', style: AppTextStyles.h3);
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
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 16,
                          ),
                          decoration: BoxDecoration(
                            color: index.isEven
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
                              const _RichText(
                                title: 'Мангал',
                                count: 12,
                                style: AppTextStyles.lable,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  ExpansionPanel(
                    isExpanded: true,
                    backgroundColor: AppColors.white,
                    headerBuilder: (context, isExpanded) {
                      return const Text('Развлечения', style: AppTextStyles.h3);
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
                        if (index.isEven) {
                          return Column(
                            children: [
                              Image.asset(
                                Assets.images[index],
                                width: double.infinity,
                                fit: BoxFit.fitWidth,
                              ),
                              const SizedBox(height: 12),
                              const _RichText(
                                title: 'Джакузи',
                                count: 0,
                                style: AppTextStyles.lable,
                              ),
                            ],
                          );
                        }

                        return Container(
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
                              const _RichText(
                                title: 'Водоем',
                                count: 12,
                                style: AppTextStyles.lable,
                              ),
                            ],
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
                  onPressed: () {},
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
