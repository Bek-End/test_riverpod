import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_riverpod/common/constant/app_colors.dart';
import 'package:test_riverpod/common/constant/app_text_styles.dart';
import 'package:test_riverpod/common/constant/assets.dart';
import 'package:test_riverpod/common/enums/house_type.dart';
import 'package:test_riverpod/design/logic/recreation_area/recreation_area_bloc.dart';
import 'package:test_riverpod/design/widgets/bottom_sheet_with_header.dart';
import 'package:test_riverpod/design/widgets/circle_icon_widget.dart';
import 'package:test_riverpod/design/widgets/filter_widget.dart';
import 'package:test_riverpod/design/widgets/recreation_area_card_widget.dart';
import 'package:test_riverpod/design/widgets/text_form_field_widget.dart';

@RoutePage()
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late final _searchCtrl = TextEditingController()..addListener(_listen);

  void _listen() {}

  int _currMenuIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecreationAreaBloc, RecreationAreaState>(
      builder: (context, state) {
        if (state is! RecreationAreaCompletedState) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

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
                      CircleIconWidget(
                        icon: Assets.filter,
                        onTap: () => BottomSheetWithHeader.show(
                          context: context,
                          child: const FilterWidget(),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: FittedBox(
                    child: Row(
                      children: List.generate(
                        HouseType.values.length,
                        (index) {
                          final item = HouseType.values[index];
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
                    itemCount: state.recreationAreas.length,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemBuilder: (context, index) {
                      return RecreationAreaCardWidget(
                        recreationArea: state.recreationAreas[index],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: FloatingActionButton.extended(
              backgroundColor: AppColors.black,
              onPressed: () {},
              label: Text(
                'На карте',
                style: AppTextStyles.button.copyWith(color: AppColors.white),
              ),
              icon: SvgPicture.asset(Assets.map),
            ),
          ),
        );
      },
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
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
              Text(
                label,
                style: AppTextStyles.little.copyWith(
                  color: isChecked ? AppColors.black : AppColors.black50,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
