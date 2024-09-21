import 'package:auto_route/auto_route.dart';
import 'package:test_riverpod/common/router/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true, path: '/'),
        AutoRoute(page: DetailRecreationAreaRoute.page, path: '/detail'),
      ];
}
