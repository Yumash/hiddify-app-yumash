import 'package:hiddify/singbox/service/singbox_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'singbox_service_provider.g.dart';

@Riverpod(keepAlive: true)
SingboxService singboxService(Ref ref) {
  return SingboxService();
}
