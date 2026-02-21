// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$desktopWrapperRoute];

RouteBase get $desktopWrapperRoute => ShellRouteData.$route(
  factory: $DesktopWrapperRouteExtension._fromState,
  routes: [
    GoRouteData.$route(
      path: '/',
      name: 'Home',
      factory: $HomeRoute._fromState,
      routes: [
        GoRouteData.$route(
          path: 'add',
          name: 'Add Profile',
          parentNavigatorKey: AddProfileRoute.$parentNavigatorKey,
          factory: $AddProfileRoute._fromState,
        ),
        GoRouteData.$route(
          path: 'profiles',
          name: 'Profiles',
          parentNavigatorKey: ProfilesOverviewRoute.$parentNavigatorKey,
          factory: $ProfilesOverviewRoute._fromState,
        ),
        GoRouteData.$route(
          path: 'profiles/new',
          name: 'New Profile',
          parentNavigatorKey: NewProfileRoute.$parentNavigatorKey,
          factory: $NewProfileRoute._fromState,
        ),
        GoRouteData.$route(
          path: 'profiles/:id',
          name: 'Profile Details',
          parentNavigatorKey: ProfileDetailsRoute.$parentNavigatorKey,
          factory: $ProfileDetailsRoute._fromState,
        ),
        GoRouteData.$route(
          path: 'quick-settings',
          name: 'Quick Settings',
          parentNavigatorKey: QuickSettingsRoute.$parentNavigatorKey,
          factory: $QuickSettingsRoute._fromState,
        ),
      ],
    ),
    GoRouteData.$route(
      path: '/proxies',
      name: 'Proxies',
      factory: $ProxiesRoute._fromState,
    ),
    GoRouteData.$route(
      path: '/config-options',
      name: 'Config Options',
      factory: $ConfigOptionsRoute._fromState,
    ),
    GoRouteData.$route(
      path: '/wireguard-server',
      name: 'WireGuard Server',
      factory: $WireGuardServerRoute._fromState,
    ),
    GoRouteData.$route(
      path: '/settings',
      name: 'Settings',
      factory: $SettingsRoute._fromState,
    ),
    GoRouteData.$route(
      path: '/logs',
      name: 'Logs',
      factory: $LogsOverviewRoute._fromState,
    ),
    GoRouteData.$route(
      path: '/about',
      name: 'About',
      factory: $AboutRoute._fromState,
    ),
  ],
);

extension $DesktopWrapperRouteExtension on DesktopWrapperRoute {
  static DesktopWrapperRoute _fromState(GoRouterState state) =>
      const DesktopWrapperRoute();
}

mixin $HomeRoute on GoRouteData {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  @override
  String get location => GoRouteData.$location('/');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $AddProfileRoute on GoRouteData {
  static AddProfileRoute _fromState(GoRouterState state) =>
      AddProfileRoute(url: state.uri.queryParameters['url']);

  AddProfileRoute get _self => this as AddProfileRoute;

  @override
  String get location => GoRouteData.$location(
    '/add',
    queryParams: {if (_self.url != null) 'url': _self.url},
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $ProfilesOverviewRoute on GoRouteData {
  static ProfilesOverviewRoute _fromState(GoRouterState state) =>
      const ProfilesOverviewRoute();

  @override
  String get location => GoRouteData.$location('/profiles');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $NewProfileRoute on GoRouteData {
  static NewProfileRoute _fromState(GoRouterState state) =>
      const NewProfileRoute();

  @override
  String get location => GoRouteData.$location('/profiles/new');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $ProfileDetailsRoute on GoRouteData {
  static ProfileDetailsRoute _fromState(GoRouterState state) =>
      ProfileDetailsRoute(state.pathParameters['id']!);

  ProfileDetailsRoute get _self => this as ProfileDetailsRoute;

  @override
  String get location =>
      GoRouteData.$location('/profiles/${Uri.encodeComponent(_self.id)}');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $QuickSettingsRoute on GoRouteData {
  static QuickSettingsRoute _fromState(GoRouterState state) =>
      const QuickSettingsRoute();

  @override
  String get location => GoRouteData.$location('/quick-settings');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $ProxiesRoute on GoRouteData {
  static ProxiesRoute _fromState(GoRouterState state) => const ProxiesRoute();

  @override
  String get location => GoRouteData.$location('/proxies');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $ConfigOptionsRoute on GoRouteData {
  static ConfigOptionsRoute _fromState(GoRouterState state) =>
      ConfigOptionsRoute(section: state.uri.queryParameters['section']);

  ConfigOptionsRoute get _self => this as ConfigOptionsRoute;

  @override
  String get location => GoRouteData.$location(
    '/config-options',
    queryParams: {if (_self.section != null) 'section': _self.section},
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $WireGuardServerRoute on GoRouteData {
  static WireGuardServerRoute _fromState(GoRouterState state) =>
      const WireGuardServerRoute();

  @override
  String get location => GoRouteData.$location('/wireguard-server');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $SettingsRoute on GoRouteData {
  static SettingsRoute _fromState(GoRouterState state) => const SettingsRoute();

  @override
  String get location => GoRouteData.$location('/settings');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $LogsOverviewRoute on GoRouteData {
  static LogsOverviewRoute _fromState(GoRouterState state) =>
      const LogsOverviewRoute();

  @override
  String get location => GoRouteData.$location('/logs');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $AboutRoute on GoRouteData {
  static AboutRoute _fromState(GoRouterState state) => const AboutRoute();

  @override
  String get location => GoRouteData.$location('/about');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
