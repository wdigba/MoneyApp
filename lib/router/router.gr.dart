// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    CoinRoute.name: (routeData) {
      final args = routeData.argsAs<CoinRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CoinScreen(
          key: args.key,
          coin: args.coin,
        ),
      );
    },
    ListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ListScreen(),
      );
    },
  };
}

/// generated route for
/// [CoinScreen]
class CoinRoute extends PageRouteInfo<CoinRouteArgs> {
  CoinRoute({
    Key? key,
    required CoinModel coin,
    List<PageRouteInfo>? children,
  }) : super(
          CoinRoute.name,
          args: CoinRouteArgs(
            key: key,
            coin: coin,
          ),
          initialChildren: children,
        );

  static const String name = 'CoinRoute';

  static const PageInfo<CoinRouteArgs> page = PageInfo<CoinRouteArgs>(name);
}

class CoinRouteArgs {
  const CoinRouteArgs({
    this.key,
    required this.coin,
  });

  final Key? key;

  final CoinModel coin;

  @override
  String toString() {
    return 'CoinRouteArgs{key: $key, coin: $coin}';
  }
}

/// generated route for
/// [ListScreen]
class ListRoute extends PageRouteInfo<void> {
  const ListRoute({List<PageRouteInfo>? children})
      : super(
          ListRoute.name,
          initialChildren: children,
        );

  static const String name = 'ListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
