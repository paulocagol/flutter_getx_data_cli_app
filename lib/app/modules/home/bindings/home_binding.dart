import 'package:flutter_getx_data_cli_app/app/container/container_data.dart';
import 'package:flutter_getx_data_cli_app/app/data/provider/user_provider.dart';
import 'package:flutter_getx_data_cli_app/app/data/repository/user_repository.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(repository: UserRepository(provider: UserProvider(container: ContainerData()))),
    );
  }
}
