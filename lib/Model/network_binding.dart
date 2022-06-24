
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

import '../Controller/internet_connectivity_controller.dart';

class NetworkBinding extends Bindings{

  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<InternetConnectivity>(() => InternetConnectivity());
  }
}