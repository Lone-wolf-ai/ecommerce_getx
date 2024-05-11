import 'package:get/get.dart';
import 'package:getx_ecommerce/utils/helpers/network_manager.dart';

class GeneralBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(NetworkManager());
  }
}