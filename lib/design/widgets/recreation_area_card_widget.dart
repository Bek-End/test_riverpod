import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:test_riverpod/common/constant/app_colors.dart';
import 'package:test_riverpod/common/constant/assets.dart';
import 'package:test_riverpod/common/router/app_router.gr.dart';
import 'package:test_riverpod/data/models/recreation_area_model.dart';

class RecreationAreaCardWidget extends StatefulWidget {
  const RecreationAreaCardWidget({
    super.key,
    required this.recreationArea,
  });

  final RecreationAreaModel recreationArea;

  @override
  State<RecreationAreaCardWidget> createState() =>
      _RecreationAreaCardWidgetState();
}

class _RecreationAreaCardWidgetState extends State<RecreationAreaCardWidget> {
  final _pageCtrl = PageController();

  RecreationAreaModel get _recreationArea => widget.recreationArea;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.router.push(DetailRecreationAreaRoute(
        recreationArea: widget.recreationArea,
      )),
      borderRadius: BorderRadius.circular(20),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              blurRadius: 12,
              offset: const Offset(2, 4),
              color: AppColors.black.withOpacity(0.1),
            ),
          ],
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    PageView.builder(
                      controller: _pageCtrl,
                      itemCount: _recreationArea.photos.length,
                      itemBuilder: (context, index) {
                        return AspectRatio(
                          aspectRatio: 1,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                            child: Image.asset(
                              _recreationArea.photos[index],
                              fit: BoxFit.cover,
                            ),
                          ),
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
                      top: 20,
                      right: 20,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(Assets.send),
                            const SizedBox(width: 6),
                            const Text('888 км'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(_recreationArea.name),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('8-10 июня'),
                        Text('${_recreationArea.viewCount} просм'),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${_recreationArea.minPeopleCount}-${_recreationArea.maxPeopleCount} гостей',
                        ),
                        Text('от ${_recreationArea.price} ₽'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
