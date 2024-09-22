import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_riverpod/common/constant/app_colors.dart';
import 'package:test_riverpod/common/constant/assets.dart';
import 'package:test_riverpod/design/widgets/bar_chart_widget.dart';
import 'package:test_riverpod/design/widgets/text_form_field_widget.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({super.key});

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  late final _dateCtrl = TextEditingController();

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
              const Text('Фильтры'),
              const SizedBox(height: 22),
              const Text('Даты поездки (212)'),
              const SizedBox(height: 16),
              TextFormFieldWidget(
                controller: _dateCtrl,
                readOnly: true,
                suffixIcon: InkWell(
                  onTap: () {},
                  child: SvgPicture.asset(Assets.calendar),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.black25),
                ),
                child: Row(
                  children: [
                    const Text('Ближайшие'),
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
                      return const Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Ценовой диапазон (12)'),
                          Text('6 000 ₽ – 34 000 ₽'),
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
                          const Text('Отдаленость (12)'),
                          Row(
                            children: [
                              SvgPicture.asset(Assets.send,
                                  width: 12, height: 12),
                              const SizedBox(width: 8),
                              const Text('300 км'),
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
                      return const Text('Удобства');
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
                              const Text('A-Frame (12)'),
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
                      return const Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Количество мест (12)'),
                          Text('2 – 16'),
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
                            const Expanded(child: Text('Место для младенца')),
                            FittedBox(
                              child: SizedBox(
                                width: 97,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SvgPicture.asset(Assets.divideCircle),
                                    const Text('1'),
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
                      return const Text('Удобства');
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
                              const Text('Мангал (12)'),
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
                      return const Text('Развлечения');
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
                              const Text('Джакузи (0)')
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
                              const Text('Водоем (12)'),
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
              const Text('Очистить'),
              const SizedBox(width: 24),
              Expanded(
                child: FilledButton(
                  onPressed: () {},
                  child: const Center(child: Text('Показать 12 вариантов')),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
