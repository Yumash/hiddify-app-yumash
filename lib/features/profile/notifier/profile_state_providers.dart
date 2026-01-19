import 'package:hiddify/features/profile/data/profile_data_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_state_providers.g.dart';

/// Watches whether there are any profiles in the database.
/// Used for showing empty state on home screen.
@Riverpod(keepAlive: true)
Stream<bool> hasAnyProfile(Ref ref) {
  return ref
      .watch(profileRepositoryProvider)
      .requireValue
      .watchHasAnyProfile()
      .map((event) => event.getOrElse((err) => throw err));
}
