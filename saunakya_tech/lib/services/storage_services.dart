import 'package:shared_preferences/shared_preferences.dart';
import '../utils/constant/app_constant.dart';

class StorageService {
  late final SharedPreferences _prefs;

  Future<StorageService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  bool getDeviceFirstOpen() {
    return _prefs.getBool(AppConstant.deviceFirstTime) ?? false;
  }
}
