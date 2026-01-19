import 'package:hiddify/utils/custom_loggers.dart';
import 'package:loggy/loggy.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class UriUtils {
  static final loggy = Loggy<InfraLogger>("UriUtils");

  static Future<bool> tryShareOrLaunchFile(Uri uri, {Uri? fileOrDir}) {
    // Windows: just launch the file/folder
    return tryLaunch(fileOrDir ?? uri);
  }

  static Future<bool> tryLaunch(Uri uri) async {
    try {
      loggy.debug("launching [$uri]");
      if (!await canLaunchUrl(uri)) {
        loggy.warning("can't launch [$uri]");
        return false;
      }
      return launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (e, stackTrace) {
      loggy.warning("error launching [$uri]", e, stackTrace);
      return false;
    }
  }
}
