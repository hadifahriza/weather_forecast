import 'package:auto_route/auto_route.dart';
import 'package:weather_forecast/presentation/details/details_page.dart';
import 'package:weather_forecast/presentation/home/home_page.dart';

part 'route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'route')
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        /// routes go here
        AutoRoute(page: HomePageRoute.page, initial: true),
        AutoRoute(page: DetailsPageRoute.page),
      ];
}
