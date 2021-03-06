import '/import.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class PurchaseService {
  static Future<void> initAction() async {
    await Purchases.setup(dotenv.get('REVENUE_CAT_PUBLIC_KEY'));
    const isDebug = !bool.fromEnvironment('dart.vm.product');
    Purchases.setDebugLogsEnabled(isDebug);
  }

  static Future<void> login(String sub) async {
    if (sub == '') {
      return;
    }
    await Purchases.logIn(sub);
  }

  static Future<void> logout() async {
    await Purchases.logOut();
  }
}
