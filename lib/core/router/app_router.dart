import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hiddify/core/router/routes.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

@riverpod
GoRouter router(Ref ref) {
  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: const HomeRoute().location,
    debugLogDiagnostics: true,
    routes: [
      $desktopWrapperRoute,
    ],
    observers: [],
  );
}

final tabLocations = [
  const HomeRoute().location,
  const ProxiesRoute().location,
  const ConfigOptionsRoute().location,
  const SettingsRoute().location,
  const LogsOverviewRoute().location,
  const AboutRoute().location,
];

int getCurrentIndex(BuildContext context) {
  final String location = GoRouterState.of(context).uri.path;
  if (location == const HomeRoute().location) return 0;
  var index = 0;
  for (final tab in tabLocations.sublist(1)) {
    index++;
    if (location.startsWith(tab)) return index;
  }
  return 0;
}

void switchTab(int index, BuildContext context) {
  assert(index >= 0 && index < tabLocations.length);
  final location = tabLocations[index];
  return context.go(location);
}
