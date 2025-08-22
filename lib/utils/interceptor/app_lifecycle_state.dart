import 'package:get/get.dart';
import 'package:flutter/widgets.dart';

import '../helpers/logging_util.dart';

class AppLifecycleController extends GetxController
    with WidgetsBindingObserver {
  final lifecycleState = Rx<AppLifecycleState?>(null);

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    lifecycleState.value = state;

    // Handle your logic here
    switch (state) {
      case AppLifecycleState.resumed:
        Log.i("✅ App resumed");

        break;
      case AppLifecycleState.inactive:
        Log.i("⏸️ App inactive");

        break;
      case AppLifecycleState.paused:
        Log.i("🚫 App paused");
        break;
      case AppLifecycleState.detached:
        Log.i("🛑 App detached");
        break;
      case AppLifecycleState.hidden:
        Log.i("📵 App detached");
        break;
    }
  }
}
