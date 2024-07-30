import 'dart:io';

class GlobalUtils {
  //Getting the platform info
  static bool mobile = Platform.isAndroid || Platform.isIOS;
  static bool desktop = Platform.isLinux || Platform.isWindows;
}
