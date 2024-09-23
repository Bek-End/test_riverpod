// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:test_riverpod/design/screens/detail_recreation_area_screen.dart'
    as _i1;
import 'package:test_riverpod/design/screens/home_screen.dart' as _i2;
import 'package:test_riverpod/domain/entities/recreation_area_entity.dart'
    as _i5;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    DetailRecreationAreaRoute.name: (routeData) {
      final args = routeData.argsAs<DetailRecreationAreaRouteArgs>();
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.DetailRecreationAreaScreen(
          key: args.key,
          recreationArea: args.recreationArea,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.DetailRecreationAreaScreen]
class DetailRecreationAreaRoute
    extends _i3.PageRouteInfo<DetailRecreationAreaRouteArgs> {
  DetailRecreationAreaRoute({
    _i4.Key? key,
    required _i5.RecreationAreaEntity recreationArea,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          DetailRecreationAreaRoute.name,
          args: DetailRecreationAreaRouteArgs(
            key: key,
            recreationArea: recreationArea,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailRecreationAreaRoute';

  static const _i3.PageInfo<DetailRecreationAreaRouteArgs> page =
      _i3.PageInfo<DetailRecreationAreaRouteArgs>(name);
}

class DetailRecreationAreaRouteArgs {
  const DetailRecreationAreaRouteArgs({
    this.key,
    required this.recreationArea,
  });

  final _i4.Key? key;

  final _i5.RecreationAreaEntity recreationArea;

  @override
  String toString() {
    return 'DetailRecreationAreaRouteArgs{key: $key, recreationArea: $recreationArea}';
  }
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i3.PageRouteInfo<void> {
  const HomeRoute({List<_i3.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}
