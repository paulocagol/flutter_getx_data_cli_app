import 'package:flutter_data/flutter_data.dart';
import 'package:flutter_getx_data_cli_app/app/data/model/user.dart';
import 'package:flutter_getx_data_cli_app/app/data/repository/user_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final UserRepository repository;

  HomeController({this.repository}) : assert(repository != null);

  var repoUser = Future<Rx<Repository<User>>>(null);
  
  @override
  void onInit() async {
    super.onInit();
    repoUser = repository.getRepoUser();
  }

}
